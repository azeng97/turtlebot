// Auto-generated. Do not edit!

// (in-package crosbot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ColourMsg = require('./ColourMsg.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ColouredPointMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.p = null;
      this.c = null;
    }
    else {
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('c')) {
        this.c = initObj.c
      }
      else {
        this.c = new ColourMsg();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ColouredPointMsg
    // Serialize message field [p]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.p, buffer, bufferOffset);
    // Serialize message field [c]
    bufferOffset = ColourMsg.serialize(obj.c, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ColouredPointMsg
    let len;
    let data = new ColouredPointMsg(null);
    // Deserialize message field [p]
    data.p = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [c]
    data.c = ColourMsg.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'crosbot_msgs/ColouredPointMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd75f9aa7b2fc4712f55c6e6703f1c090';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point p
    ColourMsg c
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
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
    const resolved = new ColouredPointMsg(null);
    if (msg.p !== undefined) {
      resolved.p = geometry_msgs.msg.Point.Resolve(msg.p)
    }
    else {
      resolved.p = new geometry_msgs.msg.Point()
    }

    if (msg.c !== undefined) {
      resolved.c = ColourMsg.Resolve(msg.c)
    }
    else {
      resolved.c = new ColourMsg()
    }

    return resolved;
    }
};

module.exports = ColouredPointMsg;
