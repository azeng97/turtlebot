
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
from locate import contour_ranges, find_beacon

LEFT = -1
RIGHT = 1
NONE = 0
RVIZ = True
TOP = 699
CENTER = 397
WIDTH = 47
CONTROL_CENTER = 390


class Control():
    # Things to correct corners
    lastAdjustmentTurnTime = 200
    adjustmentCertainty = 0
    cornerAdjustmentTurn = NONE
    timeSpentAdjusting = 0

    aboutToCrossStopLine = False
    useStabilise = False
    hasMovedUp = False
    timePassedStop = 0

    def __init__(self, img, twist):
        self.original = img
        self.img = get_processed_img(img)
        #self.img = getProcessedImg(img)
        self.rvizImg = self.img
        self.hitHeight, self.hitWidth = self.findHitHeight(self.img)
        

        self.twist = twist
        self.twist.linear.x = 0.05
        self.twist.linear.y = self.twist.linear.z = 0
        self.twist.angular.x = self.twist.angular.y = 0

        


    def findHitHeight(self, img):

        for hitHeight in range(TOP):
            for hitWidth in range(3): # To avoid going through holes in lines
                if (TOP - hitHeight >= 0):
                    if img[TOP - hitHeight, CENTER - hitWidth]:
                        return hitHeight, - hitWidth - 1
                    if img[TOP - hitHeight, CENTER + hitWidth]:
                        return hitHeight, hitWidth + 1

        return 699, 0

        


    # Returns True or False depending on whether a stop line has been detected
    def detectStopLine(self, img):
        # Check if there is a line in front, and then if lines on either side coming
        # back towards the robot (which are roughly the same distance apart)
        lefts = []
        rights = []
        for n in range(1, 10):
            left = right = 0
            if 5*n - self.hitHeight > 0:
                break
            for x in range(60):
                if img[TOP-self.hitHeight + 5*n][CENTER-x]:
                    left = CENTER-x
                    break
            if left == 0 and TOP-self.hitHeight + 5*n > 665:
                break
            for x in range(60):
                if img[TOP-self.hitHeight + 5*n][CENTER+x]:
                    right = CENTER+x
                    break
            if left == 0 or right == 0:
                return False
            lefts.append(left)
            rights.append(right)
        if len(lefts) < 4:
            # print("too short")
            return False
        if abs(WIDTH*2-(np.mean(rights)-np.mean(lefts))) > 15:
            # print("not in center")
            return False
        if np.std(np.array(lefts) - np.array(rights)) > 9:
            # print("lines aren't parallel")
            return False
        print("found stop line!!!")
        np.save("found_stop", img)
        return True

    def useRviz(self):
        bridge = CvBridge()
        image_pub = rospy.Publisher("image_topic_2", Image, queue_size=1)
        self.rvizImg[0:699, CENTER] = 255
        msg = bridge.cv2_to_imgmsg(self.rvizImg, "mono8")
        image_pub.publish(msg)
    def makeTurn(self):
        
        

        if not Control.hasMovedUp:
            self.twist.linear.x = 0.2
            self.twist.angular.z = 0.0
            cmd_vel_pub.publish(self.twist)
            time.sleep(1)
            Control.hasMovedUp = True

        turnDir = self.waitForLight()

        if turnDir == 0:
            print("stopping until green")
            self.twist.linear.x = 0.0
            self.twist.angular.z = 0.0
            cmd_vel_pub.publish(self.twist)
            return
        elif turnDir == 1:
            print("turning left")
            self.twist.linear.x = 0.2
            self.twist.linear.y = self.twist.linear.z = 0
            self.twist.angular.x = self.twist.angular.y = 0
            self.twist.angular.z = 1
            Control.timePassedStop = 0
        else:
            print("turning right")
            self.twist.linear.x = 0.15
            self.twist.linear.y = self.twist.linear.z = 0
            self.twist.angular.x = self.twist.angular.y = 0
            self.twist.angular.z = -0.23
            Control.timePassedStop = -25
            
            
        
        cmd_vel_pub.publish(self.twist)
        time.sleep(2.5)

        self.twist.linear.x = 0
        self.twist.linear.y = self.twist.linear.z = 0
        self.twist.angular.x = self.twist.angular.y = 0
        self.twist.angular.z = 0
        cmd_vel_pub.publish(self.twist)

    def waitForLight(self):
        ranges = contour_ranges(self.original)
        if find_beacon(ranges["blue"], ranges["pink"]):
            Control.aboutToCrossStopLine = False
            return -1
        if find_beacon(ranges["yellow"], ranges["pink"]):
            Control.aboutToCrossStopLine = False
            return 1
        # if find_beacon(ranges["green"], ranges["pink"]):
        #     return -1   
        return 0

    
    def doRightTurn(self):
        self.twist.linear.x = 0.0
        self.twist.angular.z = 0.0
        cmd_vel_pub.publish(self.twist)
        time.sleep(2)
        self.twist.linear.x = 0.2
        self.twist.angular.z = -0.2
        cmd_vel_pub.publish(self.twist)
        time.sleep(4)

    overshot = False
    prevHitHeight = 700
    lastTurns = [0]
    


    def updateOvershotLine(self):

        if Control.prevHitHeight < 10 and self.hitHeight > 50:
            Control.overshot = True

        if Control.overshot and self.hitHeight > 5 and self.hitHeight < 40:
            Control.overshot = False

        Control.prevHitHeight = self.hitHeight

    def updateLastTurns(self, turn):
        
        if len(Control.lastTurns) > 5:
            Control.lastTurns.pop(0)
        Control.lastTurns.append(turn)

    def getLastTurn(self):
        return max(set(self.lastTurns), key=self.lastTurns.count)
    
        
    

    def step(self):
        print("hitHeight = ", self.hitHeight)
        if RVIZ:
            self.useRviz()
            return

        
        
        if (20 < self.hitHeight < 150 and self.detectStopLine(self.img)):
            Control.useStabilise = True

        if self.hitHeight < 10 and Control.useStabilise:
            Control.aboutToCrossStopLine = True
            Control.hasMovedUp = False
        elif Control.aboutToCrossStopLine:
            Control.useStabilise = False
            self.makeTurn()
            self.completeAdjustment()
            
            return

        Control.timePassedStop += 1
        if Control.timePassedStop == 50:
            print("can correct overshooting again")
        self.updateOvershotLine()
        #print(Control.overshot)
        if Control.overshot and Control.timePassedStop > 50:
            print("OVERSHOT. LAST TURN =", self.getLastTurn())
            self.twist.linear.x = 0.05
            self.twist.angular.z = self.getLastTurn()
            cmd_vel_pub.publish(self.twist)
            return

        Control.lastAdjustmentTurnTime += 1
        if Control.lastAdjustmentTurnTime > 100 and self.hitHeight > 130 and self.hitHeight < 200:
            if Control.cornerAdjustmentTurn == NONE or Control.adjustmentCertainty < 10:
                Control.cornerAdjustmentTurn = self.detectCornerTurn(self.hitHeight, self.img)
                if Control.cornerAdjustmentTurn == LEFT:
                    print("next corner turn = LEFT")
                elif Control.cornerAdjustmentTurn == RIGHT:
                    print("next corner turn = RIGHT")
                else:
                    print("next corner turn = NONE")

        if (self.hitHeight > 100 or Control.useStabilise): #STABILISE
            self.stabilise()
            self.twist.linear.x = 0.2
            print("1", self.twist.angular.z)
            cmd_vel_pub.publish(self.twist)
        elif self.hitHeight > 50: 
            #self.twist.angular.z = 0
            self.stabilise()
            self.twist.linear.x = 0.1
            self.twist.angular.z *= 0.7
            cmd_vel_pub.publish(self.twist)
            print("2", self.twist.angular.z)
        else:
            self.twist.linear.x = 0.05
            if (self.hitHeight < 5):
                #self.twist.linear.x = 0.01
                self.turnNow(adjustToCorner=True)
                print("5", self.twist.angular.z)
                self.updateLastTurns(self.twist.angular.z)
                self.twist.angular.z = self.getLastTurn()
            elif self.hitHeight < 10:
                #self.twist.linear.x = 0.025
                self.turnNow()
                self.updateLastTurns(self.twist.angular.z)
                self.twist.angular.z = self.getLastTurn()
                self.twist.angular.z *= 0.5
                print("4", self.twist.angular.z)
            else:
                self.turnNow()
                self.updateLastTurns(self.twist.angular.z)
                self.twist.angular.z *= 0.2
                print("3", self.twist.angular.z)

            cmd_vel_pub.publish(self.twist)

            

        

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

    #To be called when hitHeight is very low. Either adjust to corner, or turn based off the line orientation
    def turnNow(self, adjustToCorner=False):

        if Control.timeSpentAdjusting > 20:
            self.completeAdjustment()

        if ((adjustToCorner or Control.timeSpentAdjusting > 0) 
                and Control.cornerAdjustmentTurn == LEFT and Control.adjustmentCertainty > 5):
            self.twist.angular.z = 0.3
            Control.timeSpentAdjusting += 1
            print("forced turn LEFT")
        elif ((adjustToCorner or Control.timeSpentAdjusting > 0)
                and Control.cornerAdjustmentTurn == RIGHT and Control.adjustmentCertainty > 5):
            self.twist.angular.z = -0.3
            Control.timeSpentAdjusting += 1
            print("forced turn RIGHT")

        else:
            lefts, rights = self.findLineOrientation(self.hitHeight, self.img)
            avgLefts = np.mean(lefts)
            avgRights = np.mean(rights)
            print("ABS", abs(avgLefts - avgRights))
            if (avgLefts < avgRights + 1):
                print("lefts higher than right, turn left", avgLefts, avgRights)
                self.twist.angular.z = 0.3
            elif (avgRights < avgLefts + 1):
                print("rights higher than left, turn right", avgLefts, avgRights)
                self.twist.angular.z = -0.3
            else:
                self.twist.angular.z = 0

    def isOnLeftLine(self): # there is only one line and it is in the middle of the robot camera, but tilting to top right
        bottomHits = []
        topHits = []
        for height in range(50):
            for width in range(100):
                if self.img[TOP - height, CONTROL_CENTER + 25 - width]:
                    bottomHits.append(CONTROL_CENTER + 25 - width)
        
        for height in range(50, 100):
            for width in range(100):
                if self.img[TOP - height, CONTROL_CENTER + 25 - width]:
                    topHits.append(CONTROL_CENTER + 25 - width)
        
        return np.mean(bottomHits) < np.mean(topHits), bottomHits, topHits

    def stabilise(self):

        lefts, rights = [], []
        leftCrossed = False
        rightCrossed = False

        for height in range(min(self.hitHeight - 10, 100)):
            for width in range(60):
                if self.img[TOP-height, CONTROL_CENTER-width]:
                    if width == 0: # the line is too close to the middle to classify as left
                        leftCrossed = True # the crossed from the left to the right side, do not use points from the right anymore
                    if not rightCrossed:
                        lefts.append(width)
                    break

            for width in range(60):
                if self.img[TOP-height, CONTROL_CENTER+width]:
                    if width == 0:
                        if not rightCrossed:
                            lefts.pop()
                        rightCrossed = True
                        
                    if not leftCrossed:
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
        
        #control = pid(control)
        self.twist.angular.z = -control

    def findLineOrientation(self, atHeight, img):
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
            lefts = [699]
        if not rights:
            rights = [699]
        # print(lefts, rights)
        if (lefts and rights):
            self.rvizImg[np.mean(lefts), CENTER - 200: CENTER] = 255
            self.rvizImg[np.mean(rights), CENTER: CENTER + 200] = 255

        if Control.cornerAdjustmentTurn == RIGHT:
            rights.append(-1000)
        elif Control.cornerAdjustmentTurn == LEFT:
            lefts.append(-1000)
            
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
    img = pixel_data
    pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    pts2 = np.float32([[360,700],[450,700],[0,0],[640,380]])

    M = cv2.getPerspectiveTransform(pts1,pts2)
    dst = cv2.warpPerspective(img,M,(640,700))
    img = dst
    m = mask(img, (150, 150, 150), (255, 255, 255))
    m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
    #m = cv2.dilate(m, kernel, iterations=10)
    m[m>0] = 255
    img = m
    return img










def callback(pixel_data):
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(pixel_data, "rgb8")
    
    #img = getProcessedImg(pixel_data)
    control = Control(img, twist)
    control.step()



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
