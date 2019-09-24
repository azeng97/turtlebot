;; Auto-generated. Do not edit!


(when (boundp 'crosbot_msgs::PointCloudMsg)
  (if (not (find-package "CROSBOT_MSGS"))
    (make-package "CROSBOT_MSGS"))
  (shadow 'PointCloudMsg (find-package "CROSBOT_MSGS")))
(unless (find-package "CROSBOT_MSGS::POINTCLOUDMSG")
  (make-package "CROSBOT_MSGS::POINTCLOUDMSG"))

(in-package "ROS")
;;//! \htmlinclude PointCloudMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass crosbot_msgs::PointCloudMsg
  :super ros::object
  :slots (_header _points _colours ))

(defmethod crosbot_msgs::PointCloudMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:points __points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:colours __colours) (let (r) (dotimes (i 0) (push (instance crosbot_msgs::ColourMsg :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _points __points)
   (setq _colours __colours)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:colours
   (&rest __colours)
   (if (keywordp (car __colours))
       (send* _colours __colours)
     (progn
       (if __colours (setq _colours (car __colours)))
       _colours)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; crosbot_msgs/ColourMsg[] _colours
    (apply #'+ (send-all _colours :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; crosbot_msgs/ColourMsg[] _colours
     (write-long (length _colours) s)
     (dolist (elem _colours)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; crosbot_msgs/ColourMsg[] _colours
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _colours (let (r) (dotimes (i n) (push (instance crosbot_msgs::ColourMsg :init) r)) r))
     (dolist (elem- _colours)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get crosbot_msgs::PointCloudMsg :md5sum-) "d2b0c48c6f0b4cbe0cb88cfafd58a3ad")
(setf (get crosbot_msgs::PointCloudMsg :datatype-) "crosbot_msgs/PointCloudMsg")
(setf (get crosbot_msgs::PointCloudMsg :definition-)
      "Header header
geometry_msgs/Point[] points	# The points in the cloud.
ColourMsg[] colours				# The colours of the points. Can be empty.
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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: crosbot_msgs/ColourMsg
uint8 r
uint8 g
uint8 b
uint8 a
")



(provide :crosbot_msgs/PointCloudMsg "d2b0c48c6f0b4cbe0cb88cfafd58a3ad")


