; Auto-generated. Do not edit!


(cl:in-package crosbot_msgs-msg)


;//! \htmlinclude ControlStatus.msg.html

(cl:defclass <ControlStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (stats_namespace
    :reader stats_namespace
    :initarg :stats_namespace
    :type cl:string
    :initform "")
   (level
    :reader level
    :initarg :level
    :type cl:string
    :initform "")
   (status
    :reader status
    :initarg :status
    :type cl:string
    :initform "")
   (args
    :reader args
    :initarg :args
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ControlStatus (<ControlStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crosbot_msgs-msg:<ControlStatus> is deprecated: use crosbot_msgs-msg:ControlStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ControlStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_msgs-msg:header-val is deprecated.  Use crosbot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'stats_namespace-val :lambda-list '(m))
(cl:defmethod stats_namespace-val ((m <ControlStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_msgs-msg:stats_namespace-val is deprecated.  Use crosbot_msgs-msg:stats_namespace instead.")
  (stats_namespace m))

(cl:ensure-generic-function 'level-val :lambda-list '(m))
(cl:defmethod level-val ((m <ControlStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_msgs-msg:level-val is deprecated.  Use crosbot_msgs-msg:level instead.")
  (level m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ControlStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_msgs-msg:status-val is deprecated.  Use crosbot_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'args-val :lambda-list '(m))
(cl:defmethod args-val ((m <ControlStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_msgs-msg:args-val is deprecated.  Use crosbot_msgs-msg:args instead.")
  (args m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ControlStatus>)))
    "Constants for message type '<ControlStatus>"
  '((:LEVEL_ERROR . "level_error")
    (:LEVEL_INFO . "level_info")
    (:LEVEL_WARNING . "level_warning"))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ControlStatus)))
    "Constants for message type 'ControlStatus"
  '((:LEVEL_ERROR . "level_error")
    (:LEVEL_INFO . "level_info")
    (:LEVEL_WARNING . "level_warning"))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlStatus>) ostream)
  "Serializes a message object of type '<ControlStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'stats_namespace))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'stats_namespace))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'level))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'args))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'args))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlStatus>) istream)
  "Deserializes a message object of type '<ControlStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stats_namespace) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'stats_namespace) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'level) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'level) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'args) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'args)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlStatus>)))
  "Returns string type for a message object of type '<ControlStatus>"
  "crosbot_msgs/ControlStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlStatus)))
  "Returns string type for a message object of type 'ControlStatus"
  "crosbot_msgs/ControlStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlStatus>)))
  "Returns md5sum for a message object of type '<ControlStatus>"
  "4b1b69ac1f23ea296f1f5dda15caa88f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlStatus)))
  "Returns md5sum for a message object of type 'ControlStatus"
  "4b1b69ac1f23ea296f1f5dda15caa88f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlStatus>)))
  "Returns full string definition for message of type '<ControlStatus>"
  (cl:format cl:nil "~%Header      header~%~%# Status messages may come from a specific namespace. Empty namespace comes from \"all\".~%# (can't directly call this field namespace, due to C++ reserved keywords)~%string      stats_namespace~%~%# Level of the status (info, error, warning)~%string      level~%~%# Status description~%string      status~%string[]    args~%~%# Status values~%string LEVEL_ERROR          = \"level_error\"~%string LEVEL_INFO           = \"level_info\"~%string LEVEL_WARNING        = \"level_warning\"~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlStatus)))
  "Returns full string definition for message of type 'ControlStatus"
  (cl:format cl:nil "~%Header      header~%~%# Status messages may come from a specific namespace. Empty namespace comes from \"all\".~%# (can't directly call this field namespace, due to C++ reserved keywords)~%string      stats_namespace~%~%# Level of the status (info, error, warning)~%string      level~%~%# Status description~%string      status~%string[]    args~%~%# Status values~%string LEVEL_ERROR          = \"level_error\"~%string LEVEL_INFO           = \"level_info\"~%string LEVEL_WARNING        = \"level_warning\"~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'stats_namespace))
     4 (cl:length (cl:slot-value msg 'level))
     4 (cl:length (cl:slot-value msg 'status))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'args) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlStatus
    (cl:cons ':header (header msg))
    (cl:cons ':stats_namespace (stats_namespace msg))
    (cl:cons ':level (level msg))
    (cl:cons ':status (status msg))
    (cl:cons ':args (args msg))
))
