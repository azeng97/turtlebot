#!/usr/bin/env python

import subprocess
import rospy
from std_msgs.msg import Int8, Float64, Float64MultiArray, String
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
from visualization_msgs.msg import Marker

from sensor_msgs.msg import PointCloud2, PointField

import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy as np

class Beacon:
    def __init__(self, id, top, bottom):
        self.id = id
        self.top = top
        self.bottom = bottom


def main():
    rospy.init_node("comp3431_starter_beacons")
    beacon_pub = rospy.Publisher("/visualization_marker", Marker, queue_size=1)
    # rospy.Subscriber("/color/image_raw", Float64MultiArray, pixel_rgb)
    # rospy.Subscriber("/depth/image_raw", Float64MultiArray, pixel_depth)
    beacons = [
        Beacon(0, "pink", "green"),
        Beacon(1, "blue", "pink"),
        Beacon(2, "pink", "yellow"),
        Beacon(3, "yellow", "pink")
    ]
    print("running")
    beacons = set(beacons)
    cmd_pub = rospy.Publisher("/cmd", String, queue_size=1)
    origin_pub = rospy.Publisher("move_base_simple/goal", PoseStamped, queue_size=1)
    while beacons:
        pixel_data, depth_data = getCameraData()
        pose = getPose()
        beacon, pos = detect_beacons(pixel_data, depth_data, beacons)
        if not pos:
            continue
        map_coord = transform(pos, pose)
        publish_beacon(beacon_pub, beacon, map_coord)
    # beacons all found

    #TODO save map
    cmd_pub.publish("stop") #stop wall following

    #TODO launch navigation with map file argument
    subprocess.Popen(["roslaunch", "turtlebot3_navigation", "turtlebot3_navigation.launch"])

    #TODO check if initial position is 0 or need to set at the start
    origin = PoseStamped()
    origin.pose.position.x = 0
    origin.pose.position.y = 0
    origin.pose.position.z = 0
    origin_pub.publish(origin)



class image_converter:

    def __init__(self):
        self.image_pub = rospy.Publisher("image_topic_2",Image, queue_size=1)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw",Image,self.callback)

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
        (rows,cols,channels) = cv_image.shape
        if cols > 60 and rows > 60 :
            cv2.circle(cv_image, (50,50), 10, 255)
            cv2.imshow("Image window", cv_image)
            cv2.waitKey(3)
        try:
            self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)


def getCameraData():
    #TODO check if subscribed topics correct
    """
    Subscriber function for camera data
    :return: RGB and depth data
    """
    pixel_data = None
    depth_data = None
    while not pixel_data or not depth_data:
        try:
            pixel_data = rospy.wait_for_message("/camera/color/image_raw", Image, timeout=1)
            #pixel_data = rospy.wait_for_message("/camera/rgb/image_raw", Image, timeout=1)
            depth_data = rospy.wait_for_message("/camera/depth/image_raw", Image, timeout=1)
        except Exception as e:
            print(e)
            pass
    return pixel_data, depth_data

def getPose():
    """
    Subscriber function for turtlebot pose
    :return: pose as geometry_msgs/Pose message
    """
    pose = None
    while not pose:
        try:
            print("waiting for odom")
            odom = rospy.wait_for_message("/odom", Odometry, timeout=1)
        except Exception as e:
            print(e)
            pass
        return [0,0,0]
    return odom.pose.pose

def detect_beacons(pixel_data, depth_data, beacons):
    bridge = CvBridge()
    colour = bridge.imgmsg_to_cv2(pixel_data, "bgr8")
    depth = bridge.imgmsg_to_cv2(depth_data, "32FC1")

    colour_boundaries = [
        #(([100,40,160], [170,100,255]))
        
        (([0,0,0], [255,255,255]))
        ##[0, 100, 0], [20, 130, 20]),
        #([86, 31, 4], [220, 88, 50]),
        #([25, 146, 190], [62, 174, 250]),
        #([103, 86, 65], [145, 133, 128])
    ]

    # blue: 

    for (lower, upper) in colour_boundaries:
        lower = np.array(lower, dtype = "uint8")
        upper = np.array(upper, dtype = "uint8")
        
        mask = cv2.inRange(colour, lower, upper)
        output = cv2.bitwise_and(colour, colour, mask = mask)
        
        detected = False
        max_row = 0
        max_col = 0
        min_row = output.shape[0]
        min_col = output.shape[1]
        for row in range(0, output.shape[0]):
            for col in range(0, output.shape[1]):
                if output[row][col][0] != 0:
                    detected = True
                    if row > max_row:
                        max_row = row
                    if col > max_col:
                        max_col = col
                    if row < min_row:
                        min_row = row
                    if row < min_col:
                        min_col = col
        
        middle_row = (max_row + min_row) / 2
        middle_col = (max_col + min_col) / 2
        print("Middle pixel in: (" + str(middle_row) + ", " + str(middle_col) + ")")
        print(output.shape[0])
        cv2.imshow("output", output)
        cv2.waitKey(0)
    
    pixel_location = [middle_row, middle_col, depth[middle_row, middle_col]]
    #print(output[middle_row][middle_col])
    pos = pixel_location
    beacon = beacons.pop()
    return beacon, pos

def transform(pos, baseframe):
    #TODO do transformation (remember robot origin is different from camera pos)
    """
    Convert coordinate in camera frame to world frame
    :param pos: coordinate of beacon in camera frame
    :param baseframe: robot pose (coordinate, orientation)
    :return: coordinate of beacon in world frame
    """
    return pos

def publish_beacon(beacon_pub, beacon, map_coord):
    #TODO populate fields of marker using coord and beacon info
    """
    :param beacon_pub: publisher handle
    :param beacon: Beacon object
    :param map_coord: Converted map coordinate
    """
    marker = Marker()
    beacon_pub.publish(marker)

if __name__ == "__main__":
    main()
    #ic = image_converter()
    #rospy.init_node('image_converter', anonymous=True)
    #try:
    #    rospy.spin()
    #except KeyboardInterrupt:
    #    cv2.destroyAllWindows()