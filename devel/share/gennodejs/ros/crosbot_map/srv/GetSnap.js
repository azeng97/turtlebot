// Auto-generated. Do not edit!

// (in-package crosbot_map.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

let SnapMsg = require('../msg/SnapMsg.js');

//-----------------------------------------------------------

class GetSnapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = new std_msgs.msg.UInt8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetSnapRequest
    // Serialize message field [id]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetSnapRequest
    let len;
    let data = new GetSnapRequest(null);
    // Deserialize message field [id]
    data.id = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crosbot_map/GetSnapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5b8a24a7431a27d7ce0f6285d812cfe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Int32 id
    std_msgs/UInt8 type
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    ================================================================================
    MSG: std_msgs/UInt8
    uint8 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetSnapRequest(null);
    if (msg.id !== undefined) {
      resolved.id = std_msgs.msg.Int32.Resolve(msg.id)
    }
    else {
      resolved.id = new std_msgs.msg.Int32()
    }

    if (msg.type !== undefined) {
      resolved.type = std_msgs.msg.UInt8.Resolve(msg.type)
    }
    else {
      resolved.type = new std_msgs.msg.UInt8()
    }

    return resolved;
    }
};

class GetSnapResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.snap = null;
    }
    else {
      if (initObj.hasOwnProperty('snap')) {
        this.snap = initObj.snap
      }
      else {
        this.snap = new SnapMsg();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetSnapResponse
    // Serialize message field [snap]
    bufferOffset = SnapMsg.serialize(obj.snap, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetSnapResponse
    let len;
    let data = new GetSnapResponse(null);
    // Deserialize message field [snap]
    data.snap = SnapMsg.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += SnapMsg.getMessageSize(object.snap);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crosbot_map/GetSnapResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '86a4adda3fd70831e8e0fe6e378f3172';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    crosbot_map/SnapMsg snap
    
    
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
    uint8 a
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetSnapResponse(null);
    if (msg.snap !== undefined) {
      resolved.snap = SnapMsg.Resolve(msg.snap)
    }
    else {
      resolved.snap = new SnapMsg()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetSnapRequest,
  Response: GetSnapResponse,
  md5sum() { return 'ed02702e11dc9a36e98cb929d7f780ba'; },
  datatype() { return 'crosbot_map/GetSnap'; }
};
