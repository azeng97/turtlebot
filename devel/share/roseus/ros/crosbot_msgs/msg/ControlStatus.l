;; Auto-generated. Do not edit!


(when (boundp 'crosbot_msgs::ControlStatus)
  (if (not (find-package "CROSBOT_MSGS"))
    (make-package "CROSBOT_MSGS"))
  (shadow 'ControlStatus (find-package "CROSBOT_MSGS")))
(unless (find-package "CROSBOT_MSGS::CONTROLSTATUS")
  (make-package "CROSBOT_MSGS::CONTROLSTATUS"))

(in-package "ROS")
;;//! \htmlinclude ControlStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*LEVEL_ERROR*" (find-package "CROSBOT_MSGS::CONTROLSTATUS"))
(shadow '*LEVEL_ERROR* (find-package "CROSBOT_MSGS::CONTROLSTATUS"))
(defconstant crosbot_msgs::ControlStatus::*LEVEL_ERROR* "\"level_error\"")
(intern "*LEVEL_INFO*" (find-package "CROSBOT_MSGS::CONTROLSTATUS"))
(shadow '*LEVEL_INFO* (find-package "CROSBOT_MSGS::CONTROLSTATUS"))
(defconstant crosbot_msgs::ControlStatus::*LEVEL_INFO* "\"level_info\"")
(intern "*LEVEL_WARNING*" (find-package "CROSBOT_MSGS::CONTROLSTATUS"))
(shadow '*LEVEL_WARNING* (find-package "CROSBOT_MSGS::CONTROLSTATUS"))
(defconstant crosbot_msgs::ControlStatus::*LEVEL_WARNING* "\"level_warning\"")
(defclass crosbot_msgs::ControlStatus
  :super ros::object
  :slots (_header _stats_namespace _level _status _args ))

(defmethod crosbot_msgs::ControlStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:stats_namespace __stats_namespace) "")
    ((:level __level) "")
    ((:status __status) "")
    ((:args __args) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _stats_namespace (string __stats_namespace))
   (setq _level (string __level))
   (setq _status (string __status))
   (setq _args __args)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:stats_namespace
   (&optional __stats_namespace)
   (if __stats_namespace (setq _stats_namespace __stats_namespace)) _stats_namespace)
  (:level
   (&optional __level)
   (if __level (setq _level __level)) _level)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:args
   (&optional __args)
   (if __args (setq _args __args)) _args)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _stats_namespace
    4 (length _stats_namespace)
    ;; string _level
    4 (length _level)
    ;; string _status
    4 (length _status)
    ;; string[] _args
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _args)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _stats_namespace
       (write-long (length _stats_namespace) s) (princ _stats_namespace s)
     ;; string _level
       (write-long (length _level) s) (princ _level s)
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;; string[] _args
     (write-long (length _args) s)
     (dolist (elem _args)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _stats_namespace
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _stats_namespace (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _level
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _level (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _args
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _args (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _args i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get crosbot_msgs::ControlStatus :md5sum-) "4b1b69ac1f23ea296f1f5dda15caa88f")
(setf (get crosbot_msgs::ControlStatus :datatype-) "crosbot_msgs/ControlStatus")
(setf (get crosbot_msgs::ControlStatus :definition-)
      "
Header      header

# Status messages may come from a specific namespace. Empty namespace comes from \"all\".
# (can't directly call this field namespace, due to C++ reserved keywords)
string      stats_namespace

# Level of the status (info, error, warning)
string      level

# Status description
string      status
string[]    args

# Status values
string LEVEL_ERROR          = \"level_error\"
string LEVEL_INFO           = \"level_info\"
string LEVEL_WARNING        = \"level_warning\"

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

")



(provide :crosbot_msgs/ControlStatus "4b1b69ac1f23ea296f1f5dda15caa88f")


