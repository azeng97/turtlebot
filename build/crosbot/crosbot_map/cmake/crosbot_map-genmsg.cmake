# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "crosbot_map: 1 messages, 4 services")

set(MSG_I_FLAGS "-Icrosbot_map:/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(crosbot_map_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" NAME_WE)
add_custom_target(_crosbot_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_map" "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" "crosbot_msgs/PointCloudMsg:std_msgs/Header:geometry_msgs/Quaternion:crosbot_map/SnapMsg:geometry_msgs/Point:crosbot_msgs/ColourMsg:sensor_msgs/Image:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" NAME_WE)
add_custom_target(_crosbot_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_map" "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" "crosbot_msgs/PointCloudMsg:std_msgs/Header:geometry_msgs/Quaternion:crosbot_map/SnapMsg:geometry_msgs/Point:crosbot_msgs/ColourMsg:sensor_msgs/Image:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" NAME_WE)
add_custom_target(_crosbot_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_map" "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" "std_msgs/UInt8:std_msgs/String:std_msgs/Int32"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" NAME_WE)
add_custom_target(_crosbot_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_map" "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" "crosbot_msgs/PointCloudMsg:std_msgs/Header:std_msgs/Int32:crosbot_map/SnapMsg:geometry_msgs/Point:crosbot_msgs/ColourMsg:sensor_msgs/Image:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/UInt8"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" NAME_WE)
add_custom_target(_crosbot_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_map" "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" "crosbot_msgs/PointCloudMsg:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:crosbot_msgs/ColourMsg:sensor_msgs/Image:geometry_msgs/Pose"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
)

### Generating Services
_generate_srv_cpp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
)
_generate_srv_cpp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
)
_generate_srv_cpp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
)
_generate_srv_cpp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
)

### Generating Module File
_generate_module_cpp(crosbot_map
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(crosbot_map_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(crosbot_map_generate_messages crosbot_map_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_cpp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_cpp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_cpp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_cpp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" NAME_WE)
add_dependencies(crosbot_map_generate_messages_cpp _crosbot_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_map_gencpp)
add_dependencies(crosbot_map_gencpp crosbot_map_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_map_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
)

### Generating Services
_generate_srv_eus(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
)
_generate_srv_eus(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
)
_generate_srv_eus(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
)
_generate_srv_eus(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
)

### Generating Module File
_generate_module_eus(crosbot_map
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(crosbot_map_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(crosbot_map_generate_messages crosbot_map_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_eus _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_eus _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_eus _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_eus _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" NAME_WE)
add_dependencies(crosbot_map_generate_messages_eus _crosbot_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_map_geneus)
add_dependencies(crosbot_map_geneus crosbot_map_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_map_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
)

### Generating Services
_generate_srv_lisp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
)
_generate_srv_lisp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
)
_generate_srv_lisp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
)
_generate_srv_lisp(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
)

### Generating Module File
_generate_module_lisp(crosbot_map
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(crosbot_map_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(crosbot_map_generate_messages crosbot_map_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_lisp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_lisp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_lisp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_lisp _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" NAME_WE)
add_dependencies(crosbot_map_generate_messages_lisp _crosbot_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_map_genlisp)
add_dependencies(crosbot_map_genlisp crosbot_map_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_map_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
)

### Generating Services
_generate_srv_nodejs(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
)
_generate_srv_nodejs(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
)
_generate_srv_nodejs(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
)
_generate_srv_nodejs(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
)

### Generating Module File
_generate_module_nodejs(crosbot_map
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(crosbot_map_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(crosbot_map_generate_messages crosbot_map_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_nodejs _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_nodejs _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_nodejs _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_nodejs _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" NAME_WE)
add_dependencies(crosbot_map_generate_messages_nodejs _crosbot_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_map_gennodejs)
add_dependencies(crosbot_map_gennodejs crosbot_map_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_map_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
)

### Generating Services
_generate_srv_py(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
)
_generate_srv_py(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
)
_generate_srv_py(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
)
_generate_srv_py(crosbot_map
  "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/UInt8.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
)

### Generating Module File
_generate_module_py(crosbot_map
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(crosbot_map_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(crosbot_map_generate_messages crosbot_map_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ListSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_py _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/LoadSnaps.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_py _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/ModifySnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_py _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/srv/GetSnap.srv" NAME_WE)
add_dependencies(crosbot_map_generate_messages_py _crosbot_map_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg/SnapMsg.msg" NAME_WE)
add_dependencies(crosbot_map_generate_messages_py _crosbot_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_map_genpy)
add_dependencies(crosbot_map_genpy crosbot_map_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_map_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_map
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(crosbot_map_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(crosbot_map_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(crosbot_map_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET crosbot_msgs_generate_messages_cpp)
  add_dependencies(crosbot_map_generate_messages_cpp crosbot_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_map
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(crosbot_map_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(crosbot_map_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(crosbot_map_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET crosbot_msgs_generate_messages_eus)
  add_dependencies(crosbot_map_generate_messages_eus crosbot_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_map
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(crosbot_map_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(crosbot_map_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(crosbot_map_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET crosbot_msgs_generate_messages_lisp)
  add_dependencies(crosbot_map_generate_messages_lisp crosbot_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_map
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_map_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_map_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_map_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET crosbot_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_map_generate_messages_nodejs crosbot_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_map
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(crosbot_map_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(crosbot_map_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(crosbot_map_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET crosbot_msgs_generate_messages_py)
  add_dependencies(crosbot_map_generate_messages_py crosbot_msgs_generate_messages_py)
endif()
