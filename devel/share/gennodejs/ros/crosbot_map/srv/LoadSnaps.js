// Auto-generated. Do not edit!

// (in-package crosbot_map.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SnapMsg = require('../msg/SnapMsg.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class LoadSnapsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.snaps = null;
    }
    else {
      if (initObj.hasOwnProperty('snaps')) {
        this.snaps = initObj.snaps
      }
      else {
        this.snaps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadSnapsRequest
    // Serialize message field [snaps]
    // Serialize the length for message field [snaps]
    bufferOffset = _serializer.uint32(obj.snaps.length, buffer, bufferOffset);
    obj.snaps.forEach((val) => {
      bufferOffset = SnapMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadSnapsRequest
    let len;
    let data = new LoadSnapsRequest(null);
    // Deserialize message field [snaps]
    // Deserialize array length for message field [snaps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.snaps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.snaps[i] = SnapMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.snaps.forEach((val) => {
      length += SnapMsg.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crosbot_map/LoadSnapsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a9950552cda46ef9fb7f384a56cf8cd8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    crosbot_map/SnapMsg[] snaps
    
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
    const resolved = new LoadSnapsRequest(null);
    if (msg.snaps !== undefined) {
      resolved.snaps = new Array(msg.snaps.length);
      for (let i = 0; i < resolved.snaps.length; ++i) {
        resolved.snaps[i] = SnapMsg.Resolve(msg.snaps[i]);
      }
    }
    else {
      resolved.snaps = []
    }

    return resolved;
    }
};

class LoadSnapsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadSnapsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadSnapsResponse
    let len;
    let data = new LoadSnapsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crosbot_map/LoadSnapsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadSnapsResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: LoadSnapsRequest,
  Response: LoadSnapsResponse,
  md5sum() { return '8666a8edc31971916e18761547a3684c'; },
  datatype() { return 'crosbot_map/LoadSnaps'; }
};
