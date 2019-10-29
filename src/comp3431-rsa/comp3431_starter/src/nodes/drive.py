import numpy as np
import cv2
from skimage import morphology
from simple_pid import PID
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

def getCameraData():
    # TODO check if subscribed topics correct
    """
    Subscriber function for camera data
    :return: RGB and depth data
    """
    pixel_data = None
    while pixel_data is None:
        try:
            pixel_data = rospy.wait_for_message("/camera/rgb/image_rect_color", Image, timeout=1)
        except Exception as e:
            print(e)
            pass

    pts1 = np.float32([[0,480],[640,480],[0,295],[640,295]])
    pts2 = np.float32([[360,700],[450,700],[0,0],[640,380]])

    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(pixel_data, "rgb8")

    M = cv2.getPerspectiveTransform(pts1,pts2)

    dst = cv2.warpPerspective(img,M,(640,700))
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

    rospy.init_node("drive")
    CENTER = 397
    TOP = 699
    WIDTH = 47
    pid = PID(1, 0.1, 0.05, setpoint=CENTER)
    while True:
        imgs = [getCameraData()]

        green_lowerHSV = (30, 50, 15)
        green_upperHSV = (50, 140, 255)
        greens = []
        for i in imgs:
            i = cv2.cvtColor(i, cv2.COLOR_RGB2HSV)
            m = mask(i, green_lowerHSV, green_upperHSV)
            m = cv2.cvtColor(m, cv2.COLOR_HSV2RGB)
            m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
            m[m>0] = 255
            greens.append(m)
        imgs = [remove_background(img, green) for img, green in zip(imgs, greens)]

        whites = []
        for i in imgs:
            m = mask(i, (150, 150, 150), (255, 255, 255))
            m = cv2.cvtColor(m, cv2.COLOR_RGB2GRAY)
            kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3))
            m = cv2.dilate(m, kernel, iterations=11)
            m[m>0] = 255
            whites.append(m)

        # for w, img in zip(whites, imgs):
        #     show(morphology.skeletonize(w//255), w, img)

        thins = [morphology.skeletonize(w//255) for w in whites]

        # new ###########################
        for img, orig in zip(thins, imgs):
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
            # rights = []
            if lefts and rights:
                mid = (2*CENTER - int(np.mean(lefts)) + int(np.mean(rights)))//2
            elif lefts:
                mid = CENTER - int(np.mean(lefts)) + WIDTH
            elif rights:
                mid = CENTER + int(np.mean(rights)) - WIDTH
            else:
                mid = False
            control = pid(mid)
            print("turn by:", control)
        # new ###########################

        for i, img in enumerate(thins):
            img = np.array(img, dtype=np.uint8)
            found = False
            for height in range(180):
                if img[699-height, 410]:
                    print("found white at ", height)
                    if height < 15:
                        print("start turning")
                    found = True
                    break
            if not found:
                continue
            leftvote = 0
            rightvote = 0
            for asd in range(10):
                for width in range(100):
                    if 700 - height + asd < 700:
                        if img[700 - height + asd, 410+width]:
                            leftvote += 1
                            print("turn left", 694 - height + asd, 410+width)

                            break
                        if img[700 - height + asd, 410-width]:
                            rightvote += 1
                            print("turn right", 694 - height + asd, 410-width)

                            break

            if leftvote > rightvote:
                print("relaly turn left")
            else:
                print("really turn right")

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
