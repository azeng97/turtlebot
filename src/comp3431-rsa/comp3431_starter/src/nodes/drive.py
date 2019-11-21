
import numpy as np
import cv2
#from skimage import morphology
#from simple_pid import PID
import perpective_transform
from matplotlib import pyplot as plt
from glob import glob
import subprocess
import rospy
from tf import TransformListener
from std_msgs.msg import Int8, Float64, Float64MultiArray, String
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
from visualization_msgs.msg import Marker
import time

from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs.point_cloud2 as pc2

import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from locate import contours_from_range, find_beacon

from geometry_msgs.msg import Twist
import time
from locate2 import get_processed_img

LEFT = -1
RIGHT = 1
NONE = 0
RVIZ = True
TOP = 699
CENTER = 397
WIDTH = 47
CONTROL_CENTER = 390


class Control():
    lastAdjustmentTurnTime = 100
    adjustmentCertainty = 0
    cornerAdjustmentTurn = NONE
    timeSpentAdjusting = 0

    def __init__(self, img, twist):
        self.img = img
        self.rvizImg = img
        self.hitHeight = self.findHitHeight(self.img)
        self.useStabilise = (self.hitHeight > 100)

        self.twist = twist
        self.twist.linear.x = 0.05
        self.twist.linear.y = self.twist.linear.z = 0
        self.twist.angular.x = self.twist.angular.y = 0

        # Things to correct corners
        

    def findHitHeight(self, img):

        for hitHeight in range(TOP):
            for hitHeightDistFromCenter in range(3): # To avoid going through holes in lines
                if ((TOP - hitHeight >= 0 and img[TOP - hitHeight, CENTER - hitHeightDistFromCenter]
                        or img[TOP - hitHeight, CENTER + hitHeightDistFromCenter])):
                    return hitHeight

        for hitHeight in range(TOP):
            for hitHeightRange in range(15):
                if ((TOP - hitHeight - hitHeightRange >= 0 and img[TOP - hitHeight - hitHeightRange, CENTER])
                        or (TOP - hitHeight + hitHeightRange < 700 and img[TOP - hitHeight + hitHeightRange, CENTER])):
                    return hitHeight - hitHeightRange
        
        return 699

        
    # Returns True or False depending on whether a stop line has been detected
    def detectStopLine(self, img):
        dist = 70
        errors = 0
        for n in range(10):
            left = right = 0
            for x in range(50):
                if img[TOP - self.hitHeight + 5 * n, CENTER - x]:
                    left = CENTER - x
                    break
            for x in range(50):
                if img[TOP - self.hitHeight + 5 * n, CENTER + x]:
                    right = CENTER + x
                    break

            if abs(dist-(right-left)) > 10 or right == 0 or left == 0: # 5 is the margin of error ADJUST THIS
                errors += 1
                if errors > 1: # Maximum number of errors
                    return False
        print("errors", errors)
        
        return True



        for y in range(70):
            # Check if there is a line in front, and then if lines on either side coming
            # back towards the robot (which are roughly the same distance apart)
            if img[150-y, CENTER]: # Line directly in front
                dist = 40 # TODO SET THIS TO THE PIXEL WIDTH OF THE LANE
                errors = 0
                for n in range(5):
                    left = right = 0
                    for x in range(30): # ADJUST THIS RANGE
                        if img[150-y - 10*n][CENTER-x]:
                            left = CENTER-x
                            break
                    for x in range(30):
                        if img[150-y - 10*n][CENTER+x]:
                            right = CENTER+x
                            break
                    print("left", left)
                    print("right", right)
                    print("dist", abs(dist-(right-left)))
                if abs(dist-(right-left)) > 5 or right == 0 or left == 0: # 5 is the margin of error ADJUST THIS
                    errors += 1
                    if errors > 1: # Maximum number of errors
                        return False
        return True

    def useRviz(self):
        bridge = CvBridge()
        image_pub = rospy.Publisher("image_topic_2", Image, queue_size=1)
        self.rvizImg[0:699, CENTER] = 255
        msg = bridge.cv2_to_imgmsg(self.rvizImg, "mono8")
        image_pub.publish(msg)

    def step(self):
        print("hitHeight = ", self.hitHeight)
        if (self.hitHeight > 70 and self.hitHeight < 150 and self.detectStopLine(self.img)):
            print("stop")
        Control.lastAdjustmentTurnTime += 1
        if Control.lastAdjustmentTurnTime > 50 and self.hitHeight > 80 and self.hitHeight < 200:
            if Control.cornerAdjustmentTurn == NONE or Control.adjustmentCertainty < 10:
                Control.cornerAdjustmentTurn = self.detectCornerTurn(self.hitHeight, self.img)
                if Control.cornerAdjustmentTurn == LEFT:
                    print("next corner turn = LEFT")
                elif Control.cornerAdjustmentTurn == RIGHT:
                    print("next corner turn = RIGHT")
                else:
                    print("next corner turn = NONE")

        if (self.hitHeight > 100 or self.useStabilise):
            self.stabilise()
            self.twist.linear.x = 0.2
            print("1", self.twist.angular.z)
            cmd_vel_pub.publish(self.twist)
        elif self.hitHeight > 50:
            #self.twist.angular.z = 0
            self.twist.linear.x = 0.1
            cmd_vel_pub.publish(self.twist)
            print("2", self.twist.angular.z)
        else:
            self.twist.linear.x = 0.05
            if (self.hitHeight < 25):
                self.turnNow()
                print("4", self.twist.angular.z)
            else:
                print("3", self.twist.angular.z)
            
            cmd_vel_pub.publish(self.twist)

        if RVIZ:
            self.useRviz()
            
    def detectCornerTurn(self, atHeight, img):
        next_turn = NONE
        lefts, rights = [], []
        for scanForcedTurn in range(80):
            for width in range(75):
                if img[TOP - atHeight + scanForcedTurn, CENTER - width]:
                    lefts.append(width)
                    break
            for width in range(75):
                if img[TOP - atHeight + scanForcedTurn, CENTER + width]:
                    rights.append(width)
                    break

        if Control.lastAdjustmentTurnTime > 50:
            if len(rights) < 60:
                next_turn = RIGHT
            elif len(lefts) < 60:
                next_turn = LEFT

        if next_turn == Control.cornerAdjustmentTurn:
            Control.adjustmentCertainty += 1
        elif next_turn != NONE:
            Control.adjustmentCertainty = 0
        print(next_turn)
        return next_turn

    def completeAdjustment(self):
        Control.timeSpentAdjusting = 0
        Control.lastAdjustmentTurnTime = 0
        Control.cornerAdjustmentTurn = NONE
        Control.adjustmentCertainty = 0

    #To be called when hitHeight < 1. Either adjust, or turn based off the line orientation
    def turnNow(self):
        if Control.timeSpentAdjusting > 30:
            self.completeAdjustment()
        print("adjustment", Control.cornerAdjustmentTurn)
        print("time", Control.timeSpentAdjusting)
        if Control.cornerAdjustmentTurn == LEFT:
            self.twist.angular.z = 0.3
            Control.timeSpentAdjusting += 1
            print("forced turn LEFT")
        elif Control.cornerAdjustmentTurn == RIGHT:
            self.twist.angular.z = -0.3
            Control.timeSpentAdjusting += 1
            print("forced turn RIGHT")
        else:
            lefts, rights = self.findLineOrientation(self.hitHeight, self.img)
            avgLefts = np.mean(lefts)
            avgRights = np.mean(rights)
            if (avgLefts < avgRights + 1):
                print("lefts higher than right, turn left", avgLefts, avgRights)
                self.twist.angular.z = 0.2
            elif (avgRights < avgLefts + 1):
                print("rights higher than left, turn right", avgLefts, avgRights)
                self.twist.angular.z = -0.2
            else:
                self.twist.angular.z = 0


    def stabilise(self):
        
        lefts, rights = [], []
        for height in range(min(self.hitHeight, 100)):
            for width in range(60):
                if self.img[TOP-height, CONTROL_CENTER-width]:
                    if width == 0: # the line is too close to the middle to classify as left
                        break
                    lefts.append(width)
                    break
            for width in range(60):
                if self.img[TOP-height, CONTROL_CENTER+width]:
                    if width == 0:
                        break
                    rights.append(width)
                    break
        if lefts and rights:
            mid = (2*CONTROL_CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
        elif lefts:
            mid = CONTROL_CENTER - int(np.mean(lefts)) + WIDTH
        elif rights:
            mid = CONTROL_CENTER + int(np.mean(rights)) - WIDTH
        else:
            self.twist.angular.z = 0
            return
        control = mid - CONTROL_CENTER
        control = control/100.0
        self.twist.angular.z = -control

    def findLineOrientation(self, atHeight, img):
        # lefts, rights = [], []
        # for scanRights in range(50):
        #     for rightHeight in range(20):
        #         if (TOP - atHeight + rightHeight < 700) and img[TOP - atHeight + rightHeight, CENTER + scanRights]:
        #             rights.append(TOP - atHeight + rightHeight)
        #             break
        #         if img[TOP - atHeight - rightHeight, CENTER + scanRights]:
        #             rights.append(TOP - atHeight - rightHeight)
        #             break
                        

        # for scanlefts in range(50):
        #     for leftHeight in range(20):
        #         if (TOP - atHeight + leftHeight < 700):
        #             if (TOP - atHeight + leftHeight < 700) and img[TOP - atHeight + leftHeight, CENTER + scanlefts]:
        #                 lefts.append(TOP - atHeight + leftHeight)
        #                 break
        #             if img[TOP - atHeight - leftHeight, CENTER + scanlefts]:
        #                 lefts.append(TOP - atHeight - leftHeight)
        #                 break
        
        # print(lefts, rights)
        # if (lefts and rights):
        #     self.rvizImg[np.mean(lefts), CENTER - 200: CENTER] = 255
        #     self.rvizImg[np.mean(rights), CENTER: CENTER + 200] = 255
        # return lefts, rights
        lefts = []
        for scanLefts in range(50):
            for scanHeight in range(30): #see where there is a black pixel directly on top of a white pixel (the top of the tape)
                if (TOP - atHeight + scanHeight < 700 and img[TOP - atHeight + scanHeight, CENTER - scanLefts]
                        and not img[TOP - atHeight + scanHeight - 1, CENTER - scanLefts]):
                    lefts.append(TOP - atHeight + scanHeight)
                    break
                if (img[TOP - atHeight - scanHeight, CENTER - scanLefts]
                        and not img[TOP - atHeight - scanHeight - 1, CENTER - scanLefts]):
                    lefts.append(TOP - atHeight - scanHeight)
                    break

        rights = []
        for scanRights in range(50):
            for scanHeight in range(30): #see where there is a black pixel directly on top of a white pixel (the top of the tape)
                if (TOP - atHeight + scanHeight < 700 and img[TOP - atHeight + scanHeight, CENTER + scanRights]
                        and not img[TOP - atHeight + scanHeight - 1, CENTER + scanRights]):
                    rights.append(TOP - atHeight + scanHeight)
                    break
                if (img[TOP - atHeight - scanHeight, CENTER + scanRights]
                        and not img[TOP - atHeight - scanHeight - 1, CENTER + scanRights]):
                    rights.append(TOP - atHeight - scanHeight)
                    break
        if not lefts:
            lefts = [0]
        if not rights:
            rights = [0]
        print(lefts, rights)
        if (lefts and rights):
            self.rvizImg[np.mean(lefts), CENTER - 200: CENTER] = 255
            self.rvizImg[np.mean(rights), CENTER: CENTER + 200] = 255
        return lefts, rights


def detect_stop_line(img):

    foundLeft = False
    foundRight = False
    for hitHeight in range(100):
        if img[TOP - hitHeight, CENTER]:
            return False
    for hitHeight in range(100, 200):
        if img[TOP - hitHeight, CENTER] and not img[TOP - hitHeight - 30, CENTER]:
            
            for sides in range(25):
                if img[TOP - hitHeight + 30, CENTER + sides]:
                    foundRight = True
                    print("foundRight")
                if img[TOP - hitHeight + 30, CENTER - sides]:
                    foundLeft = True
                    print("foundLeft")
            break
    if (foundLeft and foundRight):
        show(img)
    return foundLeft and foundRight





def getProcessedImg(pixel_data):
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(pixel_data, "rgb8")
    pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    pts2 = np.float32([[360,700],[450,700],[0,0],[640,380]])
    
    M = cv2.getPerspectiveTransform(pts1,pts2)
    dst = cv2.warpPerspective(img,M,(640,700))
    img = dst
    m = mask(img, (150, 150, 150), (255, 255, 255))
    m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
    m = cv2.dilate(m, kernel, iterations=10)
    m[m>0] = 255
    img = m
    return img



    

    

    


def callback(pixel_data):
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(pixel_data, "rgb8")
    img = get_processed_img(img)
    #img = getProcessedImg(pixel_data)
    control = Control(img, twist)
    control.step()
    



    # global certainty
    # global next_turn
    # global time_spent_turning
    # global time_after_last_forced_turn
    # global turn
    # global rightvotes
    # global leftvotes
    # global forcedTurn
    # global useControl
    # global aboutToCrossStopLine
    # CENTER = 400
    # TOP = 699
    # #WIDTH = 38
    # WIDTH = 38

    # pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    # pts2 = np.float32([[360,700],[450,700],[0,0],[640,380]])

    # bridge = CvBridge()
    # img = bridge.imgmsg_to_cv2(pixel_data, "rgb8")

    # M = cv2.getPerspectiveTransform(pts1,pts2)

    # dst = cv2.warpPerspective(img,M,(640,700))
    # img = dst
    # #show(img)

    # m = mask(img, (150, 150, 150), (255, 255, 255))
    # m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    # kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
    # m = cv2.dilate(m, kernel, iterations=10)
    # m[m>0] = 255
    # #show(m)
    # img = m
    # #img = find_skeleton3(img)
    

    # lefts, rights = [], []
    # forcedLefts, forcedRights = [], []
    # savedHitHeight = 0
    # turnNow = False
    # twist.linear.x = 0.05
    # twist.linear.y = twist.linear.z = 0
    # twist.angular.x = twist.angular.y = 0
    # stabilise = False
    # if detect_stop_line(img):
    #     useControl = True
    # for hitHeight in range(TOP):
    #     foundHit = False
    #     for scanHitHeight in range(15):
    #         if ((TOP - hitHeight - scanHitHeight >= 0 and img[TOP - hitHeight - scanHitHeight, CENTER])
    #                 or (TOP - hitHeight + scanHitHeight < 700 and img[TOP - hitHeight + scanHitHeight, CENTER])):
    #             foundHit = True
    #             for scanRights in range(50):
    #                 for scanRightHitHeight in range(20):
    #                     if (TOP - hitHeight + scanRightHitHeight < 700 and
    #                             img[TOP - hitHeight + scanRightHitHeight, CENTER + scanRights]):
    #                         rights.append(TOP - hitHeight + scanRightHitHeight)
    #                         break
    #                     if (TOP - hitHeight - scanRightHitHeight < 700 and
    #                             img[TOP - hitHeight - scanRightHitHeight, CENTER + scanRights]):
    #                         rights.append(TOP - hitHeight - scanRightHitHeight)

    #             for scanLefts in range(50):
    #                 for scanLeftHitHeight in range(20):
    #                     if (TOP - hitHeight + scanLeftHitHeight < 700 and
    #                             img[TOP - hitHeight + scanLeftHitHeight, CENTER - scanLefts]):
    #                         lefts.append(TOP - hitHeight + scanLeftHitHeight)
    #                         break
    #                     if (TOP - hitHeight - scanLeftHitHeight < 700 and
    #                             img[TOP - hitHeight - scanLeftHitHeight, CENTER - scanLefts]):
    #                         lefts.append(TOP - hitHeight - scanLeftHitHeight)
    #             break


    #     if time_after_last_forced_turn > 50 and foundHit and hitHeight > 80 and hitHeight < 200:
    #         for scanForcedTurn in range(80):
    #             for width in range(75):
    #                 if img[TOP - hitHeight + scanForcedTurn, CENTER - width]:
    #                     forcedLefts.append(width)
    #                     break
    #             for width in range(75):
    #                 if img[TOP - hitHeight + scanForcedTurn, CENTER + width]:
    #                     forcedRights.append(width)
    #                     break
    #     if foundHit:
    #         savedHitHeight = hitHeight
    #         if hitHeight > 100:
    #             stabilise = True
    #         if hitHeight < 50:
    #             twist.linear.x = 0.05
    #         elif hitHeight < 100:
    #             twist.linear.x = 0.1
    #         else:
    #             twist.linear.x = 0.2
    #         if hitHeight < 1:
    #             turnNow = True
    #             aboutToCrossStopLine = True
    #         break
    #     if aboutToCrossStopLine and hitHeight > 30:
    #         aboutToCrossStopLine = False
    #         useControl = False
    #         print("stop")
    #         twist.linear.x = 0
    #         cmd_vel_pub.publish(twist)
    #         time.sleep(2)
            

    # if time_after_last_forced_turn > 50:
    #     if savedHitHeight > 80 and len(forcedRights) < 60:
    #         next_turn = RIGHT
    #         forcedTurn = True
    #     elif savedHitHeight > 80 and len(forcedLefts) < 60:
    #         next_turn = LEFT
    #         forcedTurn = True
    #     elif next_turn != NONE:
    #         forcedTurn = True
    
    # # if next_turn == LEFT:
    # #     print("next forced turn = LEFT")
    # # elif next_turn == RIGHT:
    # #     print("next forced turn = RIGHT")
    # # else:
    # #     print("next forced turn = ???")

    
    # avgLefts = np.mean(lefts)
    # avgRights = np.mean(rights)
    # #print(avgLefts, " and ", avgRights)
    # displayHeightLines = False
    # # if (lefts and rights):
    # #     if (avgLefts < avgRights):
    # #         print("left higher than right, turn left")
    # #     else:
    # #         print("left lower than right, turn right")
    # #     displayHeightLines = True

        
    



    

    # if turnNow and not useControl:

    #     if time_spent_turning > 50:
    #         time_spent_turning = 0
    #         time_after_last_forced_turn = 0
    #         forcedTurn = False
    #         next_turn = NONE

    #     if next_turn == LEFT and forcedTurn:
    #         twist.angular.z = 0.18
    #         time_spent_turning += 1
    #         #print("forced turning left")
    #     elif next_turn == RIGHT and forcedTurn:
    #         twist.angular.z = -0.18
    #         time_spent_turning += 1
    #         #print("forced turning right")
    #     elif (lefts and rights):
    #         if (avgLefts < avgRights):
    #             twist.angular.z = 0.18
    #             #print("left")
    #         else:
    #             twist.angular.z = -0.18
    #             #print("right")
    #     else:
    #         twist.angular.z = 0
            
    # else:
    #     lefts, rights = [], []
    #     for height in range(min(savedHitHeight, 100)):
    #         for width in range(60):
    #             if img[TOP-height, CENTER-width]:
    #                 if width == 0: # the line is too close to the middle to classify as left
    #                     break
    #                 lefts.append(width)
    #                 #print("left", width)
    #                 break
    #         for width in range(60):
    #             if img[TOP-height, CENTER+width]:
    #                 if width == 0:
    #                     break
    #                 rights.append(width)
    #                 #print("right", width)
    #                 break
    #     if lefts and rights:
    #         mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
    #     elif lefts:
    #         mid = CENTER - int(np.mean(lefts)) + WIDTH
    #     elif rights:
    #         mid = CENTER + int(np.mean(rights)) - WIDTH
    #     else:
    #         twist.angular.z = 0
    #         #print("control none")
    #         cmd_vel_pub.publish(twist)
    #         return
    #     control = mid - CENTER
    #     img[600:690, mid] = 255
    #     img[500:690, CENTER] = 255
        
    #     # control = pid(control)/100.0
    #     control = control/100.0
    #     twist.angular.z = -control
    #     #print("control:", control)

    # if displayHeightLines:
    #     img[avgLefts, CENTER-50:CENTER] = 255
    #     img[avgRights, CENTER:CENTER+50] = 255
    # cmd_vel_pub.publish(twist)

    # time_after_last_forced_turn += 1

    
    # bridge = CvBridge()
    # # img = img.astype("uint8")
    # # # # img[img == True] = 255
    # # img *= 255
    # # #print(img[40])
    # # cv_image = img
    # #print(img)
    # image_pub = rospy.Publisher("image_topic_2", Image, queue_size=1)
    # msg = bridge.cv2_to_imgmsg(img, "mono8")
    # #print(msg)
    # image_pub.publish(msg)

    #show(img)
    #show(img)
    #print(cv2.countNonZero(img))
    # img = morphology.skeletonize(m//255)
    # img = img.astype("uint8")
    # img *= 255
    #img = m

    # lefts, rights = [], []
    # asdcount = 0
    # #show(img)
    # for height in range(100, 200):
    #     for width in range(100):
    #         if img[TOP - height, CENTER - width]:
    #             lefts.append(width)
    #             break
    #     for width in range(100):
    #         if img[TOP - height, CENTER + width]:
    #             rights.append(width)
    #             break
    #     asdcount += 1
    #     if img[TOP - height, CENTER]:
    #         break
    # if next_turn == NONE or certainty < 3:
    #     if len(lefts) < asdcount * 0.8:
    #         if next_turn == LEFT:
    #             certainty += 1
    #         else:
    #             certainty = 0
    #         next_turn = LEFT
    #         print("next turn = LEFT")
    #         if len(rights) < asdcount * 0.8:
    #             print("next turn = ???")
    #     elif len(rights) < asdcount * 0.8:
    #         if next_turn == RIGHT:
    #             certainty += 1
    #         else:
    #             certainty = 0
    #         next_turn = RIGHT
    #         print("next turn = RIGHT")

    # for height in range(20):
    #     if img[TOP - height, CENTER]:
    #         turn = True

    # if turn:
    #     time_spent_turning += 1
    #     print("forced turn")
    # else:
    #     time_spent_turning = 0

    # if time_spent_turning > 10:
    #     turn = False
    #     next_turn = NONE

    # found = False
    # turn2 = False

    # leftvote = 0
    # rightvote = 0
    # twist.linear.x = 0.05
    # twist.linear.y = twist.linear.z = 0
    # twist.angular.x = twist.angular.y = 0
    # twist.angular.z = 0

    # if next_turn == LEFT and turn:
    #     twist.angular.z = 0.5
    #     print("forced turning left")
    # elif next_turn == RIGHT and turn:
    #     twist.angular.z = -0.5
    #     print("forced turning right")
    
    # cmd_vel_pub.publish(twist)

    
    #print("turn by:", control)
    # bridge = CvBridge()
    # img = img.astype("uint8")
    # #print(img)
    # # # img[img == True] = 255
    # #img *= 255
    # # #print(img[40])
    # # cv_image = img
    # #print(img)
    # image_pub = rospy.Publisher("image_topic_2", Image)
    # msg = bridge.cv2_to_imgmsg(img, "mono8")
    # #print(msg)
    # image_pub.publish(msg)

            

    # new ###########################
    # lefts, rights = [], []
    # for height in range(50):
    #     for width in range(60):
    #         if img[TOP-height, CENTER-width]:
    #             lefts.append(width)
    #             break
    #     for width in range(60):
    #         if img[TOP-height, CENTER+width]:
    #             rights.append(width)
    #             break

    # hard coded turn now
    # if img[TOP, CENTER]:
    #     left_count = 0
    #     right_count = 0
    #     for height in range(20):
    #         for width in range(50):
    #             if img[TOP-height, CENTER-width]:
    #                 left_count += 1
    #             if img[TOP-height, CENTER+width]:
    #                 right_count += 1
    #     if left_count / right_count > 2:
    #         print("TURN LEFT NOW!!!!")
    #         twist.angular.z = 1
    #     if right_count / left_count > 2:
    #         print("TURN RIGHT NOW!!!!")
    #         twist.angular.z = -1

        # twist.linear.y = twist.linear.z = 0
        # twist.angular.x = twist.angular.y = 0

        # cmd_vel_pub.publish(twist)
        # return

    # if len(lefts) < 15:
    #     rights = []

    # if len(rights) < 15:
    #     rights = []
    # if lefts and rights:
    #     mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
    # elif lefts:
    #     mid = CENTER - int(np.mean(lefts)) + WIDTH
    # elif rights:
    #     mid = CENTER + int(np.mean(rights)) - WIDTH
    # else:
    #     return
    # control = mid - CENTER
    # # control = pid(control)/100.0
    # control = control/100.0
    # print("at:", mid)
    # print("control:", control)
    # img[670:690, mid] = True
    # if abs(control) < 0.3:
    #     twist.linear.x = 0.20
    # else:
    #     twist.linear.x = 0.10

    # twist.linear.y = twist.linear.z = 0
    # twist.angular.x = twist.angular.y = 0
    # twist.angular.z = -control#-float(err) / 100

    # cmd_vel_pub.publish(twist)

    # print("turn by:", control)
    

def getCameraData(pixel_data):
    # TODO check if subscribed topics correct
    """
    Subscriber function for camera data
    :return: RGB and depth data
    """
    # pixel_data = None
    # while pixel_data is None:
    #     try:
    #         pixel_data =
    #     except Exception as e:
    #         print(e)
    #         pass
    print("got camera data")

    return dst


def mask(img, lo, hi):
    img = cv2.GaussianBlur(img,(7, 7),0)
    mask = cv2.inRange(img, lo, hi)
    return cv2.bitwise_and(img, img, mask=mask)


def remove_background(img, green):
    blur = cv2.medianBlur(green, 5)
    blur[blur > 0] = 255
    contours = cv2.findContours(blur, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)[1]
    contours = [cv2.convexHull(c) for c in contours if cv2.contourArea(c) > 5000]
    mask = np.zeros(img.shape[:2], dtype="uint8")
    for contour in contours:
        cv2.drawContours(mask, [contour], -1, 255, -1)
    higest = 300
    for c in contours:
        x, y, w, h = cv2.boundingRect(c)
        higest = min(y, higest)

    img[:higest, :] = 0
    return img

def show(*images):
    cols = 3
    num_rows = (len(images) - 1) // cols + 1
    plt.rcParams['figure.figsize'] = [20, 7]
    for i, im in enumerate(images):
        plt.subplot(num_rows, cols, i+1)
        plt.xticks([]), plt.yticks([])
        plt.imshow(im, cmap='gray')
    plt.show()



if __name__ == "__main__":
    cmd_vel_pub = rospy.Publisher('cmd_vel',
                        Twist, queue_size=1)

    twist = Twist()
    rospy.Subscriber("camera/rgb/image_rect_color", Image, callback)
    rospy.init_node("drive")

    # pid = PID(1, 0.1, 0.05, setpoint=0, proportional_on_measurement =True)
    # pid.output_limits = (-100, 100)
    rospy.spin()
    # while True:
    #     img = getCameraData()


        # m = mask(img, (150, 150, 150), (255, 255, 255))
        # m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
        # kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
        # m = cv2.dilate(m, kernel, iterations=10)
        # m[m>0] = 255
        # img = morphology.skeletonize(m//255)

        # # new ###########################
        # lefts, rights = [], []
        # for height in range(50):
        #     for width in range(60):
        #         if img[TOP-height, CENTER-width]:
        #             lefts.append(width)
        #             break
        #     for width in range(60):
        #         if img[TOP-height, CENTER+width]:
        #             rights.append(width)
        #             break
        # rights = []
        # if lefts and rights:
        #     mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
        # elif lefts:
        #     mid = CENTER - int(np.mean(lefts)) + WIDTH
        # elif rights:
        #     mid = CENTER + int(np.mean(rights)) - WIDTH
        # else:
        #     continue
        # control = mid - CENTER
        # # control = pid(control)/100.0
        # control = control/200.0
        # print("at:", mid)
        # print("control:", control)
        # img[670:690, mid] = True
        # twist.linear.x = 0.05
        # twist.linear.y = twist.linear.z = 0
        # twist.angular.x = twist.angular.y = 0
        # twist.angular.z = -control#-float(err) / 100

        # cmd_vel_pub.publish(twist)

        # print("turn by:", control)
        # bridge = CvBridge()
        # img = img.astype("uint8")
        # # # img[img == True] = 255
        # img *= 255
        # # #print(img[40])
        # # cv_image = img
        # #print(img)
        # image_pub = rospy.Publisher("image_topic_2", Image)
        # msg = bridge.cv2_to_imgmsg(img, "mono8")
        # #print(msg)
        # image_pub.publish(msg)

        # # new ###########################

        # twist.linear.x = 0.1
        # twist.linear.y = twist.linear.z = 0
        # twist.angular.x = twist.angular.y = 0
        # twist.angular.z = 0
        # img = np.array(img, dtype=np.uint8)
        # found = False
        # turn = False
        # for height in range(180):
        #     if img[699-height, 410]:
        #         print("found white at ", height)
        #         if height < 15:
        #             print("start turning")
        #             turn = True
        #         found = True
        #         break
        # if not found:
        #     cmd_vel_pub.publish(twist)
        #     continue
        # leftvote = 0
        # rightvote = 0
        # for asd in range(2, 20, 4):
        #     for width in range(100):
        #         if 700 - height + asd < 700:
        #             if img[700 - height + asd, 410+width]:
        #                 leftvote += 1
        #                 print("turn left", 694 - height + asd, 410+width)

        #                 break
        #             if img[700 - height + asd, 410-width]:
        #                 rightvote += 1
        #                 print("turn right", 694 - height + asd, 410-width)

        #                 break
        # twist.linear.x = 0.05
        # twist.linear.y = twist.linear.z = 0
        # twist.angular.x = twist.angular.y = 0
        # twist.angular.z = 0
        # if leftvote > rightvote and turn:
        #     twist.angular.z = 0.5
        #     print("relaly turn left")
        # elif turn:
        #     twist.angular.z = -0.5
        #     print("really turn right")

        # cmd_vel_pub.publish(twist)

        #show(img)





    # imgs = [np.load(i) for i in glob("persp_trans*.npy")]
    # img = imgs[0]

    # green_lowerHSV = (30, 50, 15)
    # green_upperHSV = (50, 140, 255)
    # greens = []
    # for i in imgs:
    #     i = cv2.cvtColor(i, cv2.COLOR_RGB2HSV)
    #     m = mask(i, green_lowerHSV, green_upperHSV)
    #     m = cv2.cvtColor(m, cv2.COLOR_HSV2RGB)
    #     m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    #     m[m>0] = 255
    #     greens.append(m)
    # imgs = [remove_background(img, green) for img, green in zip(imgs, greens)]

    # whites = []
    # for i in imgs:
    #     m = mask(i, (150, 150, 150), (255, 255, 255))
    #     m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    #     kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
    #     m = cv2.dilate(m, kernel, iterations=11)
    #     m[m>0] = 255
    #     whites.append(m)

    # # for w, img in zip(whites, imgs):
    # #     show(morphology.skeletonize(w//255), w, img)

    # thins = [morphology.skeletonize(w//255) for w in whites]


    # for i, img in enumerate(thins):
    #     found = False
    #     for height in range(180):
    #         if img[699-height, 400]:
    #             print(f"found white at {height} in {i}")
    #             if height < 15:
    #                 print("start turning")
    #             found = True
    #             break
    #     if not found:
    #         continue
    #     for width in range(100):
    #         if img[699-height+5, 400+width]:
    #             print("turn left")
    #         if img[699-height+5, 400-width]:
    #             print("turn right")
    #     show(img)

