; Auto-generated. Do not edit!


(cl:in-package crosbot_explore-srv)


;//! \htmlinclude SetExplorerMode-request.msg.html

(cl:defclass <SetExplorerMode-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (path
    :reader path
    :initarg :path
    :type nav_msgs-msg:Path
    :initform (cl:make-instance 'nav_msgs-msg:Path))
   (targetOrientation
    :reader targetOrientation
    :initarg :targetOrientation
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetExplorerMode-request (<SetExplorerMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetExplorerMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetExplorerMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crosbot_explore-srv:<SetExplorerMode-request> is deprecated: use crosbot_explore-srv:SetExplorerMode-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SetExplorerMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-srv:id-val is deprecated.  Use crosbot_explore-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <SetExplorerMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-srv:mode-val is deprecated.  Use crosbot_explore-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <SetExplorerMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-srv:path-val is deprecated.  Use crosbot_explore-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'targetOrientation-val :lambda-list '(m))
(cl:defmethod targetOrientation-val ((m <SetExplorerMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-srv:targetOrientation-val is deprecated.  Use crosbot_explore-srv:targetOrientation instead.")
  (targetOrientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetExplorerMode-request>) ostream)
  "Serializes a message object of type '<SetExplorerMode-request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'targetOrientation) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetExplorerMode-request>) istream)
  "Deserializes a message object of type '<SetExplorerMode-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
    (cl:setf (cl:slot-value msg 'targetOrientation) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetExplorerMode-request>)))
  "Returns string type for a service object of type '<SetExplorerMode-request>"
  "crosbot_explore/SetExplorerModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetExplorerMode-request)))
  "Returns string type for a service object of type 'SetExplorerMode-request"
  "crosbot_explore/SetExplorerModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetExplorerMode-request>)))
  "Returns md5sum for a message object of type '<SetExplorerMode-request>"
  "9ccc9bf7742b96feab802ba5adb527a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetExplorerMode-request)))
  "Returns md5sum for a message object of type 'SetExplorerMode-request"
  "9ccc9bf7742b96feab802ba5adb527a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetExplorerMode-request>)))
  "Returns full string definition for message of type '<SetExplorerMode-request>"
  (cl:format cl:nil "~%int32 id~%~%~%int32 mode~%~%~%~%~%~%~%nav_msgs/Path   path~%~%~%bool            targetOrientation~%~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetExplorerMode-request)))
  "Returns full string definition for message of type 'SetExplorerMode-request"
  (cl:format cl:nil "~%int32 id~%~%~%int32 mode~%~%~%~%~%~%~%nav_msgs/Path   path~%~%~%bool            targetOrientation~%~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetExplorerMode-request>))
  (cl:+ 0
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetExplorerMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetExplorerMode-request
    (cl:cons ':id (id msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':path (path msg))
    (cl:cons ':targetOrientation (targetOrientation msg))
))
;//! \htmlinclude SetExplorerMode-response.msg.html

(cl:defclass <SetExplorerMode-response> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetExplorerMode-response (<SetExplorerMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetExplorerMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetExplorerMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crosbot_explore-srv:<SetExplorerMode-response> is deprecated: use crosbot_explore-srv:SetExplorerMode-response instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SetExplorerMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-srv:id-val is deprecated.  Use crosbot_explore-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetExplorerMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-srv:success-val is deprecated.  Use crosbot_explore-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetExplorerMode-response>) ostream)
  "Serializes a message object of type '<SetExplorerMode-response>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetExplorerMode-response>) istream)
  "Deserializes a message object of type '<SetExplorerMode-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetExplorerMode-response>)))
  "Returns string type for a service object of type '<SetExplorerMode-response>"
  "crosbot_explore/SetExplorerModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetExplorerMode-response)))
  "Returns string type for a service object of type 'SetExplorerMode-response"
  "crosbot_explore/SetExplorerModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetExplorerMode-response>)))
  "Returns md5sum for a message object of type '<SetExplorerMode-response>"
  "9ccc9bf7742b96feab802ba5adb527a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetExplorerMode-response)))
  "Returns md5sum for a message object of type 'SetExplorerMode-response"
  "9ccc9bf7742b96feab802ba5adb527a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetExplorerMode-response>)))
  "Returns full string definition for message of type '<SetExplorerMode-response>"
  (cl:format cl:nil "~%~%int32 id~%~%~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetExplorerMode-response)))
  "Returns full string definition for message of type 'SetExplorerMode-response"
  (cl:format cl:nil "~%~%int32 id~%~%~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetExplorerMode-response>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetExplorerMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetExplorerMode-response
    (cl:cons ':id (id msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetExplorerMode)))
  'SetExplorerMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetExplorerMode)))
  'SetExplorerMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetExplorerMode)))
  "Returns string type for a service object of type '<SetExplorerMode>"
  "crosbot_explore/SetExplorerMode")