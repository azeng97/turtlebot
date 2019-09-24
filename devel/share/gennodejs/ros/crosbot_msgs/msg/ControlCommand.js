// Auto-generated. Do not edit!

// (in-package crosbot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ControlCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.cmd_namespace = null;
      this.command = null;
      this.args = null;
      this.args_ints = null;
      this.args_doubles = null;
      this.args_poses = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('cmd_namespace')) {
        this.cmd_namespace = initObj.cmd_namespace
      }
      else {
        this.cmd_namespace = '';
      }
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = '';
      }
      if (initObj.hasOwnProperty('args')) {
        this.args = initObj.args
      }
      else {
        this.args = [];
      }
      if (initObj.hasOwnProperty('args_ints')) {
        this.args_ints = initObj.args_ints
      }
      else {
        this.args_ints = [];
      }
      if (initObj.hasOwnProperty('args_doubles')) {
        this.args_doubles = initObj.args_doubles
      }
      else {
        this.args_doubles = [];
      }
      if (initObj.hasOwnProperty('args_poses')) {
        this.args_poses = initObj.args_poses
      }
      else {
        this.args_poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlCommand
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [cmd_namespace]
    bufferOffset = _serializer.string(obj.cmd_namespace, buffer, bufferOffset);
    // Serialize message field [command]
    bufferOffset = _serializer.string(obj.command, buffer, bufferOffset);
    // Serialize message field [args]
    bufferOffset = _arraySerializer.string(obj.args, buffer, bufferOffset, null);
    // Serialize message field [args_ints]
    bufferOffset = _arraySerializer.int64(obj.args_ints, buffer, bufferOffset, null);
    // Serialize message field [args_doubles]
    bufferOffset = _arraySerializer.float64(obj.args_doubles, buffer, bufferOffset, null);
    // Serialize message field [args_poses]
    // Serialize the length for message field [args_poses]
    bufferOffset = _serializer.uint32(obj.args_poses.length, buffer, bufferOffset);
    obj.args_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlCommand
    let len;
    let data = new ControlCommand(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [cmd_namespace]
    data.cmd_namespace = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [command]
    data.command = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [args]
    data.args = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [args_ints]
    data.args_ints = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [args_doubles]
    data.args_doubles = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [args_poses]
    // Deserialize array length for message field [args_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.args_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.args_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.cmd_namespace.length;
    length += object.command.length;
    object.args.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.args_ints.length;
    length += 8 * object.args_doubles.length;
    length += 56 * object.args_poses.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'crosbot_msgs/ControlCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'be744f9916e492f48f3380f551cec1ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header      header
    
    # Command messages may target a particular namespace. Empty namespace targets "all"
    # (can't directly call this field namespace, due to C++ reserved keywords)
    string      cmd_namespace
    
    # Single string for command (found in controlCommands.hpp)
    #    and set of parameters for the command
    string      command
    string[]    args
    int64[]     args_ints
    float64[]   args_doubles
    geometry_msgs/Pose[] args_poses
    
    # Common Commands
    string CMD_EM_STOP      = command_EM_STOP
    string CMD_RESET        = command_reset
    string CMD_RESUME       = command_resume
    string CMD_START        = command_start
    string CMD_STOP         = command_stop
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlCommand(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.cmd_namespace !== undefined) {
      resolved.cmd_namespace = msg.cmd_namespace;
    }
    else {
      resolved.cmd_namespace = ''
    }

    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = ''
    }

    if (msg.args !== undefined) {
      resolved.args = msg.args;
    }
    else {
      resolved.args = []
    }

    if (msg.args_ints !== undefined) {
      resolved.args_ints = msg.args_ints;
    }
    else {
      resolved.args_ints = []
    }

    if (msg.args_doubles !== undefined) {
      resolved.args_doubles = msg.args_doubles;
    }
    else {
      resolved.args_doubles = []
    }

    if (msg.args_poses !== undefined) {
      resolved.args_poses = new Array(msg.args_poses.length);
      for (let i = 0; i < resolved.args_poses.length; ++i) {
        resolved.args_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.args_poses[i]);
      }
    }
    else {
      resolved.args_poses = []
    }

    return resolved;
    }
};

// Constants for message
ControlCommand.Constants = {
  CMD_EM_STOP: 'command_EM_STOP',
  CMD_RESET: 'command_reset',
  CMD_RESUME: 'command_resume',
  CMD_START: 'command_start',
  CMD_STOP: 'command_stop',
}

module.exports = ControlCommand;
