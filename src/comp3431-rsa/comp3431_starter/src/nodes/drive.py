import numpy as np
import cv2
from skimage import morphology
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
from time import time
count = 0
start = 0
def callback(pixel_data):
    
    CENTER = 397
    TOP = 699
    WIDTH = 38
    global count
    global start
    count += 1
    print(count)
    if count == 1:
        start = time()
    if count == 20:
        print("time = ", time() - start)
        exit()
    pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    pts2 = np.float32([[360,700],[450,700],[0,0],[640,380]])

    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(pixel_data, "rgb8")

    M = cv2.getPerspectiveTransform(pts1,pts2)

    dst = cv2.warpPerspective(img,M,(640,700))
    img = dst

    m = mask(img, (150, 150, 150), (255, 255, 255))
    m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
    m = cv2.dilate(m, kernel, iterations=10)
    m[m>0] = 255
    #img = morphology.thin(m//255)
    img = m

    # new ###########################
    lefts, rights = [], []
    for height in range(50):
        for width in range(60):
            if img[TOP-height, CENTER-width]:
                lefts.append(width)
                break
        for width in range(60):
            if img[TOP-height, CENTER+width]:
                rights.append(width)
                break
    rights = []
    if lefts and rights:
        mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
    elif lefts:
        mid = CENTER - int(np.mean(lefts)) + WIDTH
    elif rights:
        mid = CENTER + int(np.mean(rights)) - WIDTH
    else:
        return
    control = mid - CENTER
    # control = pid(control)/100.0
    control = control/100.0
    print("at:", mid)
    print("control:", control)
    img[670:690, mid] = True
    if abs(control) < 0.3:
        twist.linear.x = 0.20
    else:
        twist.linear.x = 0.10

    twist.linear.y = twist.linear.z = 0
    twist.angular.x = twist.angular.y = 0
    twist.angular.z = -control#-float(err) / 100

    cmd_vel_pub.publish(twist)

    print("turn by:", control)
    bridge = CvBridge()
    img = img.astype("uint8")
    # # img[img == True] = 255
    img *= 255
    # #print(img[40])
    # cv_image = img
    #print(img)
    image_pub = rospy.Publisher("image_topic_2", Image)
    msg = bridge.cv2_to_imgmsg(img, "mono8")
    #print(msg)
    image_pub.publish(msg)

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
    #         if img[699-height, 397]:
    #             print(f"found white at {height} in {i}")
    #             if height < 15:
    #                 print("start turning")
    #             found = True
    #             break
    #     if not found:
    #         continue
    #     for width in range(100):
    #         if img[699-height+5, 397+width]:
    #             print("turn left")
    #         if img[699-height+5, 397-width]:
    #             print("turn right")
    #     show(img)
