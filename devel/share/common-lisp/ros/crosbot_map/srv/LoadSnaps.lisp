; Auto-generated. Do not edit!


(cl:in-package crosbot_map-srv)


;//! \htmlinclude LoadSnaps-request.msg.html

(cl:defclass <LoadSnaps-request> (roslisp-msg-protocol:ros-message)
  ((snaps
    :reader snaps
    :initarg :snaps
    :type (cl:vector crosbot_map-msg:SnapMsg)
   :initform (cl:make-array 0 :element-type 'crosbot_map-msg:SnapMsg :initial-element (cl:make-instance 'crosbot_map-msg:SnapMsg))))
)

(cl:defclass LoadSnaps-request (<LoadSnaps-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadSnaps-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadSnaps-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crosbot_map-srv:<LoadSnaps-request> is deprecated: use crosbot_map-srv:LoadSnaps-request instead.")))

(cl:ensure-generic-function 'snaps-val :lambda-list '(m))
(cl:defmethod snaps-val ((m <LoadSnaps-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_map-srv:snaps-val is deprecated.  Use crosbot_map-srv:snaps instead.")
  (snaps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadSnaps-request>) ostream)
  "Serializes a message object of type '<LoadSnaps-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'snaps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'snaps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadSnaps-request>) istream)
  "Deserializes a message object of type '<LoadSnaps-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'snaps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'snaps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'crosbot_map-msg:SnapMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadSnaps-request>)))
  "Returns string type for a service object of type '<LoadSnaps-request>"
  "crosbot_map/LoadSnapsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadSnaps-request)))
  "Returns string type for a service object of type 'LoadSnaps-request"
  "crosbot_map/LoadSnapsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadSnaps-request>)))
  "Returns md5sum for a message object of type '<LoadSnaps-request>"
  "8666a8edc31971916e18761547a3684c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadSnaps-request)))
  "Returns md5sum for a message object of type 'LoadSnaps-request"
  "8666a8edc31971916e18761547a3684c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadSnaps-request>)))
  "Returns full string definition for message of type '<LoadSnaps-request>"
  (cl:format cl:nil "crosbot_map/SnapMsg[] snaps~%~%================================================================================~%MSG: crosbot_map/SnapMsg~%Header header~%uint8 type~%int8 status~%uint32 id~%string description~%geometry_msgs/Pose robot    # Global to given frame~%geometry_msgs/Pose pose     # Robot relative~%~%sensor_msgs/Image[] images~%crosbot_msgs/PointCloudMsg[] clouds~%#crosbot/ColouredCloudMsg[] colouredClouds~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: crosbot_msgs/PointCloudMsg~%Header header~%geometry_msgs/Point[] points	# The points in the cloud.~%ColourMsg[] colours				# The colours of the points. Can be empty.~%================================================================================~%MSG: crosbot_msgs/ColourMsg~%uint8 r~%uint8 g~%uint8 b~%uint8 a~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadSnaps-request)))
  "Returns full string definition for message of type 'LoadSnaps-request"
  (cl:format cl:nil "crosbot_map/SnapMsg[] snaps~%~%================================================================================~%MSG: crosbot_map/SnapMsg~%Header header~%uint8 type~%int8 status~%uint32 id~%string description~%geometry_msgs/Pose robot    # Global to given frame~%geometry_msgs/Pose pose     # Robot relative~%~%sensor_msgs/Image[] images~%crosbot_msgs/PointCloudMsg[] clouds~%#crosbot/ColouredCloudMsg[] colouredClouds~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: crosbot_msgs/PointCloudMsg~%Header header~%geometry_msgs/Point[] points	# The points in the cloud.~%ColourMsg[] colours				# The colours of the points. Can be empty.~%================================================================================~%MSG: crosbot_msgs/ColourMsg~%uint8 r~%uint8 g~%uint8 b~%uint8 a~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadSnaps-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'snaps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadSnaps-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadSnaps-request
    (cl:cons ':snaps (snaps msg))
))
;//! \htmlinclude LoadSnaps-response.msg.html

(cl:defclass <LoadSnaps-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoadSnaps-response (<LoadSnaps-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadSnaps-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadSnaps-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crosbot_map-srv:<LoadSnaps-response> is deprecated: use crosbot_map-srv:LoadSnaps-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LoadSnaps-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crosbot_map-srv:success-val is deprecated.  Use crosbot_map-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadSnaps-response>) ostream)
  "Serializes a message object of type '<LoadSnaps-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadSnaps-response>) istream)
  "Deserializes a message object of type '<LoadSnaps-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadSnaps-response>)))
  "Returns string type for a service object of type '<LoadSnaps-response>"
  "crosbot_map/LoadSnapsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadSnaps-response)))
  "Returns string type for a service object of type 'LoadSnaps-response"
  "crosbot_map/LoadSnapsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadSnaps-response>)))
  "Returns md5sum for a message object of type '<LoadSnaps-response>"
  "8666a8edc31971916e18761547a3684c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadSnaps-response)))
  "Returns md5sum for a message object of type 'LoadSnaps-response"
  "8666a8edc31971916e18761547a3684c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadSnaps-response>)))
  "Returns full string definition for message of type '<LoadSnaps-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadSnaps-response)))
  "Returns full string definition for message of type 'LoadSnaps-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadSnaps-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadSnaps-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadSnaps-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadSnaps)))
  'LoadSnaps-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadSnaps)))
  'LoadSnaps-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadSnaps)))
  "Returns string type for a service object of type '<LoadSnaps>"
  "crosbot_map/LoadSnaps")