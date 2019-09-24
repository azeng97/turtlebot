// Generated by gencpp from file crosbot_msgs/ControlCommand.msg
// DO NOT EDIT!


#ifndef CROSBOT_MSGS_MESSAGE_CONTROLCOMMAND_H
#define CROSBOT_MSGS_MESSAGE_CONTROLCOMMAND_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Pose.h>

namespace crosbot_msgs
{
template <class ContainerAllocator>
struct ControlCommand_
{
  typedef ControlCommand_<ContainerAllocator> Type;

  ControlCommand_()
    : header()
    , cmd_namespace()
    , command()
    , args()
    , args_ints()
    , args_doubles()
    , args_poses()  {
    }
  ControlCommand_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , cmd_namespace(_alloc)
    , command(_alloc)
    , args(_alloc)
    , args_ints(_alloc)
    , args_doubles(_alloc)
    , args_poses(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _cmd_namespace_type;
  _cmd_namespace_type cmd_namespace;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _command_type;
  _command_type command;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _args_type;
  _args_type args;

   typedef std::vector<int64_t, typename ContainerAllocator::template rebind<int64_t>::other >  _args_ints_type;
  _args_ints_type args_ints;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _args_doubles_type;
  _args_doubles_type args_doubles;

   typedef std::vector< ::geometry_msgs::Pose_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Pose_<ContainerAllocator> >::other >  _args_poses_type;
  _args_poses_type args_poses;




  static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  CMD_EM_STOP;
  static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  CMD_RESET;
  static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  CMD_RESUME;
  static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  CMD_START;
  static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  CMD_STOP;

  typedef boost::shared_ptr< ::crosbot_msgs::ControlCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::crosbot_msgs::ControlCommand_<ContainerAllocator> const> ConstPtr;

}; // struct ControlCommand_

typedef ::crosbot_msgs::ControlCommand_<std::allocator<void> > ControlCommand;

typedef boost::shared_ptr< ::crosbot_msgs::ControlCommand > ControlCommandPtr;
typedef boost::shared_ptr< ::crosbot_msgs::ControlCommand const> ControlCommandConstPtr;

// constants requiring out of line definition

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      ControlCommand_<ContainerAllocator>::CMD_EM_STOP =
        
          "command_EM_STOP"
        
        ;
   

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      ControlCommand_<ContainerAllocator>::CMD_RESET =
        
          "command_reset"
        
        ;
   

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      ControlCommand_<ContainerAllocator>::CMD_RESUME =
        
          "command_resume"
        
        ;
   

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      ControlCommand_<ContainerAllocator>::CMD_START =
        
          "command_start"
        
        ;
   

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      ControlCommand_<ContainerAllocator>::CMD_STOP =
        
          "command_stop"
        
        ;
   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::crosbot_msgs::ControlCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace crosbot_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'crosbot_msgs': ['/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry', '/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls', '/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::crosbot_msgs::ControlCommand_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crosbot_msgs::ControlCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crosbot_msgs::ControlCommand_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "be744f9916e492f48f3380f551cec1ce";
  }

  static const char* value(const ::crosbot_msgs::ControlCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbe744f9916e492f4ULL;
  static const uint64_t static_value2 = 0x8f3380f551cec1ceULL;
};

template<class ContainerAllocator>
struct DataType< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "crosbot_msgs/ControlCommand";
  }

  static const char* value(const ::crosbot_msgs::ControlCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header      header\n\
\n\
# Command messages may target a particular namespace. Empty namespace targets \"all\"\n\
# (can't directly call this field namespace, due to C++ reserved keywords)\n\
string      cmd_namespace\n\
\n\
# Single string for command (found in controlCommands.hpp)\n\
#    and set of parameters for the command\n\
string      command\n\
string[]    args\n\
int64[]     args_ints\n\
float64[]   args_doubles\n\
geometry_msgs/Pose[] args_poses\n\
\n\
# Common Commands\n\
string CMD_EM_STOP      = command_EM_STOP\n\
string CMD_RESET        = command_reset\n\
string CMD_RESUME       = command_resume\n\
string CMD_START        = command_start\n\
string CMD_STOP         = command_stop\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::crosbot_msgs::ControlCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.cmd_namespace);
      stream.next(m.command);
      stream.next(m.args);
      stream.next(m.args_ints);
      stream.next(m.args_doubles);
      stream.next(m.args_poses);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ControlCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::crosbot_msgs::ControlCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::crosbot_msgs::ControlCommand_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "cmd_namespace: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.cmd_namespace);
    s << indent << "command: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.command);
    s << indent << "args[]" << std::endl;
    for (size_t i = 0; i < v.args.size(); ++i)
    {
      s << indent << "  args[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.args[i]);
    }
    s << indent << "args_ints[]" << std::endl;
    for (size_t i = 0; i < v.args_ints.size(); ++i)
    {
      s << indent << "  args_ints[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.args_ints[i]);
    }
    s << indent << "args_doubles[]" << std::endl;
    for (size_t i = 0; i < v.args_doubles.size(); ++i)
    {
      s << indent << "  args_doubles[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.args_doubles[i]);
    }
    s << indent << "args_poses[]" << std::endl;
    for (size_t i = 0; i < v.args_poses.size(); ++i)
    {
      s << indent << "  args_poses[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "    ", v.args_poses[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CROSBOT_MSGS_MESSAGE_CONTROLCOMMAND_H
