#!/usr/bin/env python

import subprocess
import rospy
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
    beacons = set(beacons)
    cmd_pub = rospy.Publisher("/cmd", String, queue_size=1)
    origin_pub = rospy.Publisher("move_base_simple/goal", PoseStamped, queue_size=1)
    rospy.sleep(1)
    cmd_pub.publish("start") #start wall following
    start = time.time()
    while beacons and time.time()-start < 20:
        pixel_data, pointcloud_data = getCameraData()
        #pose = getPose()
        beacon, pos = detect_beacons(pixel_data, pointcloud_data, beacons)
        if not pos:
            continue
        map_coord = transform(pos, pose)
        publish_beacon(beacon_pub, beacon, map_coord)
    # beacons all found

    #TODO save map
    subprocess.Popen(["rosrun", "map_server", "map_saver", "-f", "$(find turtlebot3_navigation)/maps/map.yaml"])
    cmd_pub.publish("stop") #stop wall following

    #TODO launch navigation with map file argument
    subprocess.Popen(["roslaunch", "turtlebot3_navigation", "turtlebot3_navigation.launch"])

    #TODO check if initial position is 0 or need to set at the start
    origin = PoseStamped()
    origin.pose.position.x = 0
    origin.pose.position.y = 0
    origin.pose.position.z = 0
    origin_pub.publish(origin)


def getCameraData():
    #TODO check if subscribed topics correct
    """
    Subscriber function for camera data
    :return: RGB and depth data
    """
    pixel_data = None
    pointcloud_data = None
    while not pixel_data or not pointcloud_data:
        try:
            #pixel_data = rospy.wait_for_message("/camera/color/image_raw", Image, timeout=1)
            pixel_data = rospy.wait_for_message("/camera/rgb/image_raw", Image, timeout=1)
            pointcloud_data = rospy.wait_for_message("/camera/depth/points", PointCloud2, timeout=1)
        except Exception as e:
            print(e)
            pass
    return pixel_data, pointcloud_data

def getPose():
    """
    Subscriber function for turtlebot pose
    :return: pose as geometry_msgs/Pose message
    """
    pose = None
    while not pose:
        try:
            odom = rospy.wait_for_message("/odom", Odometry, timeout=1)
        except Exception as e:
            print(e)
            pass
    return odom.pose.pose


def detect_beacons(pixel_data, pointcloud_data, beacons):
    #TODO something in opencv using RGBD
    """
    Detect beacons from RGB data and map to Depth data
    :param pixel_data: Image (something from realsense camera)
    :param depth_data: Image
    :param beacons: set of beacons remaining to be found
    :return: position of detected beacon or None if not found
    """
    bridge = CvBridge()
    colour = bridge.imgmsg_to_cv2(pixel_data, "bgr8")
    #print(type(depth_data))
    for p in pc2.read_points(pointcloud_data, field_names = ("x", "y", "z"), skip_nans=True):
        print(p[0], p[1], p[2])
    #print(depth)
    #print(len(depth))
    #depth = bridge.imgmsg_to_cv2(depth_data, "32FC1")
    #print(colour.shape[0] )
    colour_boundaries = {
        "pink" : ([100, 40, 160], [170, 100, 255]), 
        "blue" : ([80, 70 , 20], [200, 170 , 50]),
        "green" : ([80, 70 , 20], [200, 170 , 50]),
        "yellow" : ([80, 70 , 20], [200, 170 , 50])
    }
    # blue: 
    for (beacon_colour, boundary) in colour_boundaries.items():
        lower = np.array(boundary[0], dtype = "uint8")
        upper = np.array(boundary[1], dtype = "uint8")
        
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
    """
    Convert coordinate in camera frame to world frame
    :param pos: coordinate of beacon in camera frame
    :param baseframe: robot pose (coordinate, orientation)
    :return: coordinate of beacon in world frame
    """
    tf = TransformListener()

    if tf.frameExists("/world") and tf.frameExists("/camera_depth_frame"):
        time = tf_listener.getLatestCommonTime("/world", "/camera_depth_frame")
        translation, rotation = tf.lookupTransform("/world", "/camera_depth_frame", time)
        # get a transform matrix
        transform = tf.fromTranslationRotation(translation, rotation)
        pos = transform * pos # apply the transform to the beacon coordinate

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