#!/usr/bin/env python

import subprocess
import rospy
from tf import TransformListener
from std_msgs.msg import Int8, Float64, Float64MultiArray, String
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped, PoseWithCovarianceStamped, Pose
from nav_msgs.msg import Odometry
from visualization_msgs.msg import Marker
import time

from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs.point_cloud2 as pc2

import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from locate import centers_from_range, find_beacon



def main():
    global origin_pub
    global init_pub
    global origin
    rospy.init_node("comp3431_nav")
    origin_pub = rospy.Publisher("move_base_simple/goal", PoseStamped, queue_size=1)
    rospy.Subscriber("cmd", String, cmd_callback)
    init_pub = rospy.Publisher("initialpose", PoseWithCovarianceStamped, queue_size=1)
    origin = PoseStamped()
    origin.header.frame_id = "map"
    origin.pose = getPose()
    cmd_pub = rospy.Publisher("/cmd", String, queue_size=1)
    rospy.sleep(10)
    cmd_pub.publish("start")
    print("Waiting for message")
    rospy.spin()

def cmd_callback(data):
    if data.data == "start_nav":
        print("Received message to start")

        pose = getPose()
        init = PoseWithCovarianceStamped()
        init.header.frame_id = "map"
        init.pose.pose = pose

        # subprocess.Popen(["rosrun", "map_server", "map_saver", "-f", "test"])
        # subprocess.Popen(["roslaunch", "turtlebot3_navigation", "turtlebot3_navigation.launch",
        #                   "map_file:=/home/rsa/turtlebot/src/comp3431-rsa/comp3431_starter/src/nodes/test.yaml"])
        rospy.sleep(15)
        print("Publishing initial:")
        print(init)
        init_pub.publish(init)
        rospy.sleep(1)
        print("Publishing goal:")
        print(origin)
        origin_pub.publish(origin)

def getPose():
    """
    Subscriber function for turtlebot pose
    :return: pose as geometry_msgs/Pose message
    """
    pos = None
    rot = None
    tf = TransformListener()
    pose = Pose()
    while pos is None or rot is None:
        try:
            tf.waitForTransform("/map", "/base_footprint", rospy.Time.now(), rospy.Duration(4.0))
            pos, rot = tf.lookupTransform("/map", "/base_footprint", rospy.Time())
        except Exception as e:
            print(e)
            pass
    pose.position.x = pos[0]
    pose.position.y = pos[1]
    pose.position.z = pos[2]
    pose.orientation.x = rot[0]
    pose.orientation.y = rot[1]
    pose.orientation.z = rot[2]
    pose.orientation.w = rot[3]
    return pose

if __name__ == "__main__":
    main()