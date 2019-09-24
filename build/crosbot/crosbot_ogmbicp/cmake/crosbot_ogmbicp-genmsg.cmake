# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "crosbot_ogmbicp: 0 messages, 1 services")

set(MSG_I_FLAGS "-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Icrosbot_map:/home/azeng/turtle_ws/src/crosbot/crosbot_map/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/geometry;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/controls;-Icrosbot_msgs:/home/azeng/turtle_ws/src/crosbot/crosbot_msgs/msg/data")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(crosbot_ogmbicp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" NAME_WE)
add_custom_target(_crosbot_ogmbicp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crosbot_ogmbicp" "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" "sensor_msgs/PointField:std_msgs/Header:sensor_msgs/PointCloud2"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(crosbot_ogmbicp
  "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_ogmbicp
)

### Generating Module File
_generate_module_cpp(crosbot_ogmbicp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_ogmbicp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(crosbot_ogmbicp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(crosbot_ogmbicp_generate_messages crosbot_ogmbicp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" NAME_WE)
add_dependencies(crosbot_ogmbicp_generate_messages_cpp _crosbot_ogmbicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_ogmbicp_gencpp)
add_dependencies(crosbot_ogmbicp_gencpp crosbot_ogmbicp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_ogmbicp_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(crosbot_ogmbicp
  "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_ogmbicp
)

### Generating Module File
_generate_module_eus(crosbot_ogmbicp
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_ogmbicp
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(crosbot_ogmbicp_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(crosbot_ogmbicp_generate_messages crosbot_ogmbicp_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" NAME_WE)
add_dependencies(crosbot_ogmbicp_generate_messages_eus _crosbot_ogmbicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_ogmbicp_geneus)
add_dependencies(crosbot_ogmbicp_geneus crosbot_ogmbicp_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_ogmbicp_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(crosbot_ogmbicp
  "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_ogmbicp
)

### Generating Module File
_generate_module_lisp(crosbot_ogmbicp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_ogmbicp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(crosbot_ogmbicp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(crosbot_ogmbicp_generate_messages crosbot_ogmbicp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" NAME_WE)
add_dependencies(crosbot_ogmbicp_generate_messages_lisp _crosbot_ogmbicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_ogmbicp_genlisp)
add_dependencies(crosbot_ogmbicp_genlisp crosbot_ogmbicp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_ogmbicp_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(crosbot_ogmbicp
  "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_ogmbicp
)

### Generating Module File
_generate_module_nodejs(crosbot_ogmbicp
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_ogmbicp
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(crosbot_ogmbicp_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(crosbot_ogmbicp_generate_messages crosbot_ogmbicp_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" NAME_WE)
add_dependencies(crosbot_ogmbicp_generate_messages_nodejs _crosbot_ogmbicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_ogmbicp_gennodejs)
add_dependencies(crosbot_ogmbicp_gennodejs crosbot_ogmbicp_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_ogmbicp_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(crosbot_ogmbicp
  "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_ogmbicp
)

### Generating Module File
_generate_module_py(crosbot_ogmbicp
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_ogmbicp
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(crosbot_ogmbicp_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(crosbot_ogmbicp_generate_messages crosbot_ogmbicp_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/azeng/turtle_ws/src/crosbot/crosbot_ogmbicp/srv/GetRecentScans.srv" NAME_WE)
add_dependencies(crosbot_ogmbicp_generate_messages_py _crosbot_ogmbicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crosbot_ogmbicp_genpy)
add_dependencies(crosbot_ogmbicp_genpy crosbot_ogmbicp_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crosbot_ogmbicp_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_ogmbicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crosbot_ogmbicp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(crosbot_ogmbicp_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET crosbot_map_generate_messages_cpp)
  add_dependencies(crosbot_ogmbicp_generate_messages_cpp crosbot_map_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_ogmbicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crosbot_ogmbicp
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(crosbot_ogmbicp_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET crosbot_map_generate_messages_eus)
  add_dependencies(crosbot_ogmbicp_generate_messages_eus crosbot_map_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_ogmbicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crosbot_ogmbicp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(crosbot_ogmbicp_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET crosbot_map_generate_messages_lisp)
  add_dependencies(crosbot_ogmbicp_generate_messages_lisp crosbot_map_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_ogmbicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crosbot_ogmbicp
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(crosbot_ogmbicp_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET crosbot_map_generate_messages_nodejs)
  add_dependencies(crosbot_ogmbicp_generate_messages_nodejs crosbot_map_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_ogmbicp)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_ogmbicp\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crosbot_ogmbicp
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(crosbot_ogmbicp_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET crosbot_map_generate_messages_py)
  add_dependencies(crosbot_ogmbicp_generate_messages_py crosbot_map_generate_messages_py)
endif()
