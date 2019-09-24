;; Auto-generated. Do not edit!


(when (boundp 'crosbot_explore::GetPath)
  (if (not (find-package "CROSBOT_EXPLORE"))
    (make-package "CROSBOT_EXPLORE"))
  (shadow 'GetPath (find-package "CROSBOT_EXPLORE")))
(unless (find-package "CROSBOT_EXPLORE::GETPATH")
  (make-package "CROSBOT_EXPLORE::GETPATH"))
(unless (find-package "CROSBOT_EXPLORE::GETPATHREQUEST")
  (make-package "CROSBOT_EXPLORE::GETPATHREQUEST"))
(unless (find-package "CROSBOT_EXPLORE::GETPATHRESPONSE")
  (make-package "CROSBOT_EXPLORE::GETPATHRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass crosbot_explore::GetPathRequest
  :super ros::object
  :slots (_start _end ))

(defmethod crosbot_explore::GetPathRequest
  (:init
   (&key
    ((:start __start) (instance geometry_msgs::Pose :init))
    ((:end __end) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _start __start)
   (setq _end __end)
   self)
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:end
   (&rest __end)
   (if (keywordp (car __end))
       (send* _end __end)
     (progn
       (if __end (setq _end (car __end)))
       _end)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _start
    (send _start :serialization-length)
    ;; geometry_msgs/Pose _end
    (send _end :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _start
       (send _start :serialize s)
     ;; geometry_msgs/Pose _end
       (send _end :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; geometry_msgs/Pose _end
     (send _end :deserialize buf ptr-) (incf ptr- (send _end :serialization-length))
   ;;
   self)
  )

(defclass crosbot_explore::GetPathResponse
  :super ros::object
  :slots (_path ))

(defmethod crosbot_explore::GetPathResponse
  (:init
   (&key
    ((:path __path) (instance nav_msgs::Path :init))
    )
   (send-super :init)
   (setq _path __path)
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/Path _path
    (send _path :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/Path _path
       (send _path :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/Path _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;;
   self)
  )

(defclass crosbot_explore::GetPath
  :super ros::object
  :slots ())

(setf (get crosbot_explore::GetPath :md5sum-) "41ca099eb8abb09e958f7da45a721668")
(setf (get crosbot_explore::GetPath :datatype-) "crosbot_explore/GetPath")
(setf (get crosbot_explore::GetPath :request) crosbot_explore::GetPathRequest)
(setf (get crosbot_explore::GetPath :response) crosbot_explore::GetPathResponse)

(defmethod crosbot_explore::GetPathRequest
  (:response () (instance crosbot_explore::GetPathResponse :init)))

(setf (get crosbot_explore::GetPathRequest :md5sum-) "41ca099eb8abb09e958f7da45a721668")
(setf (get crosbot_explore::GetPathRequest :datatype-) "crosbot_explore/GetPathRequest")
(setf (get crosbot_explore::GetPathRequest :definition-)
      "geometry_msgs/Pose start
geometry_msgs/Pose end

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
---
nav_msgs/Path path

================================================================================
MSG: nav_msgs/Path
#An array of poses that represents a Path for a robot to follow
Header header
geometry_msgs/PoseStamped[] poses

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
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
")

(setf (get crosbot_explore::GetPathResponse :md5sum-) "41ca099eb8abb09e958f7da45a721668")
(setf (get crosbot_explore::GetPathResponse :datatype-) "crosbot_explore/GetPathResponse")
(setf (get crosbot_explore::GetPathResponse :definition-)
      "geometry_msgs/Pose start
geometry_msgs/Pose end

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
---
nav_msgs/Path path

================================================================================
MSG: nav_msgs/Path
#An array of poses that represents a Path for a robot to follow
Header header
geometry_msgs/PoseStamped[] poses

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
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
")



(provide :crosbot_explore/GetPath "41ca099eb8abb09e958f7da45a721668")


