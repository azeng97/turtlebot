#!/usr/bin/env python

import rospy
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Quaternion, Pose, Point, Vector3
from std_msgs.msg import Header, ColorRGBA
from nav_msgs.msg import Odometry
import numpy as np
import tf2_ros
import tf2_geometry_msgs

def wait_for_time():
    """Wait for simulated time to begin.
    """
    while rospy.Time().now().to_sec() == 0:
        pass


class NavPath(object):
    def __init__(self):
        self._paths = []
        self._path = []
        self._left = []
        self._right = []
        self.tfBuffer = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tfBuffer)
        self.visited = [[0 for n in range(100)] for k in range(100)]
        self.origin = [49, 49]
        self.origin_odom = None

    def callback(self, msg):
        #rospy.loginfo(msg)
        transform2 = self.tfBuffer.lookup_transform("base_link", "odom", rospy.Time(0), rospy.Duration(1.0))
        # if not self.origin_odom:
        #     self.origin_odom = [msg.pose.pose.position.x, msg.pose.pose.position.y]
        # msg.pose.pose.position.x -= self.origin_odom[0]
        # msg.pose.pose.position.y -= self.origin_odom[1]
        pose_base = tf2_geometry_msgs.do_transform_pose(msg.pose, transform2)
        left, pose_transformed, right = self.get_points(pose_base)
        if not self._path:
            self._path.append(pose_transformed.pose.position)
            self._left.append(left.pose.position)
            self._right.append(right.pose.position)
            self.add_history(pose_transformed.pose.position)
            self.create_road()
        if not self.has_visited(pose_transformed.pose.position):
            last = self._path[-1]
            coords = (pose_transformed.pose.position.x, pose_transformed.pose.position.y)
            if np.linalg.norm((last.x-coords[0], last.y-coords[1])) > 0.3:
                self._path = []
                self._left = []
                self._right = []
            self._path.append(pose_transformed.pose.position)
            self._left.append(left.pose.position)
            self._right.append(right.pose.position)
            self.add_history(pose_transformed.pose.position)
            self.create_road()
        self.show_path_in_rviz(marker_publisher, self._paths)

    def add_history(self, pos):
        x = int(pos.x*10+self.origin[0])
        y = int(pos.y*10+self.origin[1])
        for x_i in range(x-1, x+2):
            for y_i in range(y-1, y+2):
                self.visited[x_i][y_i] = 1


    def has_visited(self, pos):
        return self.visited[int(pos.x*10+self.origin[0])][int(pos.y*10+self.origin[1])]

    def create_marker(self, points, id, r, scale):
        marker = Marker(
                    type=Marker.LINE_STRIP,
                    id=id,
                    points=points,
                    header=Header(frame_id='map')
                    )
        marker.pose.orientation.w = 1.0
        marker.scale.x = scale
        marker.color.b = 0.0
        marker.color.g = 1-r
        marker.color.r = r
        marker.color.a = 1.0
        marker.action = marker.ADD
        return marker

    def create_road(self):
        idx = len(self._paths)
        if len(self._path) == 1:
            self._paths.append(self.create_marker(self._left, idx, 1, 0.05))
            self._paths.append(self.create_marker(self._path, idx + 1, 0, 0.02))
            self._paths.append(self.create_marker(self._right, idx + 2, 1, 0.05))
        else:
            self._paths[-3] = self.create_marker(self._left, idx, 1, 0.05)
            self._paths[-2] = self.create_marker(self._path, idx + 1, 0, 0.02)
            self._paths[-1] = self.create_marker(self._right, idx + 2, 1, 0.05)

    def get_points(self, pose_base):
        transform = self.tfBuffer.lookup_transform("map", "base_link", rospy.Time(0), rospy.Duration(1.0))
        pose_base.pose.position.y -= 0.2
        pose_path = tf2_geometry_msgs.do_transform_pose(pose_base, transform)
        pose_base.pose.position.y -= 0.4
        pose_right = tf2_geometry_msgs.do_transform_pose(pose_base, transform)
        pose_base.pose.position.y += 0.8
        pose_left = tf2_geometry_msgs.do_transform_pose(pose_base, transform)
        return pose_left, pose_path, pose_right

    def show_path_in_rviz(self, marker_publisher, paths):
        marker_publisher.publish(paths)

def main():

    rospy.init_node('my_node')
    wait_for_time()

    # ...setup stuff...
    nav_path = NavPath()
    global marker_publisher
    rospy.Subscriber('odom', Odometry, nav_path.callback)
    marker_publisher = rospy.Publisher('visualization_marker_array', MarkerArray, queue_size=2)
    rospy.spin()


if __name__ == '__main__':
  main()

