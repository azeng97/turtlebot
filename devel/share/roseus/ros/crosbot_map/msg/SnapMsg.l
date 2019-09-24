;; Auto-generated. Do not edit!


(when (boundp 'crosbot_map::SnapMsg)
  (if (not (find-package "CROSBOT_MAP"))
    (make-package "CROSBOT_MAP"))
  (shadow 'SnapMsg (find-package "CROSBOT_MAP")))
(unless (find-package "CROSBOT_MAP::SNAPMSG")
  (make-package "CROSBOT_MAP::SNAPMSG"))

(in-package "ROS")
;;//! \htmlinclude SnapMsg.msg.html
(if (not (find-package "CROSBOT_MSGS"))
  (ros::roseus-add-msgs "crosbot_msgs"))
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass crosbot_map::SnapMsg
  :super ros::object
  :slots (_header _type _status _id _description _robot _pose _images _clouds ))

(defmethod crosbot_map::SnapMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:type __type) 0)
    ((:status __status) 0)
    ((:id __id) 0)
    ((:description __description) "")
    ((:robot __robot) (instance geometry_msgs::Pose :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:images __images) (let (r) (dotimes (i 0) (push (instance sensor_msgs::Image :init) r)) r))
    ((:clouds __clouds) (let (r) (dotimes (i 0) (push (instance crosbot_msgs::PointCloudMsg :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _type (round __type))
   (setq _status (round __status))
   (setq _id (round __id))
   (setq _description (string __description))
   (setq _robot __robot)
   (setq _pose __pose)
   (setq _images __images)
   (setq _clouds __clouds)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:robot
   (&rest __robot)
   (if (keywordp (car __robot))
       (send* _robot __robot)
     (progn
       (if __robot (setq _robot (car __robot)))
       _robot)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:images
   (&rest __images)
   (if (keywordp (car __images))
       (send* _images __images)
     (progn
       (if __images (setq _images (car __images)))
       _images)))
  (:clouds
   (&rest __clouds)
   (if (keywordp (car __clouds))
       (send* _clouds __clouds)
     (progn
       (if __clouds (setq _clouds (car __clouds)))
       _clouds)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _type
    1
    ;; int8 _status
    1
    ;; uint32 _id
    4
    ;; string _description
    4 (length _description)
    ;; geometry_msgs/Pose _robot
    (send _robot :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; sensor_msgs/Image[] _images
    (apply #'+ (send-all _images :serialization-length)) 4
    ;; crosbot_msgs/PointCloudMsg[] _clouds
    (apply #'+ (send-all _clouds :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;; int8 _status
       (write-byte _status s)
     ;; uint32 _id
       (write-long _id s)
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;; geometry_msgs/Pose _robot
       (send _robot :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; sensor_msgs/Image[] _images
     (write-long (length _images) s)
     (dolist (elem _images)
       (send elem :serialize s)
       )
     ;; crosbot_msgs/PointCloudMsg[] _clouds
     (write-long (length _clouds) s)
     (dolist (elem _clouds)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status 127) (setq _status (- _status 256)))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _robot
     (send _robot :deserialize buf ptr-) (incf ptr- (send _robot :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; sensor_msgs/Image[] _images
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _images (let (r) (dotimes (i n) (push (instance sensor_msgs::Image :init) r)) r))
     (dolist (elem- _images)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; crosbot_msgs/PointCloudMsg[] _clouds
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _clouds (let (r) (dotimes (i n) (push (instance crosbot_msgs::PointCloudMsg :init) r)) r))
     (dolist (elem- _clouds)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get crosbot_map::SnapMsg :md5sum-) "e22c37cf6db46fd5970eb0de2b60055b")
(setf (get crosbot_map::SnapMsg :datatype-) "crosbot_map/SnapMsg")
(setf (get crosbot_map::SnapMsg :definition-)
      "Header header
uint8 type
int8 status
uint32 id
string description
geometry_msgs/Pose robot    # Global to given frame
geometry_msgs/Pose pose     # Robot relative

sensor_msgs/Image[] images
crosbot_msgs/PointCloudMsg[] clouds
#crosbot/ColouredCloudMsg[] colouredClouds
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: crosbot_msgs/PointCloudMsg
Header header
geometry_msgs/Point[] points	# The points in the cloud.
ColourMsg[] colours				# The colours of the points. Can be empty.
================================================================================
MSG: crosbot_msgs/ColourMsg
uint8 r
uint8 g
uint8 b
uint8 a
")



(provide :crosbot_map/SnapMsg "e22c37cf6db46fd5970eb0de2b60055b")


