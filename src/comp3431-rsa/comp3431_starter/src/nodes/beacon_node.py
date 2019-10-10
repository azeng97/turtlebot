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

from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs.point_cloud2 as pc2

import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from locate import centers_from_range, find_beacon


class Beacon:
    def __init__(self, id, top, bottom):
        self.id = id
        self.top = top
        self.bottom = bottom
        self.all_positions = []

    def add_pos(self, pos):
        self.all_positions.append(pos)

    def average_postion(self):
        x_sum = y_sum = z_sum = 0
        length = len(self.all_positions)
        if not length:
            return (0, 0, 0)
        for x, y, z in self.all_positions:
            x_sum += x
            y_sum += y
            z_sum += z
        return (x_sum/length, y_sum/length, z_sum/length)

    def find_pos(self, ranges, pointcloud_data):
        x, y = find_beacon(ranges[self.top], ranges[self.bottom])
        if not x:
            return
        print("found beacon {self.id}")
        pos = transform(pointcloud_data[x][y])
        self.add_pos(pos)


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
    # beacons = set(beacons)
    cmd_pub = rospy.Publisher("/cmd", String, queue_size=1)
    origin_pub = rospy.Publisher(
        "move_base_simple/goal", PoseStamped, queue_size=1)
    rospy.sleep(1)
    cmd_pub.publish("start")  # start wall following
    start = time.time()
    while beacons and time.time()-start < 20:

        pixel_data, pointcloud_data = getCameraData()
        detect_beacons(pixel_data, pointcloud_data, beacons)

    # beacons all found
    for beacon in beacons:
        publish_beacon(beacon_pub, beacon)

    # #TODO save map
    # subprocess.Popen(["rosrun", "map_server", "map_saver", "-f", "test"])
    cmd_pub.publish("stop")  # stop wall following
    cmd_pub.publish("start_nav")
    # #TODO launch navigation with map file argument
    # subprocess.Popen(["roslaunch", "turtlebot3_navigation", "turtlebot3_navigation.launch", "map_file:=/home/rsa/turtlebot/src/comp3431-rsa/comp3431_starter/src/nodes/test.yaml"])
    # rospy.sleep(15)
    # #TODO check if initial position is 0 or need to set at the start
    # origin = PoseStamped()
    # origin.header.frame_id = "map"
    # origin.pose.position.x = 0
    # origin.pose.position.y = 0
    # origin.pose.position.z = 0
    # origin.pose.orientation.x = 0
    # origin.pose.orientation.y = 0
    # origin.pose.orientation.z = 0
    # origin.pose.orientation.w = 1
    # origin_pub.publish(origin)


def getCameraData():
    # TODO check if subscribed topics correct
    """
    Subscriber function for camera data
    :return: RGB and depth data
    """
    pixel_data = None
    pcl = None
    while pixel_data is None or pcl is None:
        try:
            #pixel_data = rospy.wait_for_message("/camera/color/image_raw", Image, timeout=1)
            pixel_data = rospy.wait_for_message(
                "/camera/rgb/image_raw", Image, timeout=1)
            pointcloud_data = rospy.wait_for_message(
                "/camera/depth/points", PointCloud2, timeout=1)
            pcl = pointcloud2_to_array(pointcloud_data)
        except Exception as e:
            print(e)
            pass
    return pixel_data, pcl

# def getPose():
#     """
#     Subscriber function for turtlebot pose
#     :return: pose as geometry_msgs/Pose message
#     """
#     pose = None
#     while not pose:
#         try:
#             odom = rospy.wait_for_message("/odom", Odometry, timeout=1)
#         except Exception as e:
#             print(e)
#             pass
#     return odom.pose


def detect_beacons(pixel_data, pointcloud_data, beacons):
    """
    Detect beacons from RGB data and map to Depth data
    :param pixel_data: Image (something from realsense camera)
    :param depth_data: Image
    :param beacons: set of beacons remaining to be found
    :return: position of detected beacon or None if not found
    """
    print("detecting beacons")
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(pixel_data, "bgr8")
    # print(img.shape)
    # print(type(depth_data))
    # for p in pc2.read_points(pointcloud_data, field_names = ("x", "y", "z"), skip_nans=True):
    #     print(p[0], p[1], p[2])

    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    ranges = {
        "pink": centers_from_range(img, (140, 40, 70), (255, 130, 200)),
        "blue": centers_from_range(img, (0, 70, 100), (50, 170, 200)),
        "green": centers_from_range(img, (0, 60, 40), (50, 130, 110)),
        # not correct range
        "yellow": centers_from_range(img, (0, 60, 40), (10, 70, 50))
    }

    for beacon in beacons:
        beacon.find_pos(ranges, pointcloud_data)


def transform(pos):
    """
    Convert coordinate in camera frame to world frame
    :param pos: coordinate of beacon in camera frame
    :param baseframe: robot pose (coordinate, orientation)
    :return: coordinate of beacon in world frame
    """
    tf = TransformListener()

    if tf.frameExists("/map") and tf.frameExists("/camera_depth_frame"):
        time = tf.getLatestCommonTime("/map", "/camera_depth_frame")
        translation, rotation = tf.lookupTransform(
            "/map", "/camera_depth_frame", time)
        # get a transform matrix
        transform = tf.fromTranslationRotation(translation, rotation)
        pos = transform * pos  # apply the transform to the beacon coordinate
    return pos


def publish_beacon(beacon_pub, beacon):
    # TODO populate fields of marker using coord and beacon info
    """
    :param beacon_pub: publisher handle
    :param beacon: Beacon object
    :param map_coord: Converted map coordinate
    """

    marker = Marker()
    marker.header.frame_id = "/world"  # not sure if correct frame ###############
    marker.header.stamp = rospy.get_rostime()
    marker.ns = "beacon_shapes"
    marker.id = 0
    marker.type = 3  # cylinder shape
    marker.action = 0  # add/modify shape
    # placement of shape

    map_coord = beacon.average_postion()
    marker.pose.position.x = map_coord[0]
    marker.pose.position.y = map_coord[1]
    marker.pose.position.z = map_coord[2]
    marker.pose.orientation.x = 0.0
    marker.pose.orientation.y = 0.0
    marker.pose.orientation.z = 0.0
    marker.pose.orientation.w = 1.0
    # size of shape, maybe modify
    marker.scale.x = 1.0
    marker.scale.y = 1.0
    marker.scale.z = 1.0
    # colour of shape, green atm, maybe modify based on beacon param
    marker.color.r = 0.0
    marker.color.g = 1.0
    marker.color.b = 0.0
    marker.color.a = 1.0
    marker.lifetime = rospy.Duration(0)  # does not delete shape

    beacon_pub.publish(marker)


def pointcloud2_to_array(cloud_msg):
    '''
    Converts a rospy PointCloud2 message to a numpy recordarray

    Assumes all fields 32 bit floats, and there is no padding.
    '''
    points = np.array([p for p in pc2.read_points(
        cloud_msg, field_names=("x", "y", "z"), skip_nans=False)])
    # print(np.shape(points), cloud_msg.height, cloud_msg.width)
    return np.reshape(points, (cloud_msg.height, cloud_msg.width, 3))


if __name__ == "__main__":
    main()
