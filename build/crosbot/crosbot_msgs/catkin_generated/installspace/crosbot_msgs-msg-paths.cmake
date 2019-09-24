# generated from genmsg/cmake/pkg-msg-paths.cmake.installspace.in

_prepend_path("${crosbot_msgs_DIR}/.." "msg/geometry;msg/controls;msg/data" crosbot_msgs_MSG_INCLUDE_DIRS UNIQUE)
set(crosbot_msgs_MSG_DEPENDENCIES std_msgs;geometry_msgs;sensor_msgs)
