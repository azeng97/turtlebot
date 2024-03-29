cmake_minimum_required(VERSION 2.8.3)
project(comp3431_starter)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
                    roscpp
                    message_runtime std_msgs sensor_msgs geometry_msgs
                    image_transport
                    crosbot_msgs
                    crosbot
                    ## Uncomment these if required
                    #cv_bridge
                    #crosbot_explore
                    )

## Uncomment if using OpenCV
## OpenCV
#find_package(OpenCV)

# QT4 required for RViz plugins
find_package(Qt4 REQUIRED)

#######################################
## Declare ROS messages and services ##
#######################################

## Generate messages in the 'msg' folder
#add_message_files(
#  FILES
#)

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
# )

## Generate added messages and services with any dependencies listed here
#generate_messages(
#  DEPENDENCIES
#)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
   INCLUDE_DIRS include
#   LIBRARIES
#   CATKIN_DEPENDS
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
##    including locations and requirements for Qt
include_directories(include
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)
INCLUDE(${QT_USE_FILE})
ADD_DEFINITIONS(${QT_DEFINITIONS})
ADD_DEFINITIONS(-DQT_NO_KEYWORDS)

## Add generated MOC Qt header files

## Starter library with all common code
add_library(comp3431_starter_library
    src/beacon.cpp
    src/controlReceive.cpp
    src/depth.cpp
    src/wallFollow.cpp
)

## GUI Specific Libraries

## Declaring all Nodes
add_executable(comp3431_starter_beacons
    src/nodes/beacon_node.cpp
)
add_executable(comp3431_starter_controls
    src/nodes/controls_node.cpp
)
add_executable(comp3431_starter_depth
    src/nodes/depth_node.cpp
)
add_executable(comp3431_starter_wallfollow
    src/nodes/wallFollow_node.cpp
)

## Specify libraries to link a library or executable target against
target_link_libraries(comp3431_starter_library
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
)
target_link_libraries(comp3431_starter_beacons
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
  comp3431_starter_library
)
target_link_libraries(comp3431_starter_depth
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
  comp3431_starter_library
)
target_link_libraries(comp3431_starter_wallfollow
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
  comp3431_starter_library
)
target_link_libraries(comp3431_starter_controls
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
  comp3431_starter_library
)


#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/groovy/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
#install(DIRECTORY include/${PROJECT_NAME}/
#  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#  FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp"
#  PATTERN ".svn" EXCLUDE
#)

## Mark launch files for installation
install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  FILES_MATCHING PATTERN "*.launch"
  PATTERN ".svn" EXCLUDE
)

## Mark other files for installation (e.g. launch and bag files, etc.)
install(FILES
  plugin_description.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

