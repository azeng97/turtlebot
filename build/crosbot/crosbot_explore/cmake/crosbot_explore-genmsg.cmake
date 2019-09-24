# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "crosbot_explore: 1 messages, 2 services")

set(MSG_I_FLAGS "-Icrosbot_explore:/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(crosbot_explore_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" NAME_WE)
add_custom_target(_crosbot_explore_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_explore" "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" ""
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" NAME_WE)
add_custom_target(_crosbot_explore_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_explore" "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" "geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose:nav_msgs/Path"
)

get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" NAME_WE)
add_custom_target(_crosbot_explore_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_explore" "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" "geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose:nav_msgs/Path"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_explore
)

### Generating Services
_generate_srv_cpp(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_explore
)
_generate_srv_cpp(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_explore
)

### Generating Module File
_generate_module_cpp(crosbot_explore
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_explore
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(crosbot_explore_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(crosbot_explore_generate_messages crosbot_explore_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_cpp _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_cpp _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_cpp _crosbot_explore_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_explore_gencpp)
add_dependencies(crosbot_explore_gencpp crosbot_explore_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_explore_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_explore
)

### Generating Services
_generate_srv_eus(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_explore
)
_generate_srv_eus(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_explore
)

### Generating Module File
_generate_module_eus(crosbot_explore
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_explore
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(crosbot_explore_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(crosbot_explore_generate_messages crosbot_explore_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_eus _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_eus _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_eus _crosbot_explore_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_explore_geneus)
add_dependencies(crosbot_explore_geneus crosbot_explore_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_explore_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_explore
)

### Generating Services
_generate_srv_lisp(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_explore
)
_generate_srv_lisp(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_explore
)

### Generating Module File
_generate_module_lisp(crosbot_explore
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_explore
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(crosbot_explore_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(crosbot_explore_generate_messages crosbot_explore_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_lisp _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_lisp _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_lisp _crosbot_explore_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_explore_genlisp)
add_dependencies(crosbot_explore_genlisp crosbot_explore_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_explore_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_explore
)

### Generating Services
_generate_srv_nodejs(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_explore
)
_generate_srv_nodejs(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_explore
)

### Generating Module File
_generate_module_nodejs(crosbot_explore
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_explore
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(crosbot_explore_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(crosbot_explore_generate_messages crosbot_explore_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_nodejs _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_nodejs _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_nodejs _crosbot_explore_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_explore_gennodejs)
add_dependencies(crosbot_explore_gennodejs crosbot_explore_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_explore_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore
)

### Generating Services
_generate_srv_py(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore
)
_generate_srv_py(crosbot_explore
  "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore
)

### Generating Module File
_generate_module_py(crosbot_explore
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(crosbot_explore_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(crosbot_explore_generate_messages crosbot_explore_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/msg/ExplorerFeedback.msg" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_py _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/SetExplorerMode.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_py _crosbot_explore_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_explore/srv/GetPath.srv" NAME_WE)
add_dependencies(crosbot_explore_generate_messages_py _crosbot_explore_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_explore_genpy)
add_dependencies(crosbot_explore_genpy crosbot_explore_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_explore_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_explore)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_explore
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(crosbot_explore_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(crosbot_explore_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(crosbot_explore_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(crosbot_explore_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_explore)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_explore
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(crosbot_explore_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(crosbot_explore_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(crosbot_explore_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(crosbot_explore_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_explore)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_explore
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(crosbot_explore_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(crosbot_explore_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(crosbot_explore_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(crosbot_explore_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_explore)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_explore
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_explore_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_explore_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_explore_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_explore_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_explore
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(crosbot_explore_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(crosbot_explore_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(crosbot_explore_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(crosbot_explore_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
