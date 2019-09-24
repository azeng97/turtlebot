// Generated by gencpp from file crosbot_explore/SetExplorerModeRequest.msg
// DO NOT EDIT!


#ifndef CROSBOT_EXPLORE_MESSAGE_SETEXPLORERMODEREQUEST_H
#define CROSBOT_EXPLORE_MESSAGE_SETEXPLORERMODEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <nav_msgs/Path.h>

namespace crosbot_explore
{
template <class ContainerAllocator>
struct SetExplorerModeRequest_
{
  typedef SetExplorerModeRequest_<ContainerAllocator> Type;

  SetExplorerModeRequest_()
    : id(0)
    , mode(0)
    , path()
    , targetOrientation(false)  {
    }
  SetExplorerModeRequest_(const ContainerAllocator& _alloc)
    : id(0)
    , mode(0)
    , path(_alloc)
    , targetOrientation(false)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef int32_t _mode_type;
  _mode_type mode;

   typedef  ::nav_msgs::Path_<ContainerAllocator>  _path_type;
  _path_type path;

   typedef uint8_t _targetOrientation_type;
  _targetOrientation_type targetOrientation;





  typedef boost::shared_ptr< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetExplorerModeRequest_

typedef ::crosbot_explore::SetExplorerModeRequest_<std::allocator<void> > SetExplorerModeRequest;

typedef boost::shared_ptr< ::crosbot_explore::SetExplorerModeRequest > SetExplorerModeRequestPtr;
typedef boost::shared_ptr< ::crosbot_explore::SetExplorerModeRequest const> SetExplorerModeRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace crosbot_explore

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'crosbot_explore': ['/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "24c6f46acd4670f1a9b29ed04fb4218b";
  }

  static const char* value(const ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x24c6f46acd4670f1ULL;
  static const uint64_t static_value2 = 0xa9b29ed04fb4218bULL;
};

template<class ContainerAllocator>
struct DataType< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "crosbot_explore/SetExplorerModeRequest";
  }

  static const char* value(const ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
int32 id\n\
\n\
\n\
int32 mode\n\
\n\
\n\
\n\
\n\
\n\
\n\
nav_msgs/Path   path\n\
\n\
\n\
bool            targetOrientation\n\
\n\
\n\
================================================================================\n\
MSG: nav_msgs/Path\n\
#An array of poses that represents a Path for a robot to follow\n\
Header header\n\
geometry_msgs/PoseStamped[] poses\n\
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
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
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

  static const char* value(const ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.mode);
      stream.next(m.path);
      stream.next(m.targetOrientation);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetExplorerModeRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::crosbot_explore::SetExplorerModeRequest_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "mode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.mode);
    s << indent << "path: ";
    s << std::endl;
    Printer< ::nav_msgs::Path_<ContainerAllocator> >::stream(s, indent + "  ", v.path);
    s << indent << "targetOrientation: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.targetOrientation);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CROSBOT_EXPLORE_MESSAGE_SETEXPLORERMODEREQUEST_H
