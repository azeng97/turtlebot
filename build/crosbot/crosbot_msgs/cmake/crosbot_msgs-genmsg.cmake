# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "crosbot_msgs: 6 messages, 0 services")

set(MSG_I_FLAGS "-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(crosbot_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" NAME_WE)
add_custom_target(_crosbot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_msgs" "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" ""
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" NAME_WE)
add_custom_target(_crosbot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_msgs" "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" NAME_WE)
add_custom_target(_crosbot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_msgs" "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" NAME_WE)
add_custom_target(_crosbot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_msgs" "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" "crosbot_msgs/ColourMsg:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" NAME_WE)
add_custom_target(_crosbot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_msgs" "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" ""
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" NAME_WE)
add_custom_target(_crosbot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_msgs" "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" "geometry_msgs/Point:crosbot_msgs/ColourMsg"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_cpp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_cpp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_cpp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_cpp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_cpp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(crosbot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(crosbot_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(crosbot_msgs_generate_messages crosbot_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_cpp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_cpp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_cpp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_cpp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_cpp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_cpp _crosbot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_msgs_gencpp)
add_dependencies(crosbot_msgs_gencpp crosbot_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_eus(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_eus(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_eus(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_eus(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_eus(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(crosbot_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(crosbot_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(crosbot_msgs_generate_messages crosbot_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_eus _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_eus _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_eus _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_eus _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_eus _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_eus _crosbot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_msgs_geneus)
add_dependencies(crosbot_msgs_geneus crosbot_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_lisp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_lisp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_lisp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_lisp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_lisp(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(crosbot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(crosbot_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(crosbot_msgs_generate_messages crosbot_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_lisp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_lisp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_lisp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_lisp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_lisp _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_lisp _crosbot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_msgs_genlisp)
add_dependencies(crosbot_msgs_genlisp crosbot_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_nodejs(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_nodejs(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_nodejs(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_nodejs(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_nodejs(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(crosbot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(crosbot_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(crosbot_msgs_generate_messages crosbot_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_nodejs _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_nodejs _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_nodejs _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_nodejs _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_nodejs _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_nodejs _crosbot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_msgs_gennodejs)
add_dependencies(crosbot_msgs_gennodejs crosbot_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_py(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_py(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_py(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_py(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
)
_generate_msg_py(crosbot_msgs
  "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(crosbot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(crosbot_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(crosbot_msgs_generate_messages crosbot_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data/StringArray.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_py _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlStatus.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_py _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls/ControlCommand.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_py _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/PointCloudMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_py _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColourMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_py _crosbot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry/ColouredPointMsg.msg" NAME_WE)
add_dependencies(crosbot_msgs_generate_messages_py _crosbot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_msgs_genpy)
add_dependencies(crosbot_msgs_genpy crosbot_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(crosbot_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(crosbot_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(crosbot_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(crosbot_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(crosbot_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(crosbot_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(crosbot_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(crosbot_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(crosbot_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(crosbot_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(crosbot_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(crosbot_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
