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


//-----------------------------------------------------------

class ModifySnapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.type = null;
      this.status = null;
      this.description = null;
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
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('description')) {
        this.description = initObj.description
      }
      else {
        this.description = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModifySnapRequest
    // Serialize message field [id]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.type, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.status, buffer, bufferOffset);
    // Serialize message field [description]
    bufferOffset = std_msgs.msg.String.serialize(obj.description, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModifySnapRequest
    let len;
    let data = new ModifySnapRequest(null);
    // Deserialize message field [id]
    data.id = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [description]
    data.description = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.description);
    return length + 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crosbot_map/ModifySnapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1c64c0c3bf7d1de1b6bf7e6bbdda46c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Int32  id
    std_msgs/UInt8  type
    std_msgs/UInt8  status
    std_msgs/String description
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    ================================================================================
    MSG: std_msgs/UInt8
    uint8 data
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModifySnapRequest(null);
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

    if (msg.status !== undefined) {
      resolved.status = std_msgs.msg.UInt8.Resolve(msg.status)
    }
    else {
      resolved.status = new std_msgs.msg.UInt8()
    }

    if (msg.description !== undefined) {
      resolved.description = std_msgs.msg.String.Resolve(msg.description)
    }
    else {
      resolved.description = new std_msgs.msg.String()
    }

    return resolved;
    }
};

class ModifySnapResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModifySnapResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModifySnapResponse
    let len;
    let data = new ModifySnapResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crosbot_map/ModifySnapResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModifySnapResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: ModifySnapRequest,
  Response: ModifySnapResponse,
  md5sum() { return 'c1c64c0c3bf7d1de1b6bf7e6bbdda46c'; },
  datatype() { return 'crosbot_map/ModifySnap'; }
};
