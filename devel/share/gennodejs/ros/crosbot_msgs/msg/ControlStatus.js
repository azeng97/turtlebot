// Auto-generated. Do not edit!

// (in-package crosbot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ControlStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.stats_namespace = null;
      this.level = null;
      this.status = null;
      this.args = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('stats_namespace')) {
        this.stats_namespace = initObj.stats_namespace
      }
      else {
        this.stats_namespace = '';
      }
      if (initObj.hasOwnProperty('level')) {
        this.level = initObj.level
      }
      else {
        this.level = '';
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
      if (initObj.hasOwnProperty('args')) {
        this.args = initObj.args
      }
      else {
        this.args = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [stats_namespace]
    bufferOffset = _serializer.string(obj.stats_namespace, buffer, bufferOffset);
    // Serialize message field [level]
    bufferOffset = _serializer.string(obj.level, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    // Serialize message field [args]
    bufferOffset = _arraySerializer.string(obj.args, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlStatus
    let len;
    let data = new ControlStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [stats_namespace]
    data.stats_namespace = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [level]
    data.level = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [args]
    data.args = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.stats_namespace.length;
    length += object.level.length;
    length += object.status.length;
    object.args.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'crosbot_msgs/ControlStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4b1b69ac1f23ea296f1f5dda15caa88f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    Header      header
    
    # Status messages may come from a specific namespace. Empty namespace comes from "all".
    # (can't directly call this field namespace, due to C++ reserved keywords)
    string      stats_namespace
    
    # Level of the status (info, error, warning)
    string      level
    
    # Status description
    string      status
    string[]    args
    
    # Status values
    string LEVEL_ERROR          = "level_error"
    string LEVEL_INFO           = "level_info"
    string LEVEL_WARNING        = "level_warning"
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.stats_namespace !== undefined) {
      resolved.stats_namespace = msg.stats_namespace;
    }
    else {
      resolved.stats_namespace = ''
    }

    if (msg.level !== undefined) {
      resolved.level = msg.level;
    }
    else {
      resolved.level = ''
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    if (msg.args !== undefined) {
      resolved.args = msg.args;
    }
    else {
      resolved.args = []
    }

    return resolved;
    }
};

// Constants for message
ControlStatus.Constants = {
  LEVEL_ERROR: '"level_error"',
  LEVEL_INFO: '"level_info"',
  LEVEL_WARNING: '"level_warning"',
}

module.exports = ControlStatus;
