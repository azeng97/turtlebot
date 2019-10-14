#!/usr/bin/env python

import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Quaternion, Pose, Point, Vector3
from std_msgs.msg import Header, ColorRGBA
from nav_msgs.msg import Odometry
import numpy as np

def wait_for_time():
    """Wait for simulated time to begin.
    """
    while rospy.Time().now().to_sec() == 0:
        pass


class NavPath(object):
    def __init__(self):
        self._path = []

    def callback(self, msg):
        #rospy.loginfo(msg)
        if not self._path:
            self._path.append(msg.pose.pose.position)
        else:
            last = self._path[-1]
            coords = (msg.pose.pose.position.x, msg.pose.pose.position.y)
            if np.linalg.norm((last.x-coords[0], last.y-coords[1])) > 0.1:
                self._path.append(msg.pose.pose.position)
            #print(len(self._path))
        show_path_in_rviz(marker_publisher, self._path)



def show_path_in_rviz(marker_publisher, points):

    marker = Marker(
                type=Marker.LINE_STRIP,
                id=10,
                points=points,
                header=Header(frame_id='odom')
                )
    marker.pose.orientation.w = 1.0
    marker.scale.x = 0.1
    marker.color.b = 0.0
    marker.color.g = 0.0
    marker.color.r = 1.0
    marker.color.a = 1.0
    marker.action = marker.ADD
    marker_publisher.publish(marker)

def main():

    rospy.init_node('my_node')
    wait_for_time()
    # ...setup stuff...
    nav_path = NavPath()
    global marker_publisher
    rospy.Subscriber('odom', Odometry, nav_path.callback)
    marker_publisher = rospy.Publisher('visualization_marker', Marker, queue_size=2)
    rospy.spin()


if __name__ == '__main__':
  main()

