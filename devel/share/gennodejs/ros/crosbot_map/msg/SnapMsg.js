// Auto-generated. Do not edit!

// (in-package crosbot_map.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');
let crosbot_msgs = _finder('crosbot_msgs');

//-----------------------------------------------------------

class SnapMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.type = null;
      this.status = null;
      this.id = null;
      this.description = null;
      this.robot = null;
      this.pose = null;
      this.images = null;
      this.clouds = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('description')) {
        this.description = initObj.description
      }
      else {
        this.description = '';
      }
      if (initObj.hasOwnProperty('robot')) {
        this.robot = initObj.robot
      }
      else {
        this.robot = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('images')) {
        this.images = initObj.images
      }
      else {
        this.images = [];
      }
      if (initObj.hasOwnProperty('clouds')) {
        this.clouds = initObj.clouds
      }
      else {
        this.clouds = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SnapMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.int8(obj.status, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [description]
    bufferOffset = _serializer.string(obj.description, buffer, bufferOffset);
    // Serialize message field [robot]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.robot, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [images]
    // Serialize the length for message field [images]
    bufferOffset = _serializer.uint32(obj.images.length, buffer, bufferOffset);
    obj.images.forEach((val) => {
      bufferOffset = sensor_msgs.msg.Image.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [clouds]
    // Serialize the length for message field [clouds]
    bufferOffset = _serializer.uint32(obj.clouds.length, buffer, bufferOffset);
    obj.clouds.forEach((val) => {
      bufferOffset = crosbot_msgs.msg.PointCloudMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SnapMsg
    let len;
    let data = new SnapMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [description]
    data.description = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot]
    data.robot = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [images]
    // Deserialize array length for message field [images]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.images = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.images[i] = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [clouds]
    // Deserialize array length for message field [clouds]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.clouds = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.clouds[i] = crosbot_msgs.msg.PointCloudMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.description.length;
    object.images.forEach((val) => {
      length += sensor_msgs.msg.Image.getMessageSize(val);
    });
    object.clouds.forEach((val) => {
      length += crosbot_msgs.msg.PointCloudMsg.getMessageSize(val);
    });
    return length + 130;
  }

  static datatype() {
    // Returns string type for a message object
    return 'crosbot_map/SnapMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e22c37cf6db46fd5970eb0de2b60055b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    uint8 a
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SnapMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.description !== undefined) {
      resolved.description = msg.description;
    }
    else {
      resolved.description = ''
    }

    if (msg.robot !== undefined) {
      resolved.robot = geometry_msgs.msg.Pose.Resolve(msg.robot)
    }
    else {
      resolved.robot = new geometry_msgs.msg.Pose()
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.images !== undefined) {
      resolved.images = new Array(msg.images.length);
      for (let i = 0; i < resolved.images.length; ++i) {
        resolved.images[i] = sensor_msgs.msg.Image.Resolve(msg.images[i]);
      }
    }
    else {
      resolved.images = []
    }

    if (msg.clouds !== undefined) {
      resolved.clouds = new Array(msg.clouds.length);
      for (let i = 0; i < resolved.clouds.length; ++i) {
        resolved.clouds[i] = crosbot_msgs.msg.PointCloudMsg.Resolve(msg.clouds[i]);
      }
    }
    else {
      resolved.clouds = []
    }

    return resolved;
    }
};

module.exports = SnapMsg;
