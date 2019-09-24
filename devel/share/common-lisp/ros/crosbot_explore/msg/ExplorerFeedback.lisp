; Auto-generated. Do not edit!


(cl:in-package crosbot_explore-msg)


;//! \htmlinclude ExplorerFeedback.msg.html

(cl:defclass <ExplorerFeedback> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0)
   (operating
    :reader operating
    :initarg :operating
    :type cl:boolean
    :initform cl:nil)
   (searchStrategy
    :reader searchStrategy
    :initarg :searchStrategy
    :type cl:integer
    :initform 0))
)

(cl:defclass ExplorerFeedback (<ExplorerFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExplorerFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExplorerFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crosbot_explore-msg:<ExplorerFeedback> is deprecated: use crosbot_explore-msg:ExplorerFeedback instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ExplorerFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-msg:id-val is deprecated.  Use crosbot_explore-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ExplorerFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-msg:status-val is deprecated.  Use crosbot_explore-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'operating-val :lambda-list '(m))
(cl:defmethod operating-val ((m <ExplorerFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-msg:operating-val is deprecated.  Use crosbot_explore-msg:operating instead.")
  (operating m))

(cl:ensure-generic-function 'searchStrategy-val :lambda-list '(m))
(cl:defmethod searchStrategy-val ((m <ExplorerFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_explore-msg:searchStrategy-val is deprecated.  Use crosbot_explore-msg:searchStrategy instead.")
  (searchStrategy m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ExplorerFeedback>)))
    "Constants for message type '<ExplorerFeedback>"
  '((:STATUS_PAUSED . 0)
    (:STATUS_RUNNING . 1)
    (:STATUS_ARRIVED . 2)
    (:STATUS_BLOCKED . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ExplorerFeedback)))
    "Constants for message type 'ExplorerFeedback"
  '((:STATUS_PAUSED . 0)
    (:STATUS_RUNNING . 1)
    (:STATUS_ARRIVED . 2)
    (:STATUS_BLOCKED . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExplorerFeedback>) ostream)
  "Serializes a message object of type '<ExplorerFeedback>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'operating) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'searchStrategy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExplorerFeedback>) istream)
  "Deserializes a message object of type '<ExplorerFeedback>"
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
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'operating) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'searchStrategy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExplorerFeedback>)))
  "Returns string type for a message object of type '<ExplorerFeedback>"
  "crosbot_explore/ExplorerFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExplorerFeedback)))
  "Returns string type for a message object of type 'ExplorerFeedback"
  "crosbot_explore/ExplorerFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExplorerFeedback>)))
  "Returns md5sum for a message object of type '<ExplorerFeedback>"
  "14c37f9333fc84ff10be1492d008d4b0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExplorerFeedback)))
  "Returns md5sum for a message object of type 'ExplorerFeedback"
  "14c37f9333fc84ff10be1492d008d4b0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExplorerFeedback>)))
  "Returns full string definition for message of type '<ExplorerFeedback>"
  (cl:format cl:nil "# Corresponding Action id~%int32 id~%~%# Status (as listed in crosbot_explore/explorer.hpp)~%int32   STATUS_PAUSED   = 0~%int32   STATUS_RUNNING  = 1~%int32   STATUS_ARRIVED  = 2~%int32   STATUS_BLOCKED  = 3~%int32 status~%~%# Keep updated on continuing state of exploration~%# Search strategy uses mode numbers~%bool   operating~%int32  searchStrategy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExplorerFeedback)))
  "Returns full string definition for message of type 'ExplorerFeedback"
  (cl:format cl:nil "# Corresponding Action id~%int32 id~%~%# Status (as listed in crosbot_explore/explorer.hpp)~%int32   STATUS_PAUSED   = 0~%int32   STATUS_RUNNING  = 1~%int32   STATUS_ARRIVED  = 2~%int32   STATUS_BLOCKED  = 3~%int32 status~%~%# Keep updated on continuing state of exploration~%# Search strategy uses mode numbers~%bool   operating~%int32  searchStrategy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExplorerFeedback>))
  (cl:+ 0
     4
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExplorerFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'ExplorerFeedback
    (cl:cons ':id (id msg))
    (cl:cons ':status (status msg))
    (cl:cons ':operating (operating msg))
    (cl:cons ':searchStrategy (searchStrategy msg))
))
