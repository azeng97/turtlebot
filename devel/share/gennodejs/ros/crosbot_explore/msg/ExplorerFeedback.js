// Auto-generated. Do not edit!

// (in-package crosbot_explore.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ExplorerFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.status = null;
      this.operating = null;
      this.searchStrategy = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('operating')) {
        this.operating = initObj.operating
      }
      else {
        this.operating = false;
      }
      if (initObj.hasOwnProperty('searchStrategy')) {
        this.searchStrategy = initObj.searchStrategy
      }
      else {
        this.searchStrategy = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExplorerFeedback
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.int32(obj.status, buffer, bufferOffset);
    // Serialize message field [operating]
    bufferOffset = _serializer.bool(obj.operating, buffer, bufferOffset);
    // Serialize message field [searchStrategy]
    bufferOffset = _serializer.int32(obj.searchStrategy, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExplorerFeedback
    let len;
    let data = new ExplorerFeedback(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [operating]
    data.operating = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [searchStrategy]
    data.searchStrategy = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'crosbot_explore/ExplorerFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14c37f9333fc84ff10be1492d008d4b0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Corresponding Action id
    int32 id
    
    # Status (as listed in crosbot_explore/explorer.hpp)
    int32   STATUS_PAUSED   = 0
    int32   STATUS_RUNNING  = 1
    int32   STATUS_ARRIVED  = 2
    int32   STATUS_BLOCKED  = 3
    int32 status
    
    # Keep updated on continuing state of exploration
    # Search strategy uses mode numbers
    bool   operating
    int32  searchStrategy
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExplorerFeedback(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.operating !== undefined) {
      resolved.operating = msg.operating;
    }
    else {
      resolved.operating = false
    }

    if (msg.searchStrategy !== undefined) {
      resolved.searchStrategy = msg.searchStrategy;
    }
    else {
      resolved.searchStrategy = 0
    }

    return resolved;
    }
};

// Constants for message
ExplorerFeedback.Constants = {
  STATUS_PAUSED: 0,
  STATUS_RUNNING: 1,
  STATUS_ARRIVED: 2,
  STATUS_BLOCKED: 3,
}

module.exports = ExplorerFeedback;
