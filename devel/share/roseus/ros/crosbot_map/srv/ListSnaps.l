;; Auto-generated. Do not edit!


(when (boundp 'crosbot_map::ListSnaps)
  (if (not (find-package "CROSBOT_MAP"))
    (make-package "CROSBOT_MAP"))
  (shadow 'ListSnaps (find-package "CROSBOT_MAP")))
(unless (find-package "CROSBOT_MAP::LISTSNAPS")
  (make-package "CROSBOT_MAP::LISTSNAPS"))
(unless (find-package "CROSBOT_MAP::LISTSNAPSREQUEST")
  (make-package "CROSBOT_MAP::LISTSNAPSREQUEST"))
(unless (find-package "CROSBOT_MAP::LISTSNAPSRESPONSE")
  (make-package "CROSBOT_MAP::LISTSNAPSRESPONSE"))

(in-package "ROS")





(defclass crosbot_map::ListSnapsRequest
  :super ros::object
  :slots ())

(defmethod crosbot_map::ListSnapsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass crosbot_map::ListSnapsResponse
  :super ros::object
  :slots (_snaps ))

(defmethod crosbot_map::ListSnapsResponse
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

(defclass crosbot_map::ListSnaps
  :super ros::object
  :slots ())

(setf (get crosbot_map::ListSnaps :md5sum-) "a9950552cda46ef9fb7f384a56cf8cd8")
(setf (get crosbot_map::ListSnaps :datatype-) "crosbot_map/ListSnaps")
(setf (get crosbot_map::ListSnaps :request) crosbot_map::ListSnapsRequest)
(setf (get crosbot_map::ListSnaps :response) crosbot_map::ListSnapsResponse)

(defmethod crosbot_map::ListSnapsRequest
  (:response () (instance crosbot_map::ListSnapsResponse :init)))

(setf (get crosbot_map::ListSnapsRequest :md5sum-) "a9950552cda46ef9fb7f384a56cf8cd8")
(setf (get crosbot_map::ListSnapsRequest :datatype-) "crosbot_map/ListSnapsRequest")
(setf (get crosbot_map::ListSnapsRequest :definition-)
      "---
crosbot_map/SnapMsg[] snaps

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

(setf (get crosbot_map::ListSnapsResponse :md5sum-) "a9950552cda46ef9fb7f384a56cf8cd8")
(setf (get crosbot_map::ListSnapsResponse :datatype-) "crosbot_map/ListSnapsResponse")
(setf (get crosbot_map::ListSnapsResponse :definition-)
      "---
crosbot_map/SnapMsg[] snaps

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



(provide :crosbot_map/ListSnaps "a9950552cda46ef9fb7f384a56cf8cd8")


