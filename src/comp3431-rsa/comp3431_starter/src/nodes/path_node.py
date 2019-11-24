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

    def callback(self, msg):
        #rospy.loginfo(msg)
        transform = self.tfBuffer.lookup_transform("map", "base_link", rospy.Time(0), rospy.Duration(1.0))
        transform2 = self.tfBuffer.lookup_transform("base_link", "odom", rospy.Time(0), rospy.Duration(1.0))
        pose_base = tf2_geometry_msgs.do_transform_pose(msg.pose, transform2)
        pose_base.pose.position.y -= 0.2
        pose_transformed = tf2_geometry_msgs.do_transform_pose(pose_base, transform)
        if not self._path:
            self._path.append(pose_transformed.pose.position)
            marker = self.create_marker(self._path, len(self._paths))
            self._paths.append(marker)
            self.add_history(pose_transformed.pose.position)
        elif not self.has_visited(pose_transformed.pose.position):
            last = self._path[-1]
            coords = (pose_transformed.pose.position.x, pose_transformed.pose.position.y)
            if np.linalg.norm((last.x-coords[0], last.y-coords[1])) > 0.3:
                self._path = []
                marker = self.create_marker(self._path, len(self._paths))
                self._paths.append(marker)
            self._path.append(pose_transformed.pose.position)
            self._paths[-1] = self.create_marker(self._path, len(self._paths))
            #print(len(self._path))
            self.add_history(pose_transformed.pose.position)

        self.show_path_in_rviz(marker_publisher, self._paths)

    def add_history(self, pos):
        x = int(pos.x*10+self.origin[0])
        y = int(pos.y*10+self.origin[1])
        for x_i in range(x-1, x+2):
            for y_i in range(y-1, y+2):
                self.visited[x_i][y_i] = 1


    def has_visited(self, pos):
        return self.visited[int(pos.x*10+self.origin[0])][int(pos.y*10+self.origin[1])]

    def create_marker(self, points, id):
        marker = Marker(
                    type=Marker.LINE_STRIP,
                    id=id,
                    points=points,
                    header=Header(frame_id='map')
                    )
        marker.pose.orientation.w = 1.0
        marker.scale.x = 0.02
        marker.color.b = 0.0
        marker.color.g = 0.0
        marker.color.r = 1.0
        marker.color.a = 1.0
        marker.action = marker.ADD
        return marker

    def add_markers(self, left, path, right):
        self._paths.append()

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

