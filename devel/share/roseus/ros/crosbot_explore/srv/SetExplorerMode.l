;; Auto-generated. Do not edit!


(when (boundp 'crosbot_explore::SetExplorerMode)
  (if (not (find-package "CROSBOT_EXPLORE"))
    (make-package "CROSBOT_EXPLORE"))
  (shadow 'SetExplorerMode (find-package "CROSBOT_EXPLORE")))
(unless (find-package "CROSBOT_EXPLORE::SETEXPLORERMODE")
  (make-package "CROSBOT_EXPLORE::SETEXPLORERMODE"))
(unless (find-package "CROSBOT_EXPLORE::SETEXPLORERMODEREQUEST")
  (make-package "CROSBOT_EXPLORE::SETEXPLORERMODEREQUEST"))
(unless (find-package "CROSBOT_EXPLORE::SETEXPLORERMODERESPONSE")
  (make-package "CROSBOT_EXPLORE::SETEXPLORERMODERESPONSE"))

(in-package "ROS")

(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))




(defclass crosbot_explore::SetExplorerModeRequest
  :super ros::object
  :slots (_id _mode _path _targetOrientation ))

(defmethod crosbot_explore::SetExplorerModeRequest
  (:init
   (&key
    ((:id __id) 0)
    ((:mode __mode) 0)
    ((:path __path) (instance nav_msgs::Path :init))
    ((:targetOrientation __targetOrientation) nil)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _mode (round __mode))
   (setq _path __path)
   (setq _targetOrientation __targetOrientation)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:targetOrientation
   (&optional __targetOrientation)
   (if __targetOrientation (setq _targetOrientation __targetOrientation)) _targetOrientation)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _mode
    4
    ;; nav_msgs/Path _path
    (send _path :serialization-length)
    ;; bool _targetOrientation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _mode
       (write-long _mode s)
     ;; nav_msgs/Path _path
       (send _path :serialize s)
     ;; bool _targetOrientation
       (if _targetOrientation (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; nav_msgs/Path _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;; bool _targetOrientation
     (setq _targetOrientation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass crosbot_explore::SetExplorerModeResponse
  :super ros::object
  :slots (_id _success ))

(defmethod crosbot_explore::SetExplorerModeResponse
  (:init
   (&key
    ((:id __id) 0)
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _success __success)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass crosbot_explore::SetExplorerMode
  :super ros::object
  :slots ())

(setf (get crosbot_explore::SetExplorerMode :md5sum-) "9ccc9bf7742b96feab802ba5adb527a6")
(setf (get crosbot_explore::SetExplorerMode :datatype-) "crosbot_explore/SetExplorerMode")
(setf (get crosbot_explore::SetExplorerMode :request) crosbot_explore::SetExplorerModeRequest)
(setf (get crosbot_explore::SetExplorerMode :response) crosbot_explore::SetExplorerModeResponse)

(defmethod crosbot_explore::SetExplorerModeRequest
  (:response () (instance crosbot_explore::SetExplorerModeResponse :init)))

(setf (get crosbot_explore::SetExplorerModeRequest :md5sum-) "9ccc9bf7742b96feab802ba5adb527a6")
(setf (get crosbot_explore::SetExplorerModeRequest :datatype-) "crosbot_explore/SetExplorerModeRequest")
(setf (get crosbot_explore::SetExplorerModeRequest :definition-)
      "
int32 id


int32 mode






nav_msgs/Path   path


bool            targetOrientation


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
---


int32 id


bool success
")

(setf (get crosbot_explore::SetExplorerModeResponse :md5sum-) "9ccc9bf7742b96feab802ba5adb527a6")
(setf (get crosbot_explore::SetExplorerModeResponse :datatype-) "crosbot_explore/SetExplorerModeResponse")
(setf (get crosbot_explore::SetExplorerModeResponse :definition-)
      "
int32 id


int32 mode






nav_msgs/Path   path


bool            targetOrientation


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
---


int32 id


bool success
")



(provide :crosbot_explore/SetExplorerMode "9ccc9bf7742b96feab802ba5adb527a6")


