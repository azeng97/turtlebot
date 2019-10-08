#!/usr/bin/env python

import subprocess
import rospy
from tf import TransformListener
from std_msgs.msg import Int8, Float64, Float64MultiArray, String
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
from visualization_msgs.msg import Marker
import time

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
    start = time.time()
    while beacons and time.time()-start < 20:
        pixel_data, depth_data = getCameraData()
        pose = getPose()
        beacon, pos = detect_beacons(pixel_data, depth_data, beacons)
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
    depth_data = None
    while not pixel_data or not depth_data:
        try:
            pixel_data = rospy.wait_for_message("color/image_raw", Image, timeout=1)
            pixel_data = rospy.wait_for_message("depth/image_raw", Image, timeout=1)
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
            odom = rospy.wait_for_message("/odom", Odometry, timeout=1)
        except Exception as e:
            print(e)
            pass
    return odom.pose.pose

def detect_beacons(pixel_data, depth_data, beacons):
    #TODO something in opencv using RGBD
    """
    Detect beacons from RGB data and map to Depth data
    :param pixel_data: Image (something from realsense camera)
    :param depth_data: Image
    :param beacons: set of beacons remaining to be found
    :return: position of detected beacon or None if not found
    """
    pos = [0, 0, 0]
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