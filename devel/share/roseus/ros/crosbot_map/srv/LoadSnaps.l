;; Auto-generated. Do not edit!


(when (boundp 'crosbot_map::LoadSnaps)
  (if (not (find-package "CROSBOT_MAP"))
    (make-package "CROSBOT_MAP"))
  (shadow 'LoadSnaps (find-package "CROSBOT_MAP")))
(unless (find-package "CROSBOT_MAP::LOADSNAPS")
  (make-package "CROSBOT_MAP::LOADSNAPS"))
(unless (find-package "CROSBOT_MAP::LOADSNAPSREQUEST")
  (make-package "CROSBOT_MAP::LOADSNAPSREQUEST"))
(unless (find-package "CROSBOT_MAP::LOADSNAPSRESPONSE")
  (make-package "CROSBOT_MAP::LOADSNAPSRESPONSE"))

(in-package "ROS")





(defclass crosbot_map::LoadSnapsRequest
  :super ros::object
  :slots (_snaps ))

(defmethod crosbot_map::LoadSnapsRequest
  (:init
   (&key
    ((:snaps __snaps) (let (r) (dotimes (i 0) (push (instance crosbot_map::SnapMsg :init) r)) r))
    )
   (send-super :init)
   (setq _snaps __snaps)
   self)
  (:snaps
   (&rest __snaps)
   (if (keywordp (car __snaps))
       (send* _snaps __snaps)
     (progn
       (if __snaps (setq _snaps (car __snaps)))
       _snaps)))
  (:serialization-length
   ()
   (+
    ;; crosbot_map/SnapMsg[] _snaps
    (apply #'+ (send-all _snaps :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; crosbot_map/SnapMsg[] _snaps
     (write-long (length _snaps) s)
     (dolist (elem _snaps)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; crosbot_map/SnapMsg[] _snaps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _snaps (let (r) (dotimes (i n) (push (instance crosbot_map::SnapMsg :init) r)) r))
     (dolist (elem- _snaps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass crosbot_map::LoadSnapsResponse
  :super ros::object
  :slots (_success ))

(defmethod crosbot_map::LoadSnapsResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass crosbot_map::LoadSnaps
  :super ros::object
  :slots ())

(setf (get crosbot_map::LoadSnaps :md5sum-) "8666a8edc31971916e18761547a3684c")
(setf (get crosbot_map::LoadSnaps :datatype-) "crosbot_map/LoadSnaps")
(setf (get crosbot_map::LoadSnaps :request) crosbot_map::LoadSnapsRequest)
(setf (get crosbot_map::LoadSnaps :response) crosbot_map::LoadSnapsResponse)

(defmethod crosbot_map::LoadSnapsRequest
  (:response () (instance crosbot_map::LoadSnapsResponse :init)))

(setf (get crosbot_map::LoadSnapsRequest :md5sum-) "8666a8edc31971916e18761547a3684c")
(setf (get crosbot_map::LoadSnapsRequest :datatype-) "crosbot_map/LoadSnapsRequest")
(setf (get crosbot_map::LoadSnapsRequest :definition-)
      "crosbot_map/SnapMsg[] snaps

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
---
bool success
")

(setf (get crosbot_map::LoadSnapsResponse :md5sum-) "8666a8edc31971916e18761547a3684c")
(setf (get crosbot_map::LoadSnapsResponse :datatype-) "crosbot_map/LoadSnapsResponse")
(setf (get crosbot_map::LoadSnapsResponse :definition-)
      "crosbot_map/SnapMsg[] snaps

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
---
bool success
")



(provide :crosbot_map/LoadSnaps "8666a8edc31971916e18761547a3684c")


