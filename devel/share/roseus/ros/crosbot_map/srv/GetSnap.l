;; Auto-generated. Do not edit!


(when (boundp 'crosbot_map::GetSnap)
  (if (not (find-package "CROSBOT_MAP"))
    (make-package "CROSBOT_MAP"))
  (shadow 'GetSnap (find-package "CROSBOT_MAP")))
(unless (find-package "CROSBOT_MAP::GETSNAP")
  (make-package "CROSBOT_MAP::GETSNAP"))
(unless (find-package "CROSBOT_MAP::GETSNAPREQUEST")
  (make-package "CROSBOT_MAP::GETSNAPREQUEST"))
(unless (find-package "CROSBOT_MAP::GETSNAPRESPONSE")
  (make-package "CROSBOT_MAP::GETSNAPRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass crosbot_map::GetSnapRequest
  :super ros::object
  :slots (_id _type ))

(defmethod crosbot_map::GetSnapRequest
  (:init
   (&key
    ((:id __id) (instance std_msgs::Int32 :init))
    ((:type __type) (instance std_msgs::UInt8 :init))
    )
   (send-super :init)
   (setq _id __id)
   (setq _type __type)
   self)
  (:id
   (&rest __id)
   (if (keywordp (car __id))
       (send* _id __id)
     (progn
       (if __id (setq _id (car __id)))
       _id)))
  (:type
   (&rest __type)
   (if (keywordp (car __type))
       (send* _type __type)
     (progn
       (if __type (setq _type (car __type)))
       _type)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int32 _id
    (send _id :serialization-length)
    ;; std_msgs/UInt8 _type
    (send _type :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32 _id
       (send _id :serialize s)
     ;; std_msgs/UInt8 _type
       (send _type :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32 _id
     (send _id :deserialize buf ptr-) (incf ptr- (send _id :serialization-length))
   ;; std_msgs/UInt8 _type
     (send _type :deserialize buf ptr-) (incf ptr- (send _type :serialization-length))
   ;;
   self)
  )

(defclass crosbot_map::GetSnapResponse
  :super ros::object
  :slots (_snap ))

(defmethod crosbot_map::GetSnapResponse
  (:init
   (&key
    ((:snap __snap) (instance crosbot_map::SnapMsg :init))
    )
   (send-super :init)
   (setq _snap __snap)
   self)
  (:snap
   (&rest __snap)
   (if (keywordp (car __snap))
       (send* _snap __snap)
     (progn
       (if __snap (setq _snap (car __snap)))
       _snap)))
  (:serialization-length
   ()
   (+
    ;; crosbot_map/SnapMsg _snap
    (send _snap :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; crosbot_map/SnapMsg _snap
       (send _snap :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; crosbot_map/SnapMsg _snap
     (send _snap :deserialize buf ptr-) (incf ptr- (send _snap :serialization-length))
   ;;
   self)
  )

(defclass crosbot_map::GetSnap
  :super ros::object
  :slots ())

(setf (get crosbot_map::GetSnap :md5sum-) "ed02702e11dc9a36e98cb929d7f780ba")
(setf (get crosbot_map::GetSnap :datatype-) "crosbot_map/GetSnap")
(setf (get crosbot_map::GetSnap :request) crosbot_map::GetSnapRequest)
(setf (get crosbot_map::GetSnap :response) crosbot_map::GetSnapResponse)

(defmethod crosbot_map::GetSnapRequest
  (:response () (instance crosbot_map::GetSnapResponse :init)))

(setf (get crosbot_map::GetSnapRequest :md5sum-) "ed02702e11dc9a36e98cb929d7f780ba")
(setf (get crosbot_map::GetSnapRequest :datatype-) "crosbot_map/GetSnapRequest")
(setf (get crosbot_map::GetSnapRequest :definition-)
      "std_msgs/Int32 id
std_msgs/UInt8 type

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/UInt8
uint8 data
---
crosbot_map/SnapMsg snap


================================================================================
MSG: crosbot_map/SnapMsg
Header header
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
")

(setf (get crosbot_map::GetSnapResponse :md5sum-) "ed02702e11dc9a36e98cb929d7f780ba")
(setf (get crosbot_map::GetSnapResponse :datatype-) "crosbot_map/GetSnapResponse")
(setf (get crosbot_map::GetSnapResponse :definition-)
      "std_msgs/Int32 id
std_msgs/UInt8 type

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/UInt8
uint8 data
---
crosbot_map/SnapMsg snap


================================================================================
MSG: crosbot_map/SnapMsg
Header header
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
")



(provide :crosbot_map/GetSnap "ed02702e11dc9a36e98cb929d7f780ba")


