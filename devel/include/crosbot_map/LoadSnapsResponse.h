// Generated by gencpp from file crosbot_map/LoadSnapsResponse.msg
// DO NOT EDIT!


#ifndef CROSBOT_MAP_MESSAGE_LOADSNAPSRESPONSE_H
#define CROSBOT_MAP_MESSAGE_LOADSNAPSRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace crosbot_map
{
template <class ContainerAllocator>
struct LoadSnapsResponse_
{
  typedef LoadSnapsResponse_<ContainerAllocator> Type;

  LoadSnapsResponse_()
    : success(false)  {
    }
  LoadSnapsResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> const> ConstPtr;

}; // struct LoadSnapsResponse_

typedef ::crosbot_map::LoadSnapsResponse_<std::allocator<void> > LoadSnapsResponse;

typedef boost::shared_ptr< ::crosbot_map::LoadSnapsResponse > LoadSnapsResponsePtr;
typedef boost::shared_ptr< ::crosbot_map::LoadSnapsResponse const> LoadSnapsResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace crosbot_map

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'crosbot_map': ['/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'crosbot_msgs': ['/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry', '/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls', '/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::crosbot_map::LoadSnapsResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "crosbot_map/LoadSnapsResponse";
  }

  static const char* value(const ::crosbot_map::LoadSnapsResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n\
";
  }

  static const char* value(const ::crosbot_map::LoadSnapsResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LoadSnapsResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::crosbot_map::LoadSnapsResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::crosbot_map::LoadSnapsResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CROSBOT_MAP_MESSAGE_LOADSNAPSRESPONSE_H