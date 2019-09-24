;; Auto-generated. Do not edit!


(when (boundp 'crosbot_msgs::ControlCommand)
  (if (not (find-package "CROSBOT_MSGS"))
    (make-package "CROSBOT_MSGS"))
  (shadow 'ControlCommand (find-package "CROSBOT_MSGS")))
(unless (find-package "CROSBOT_MSGS::CONTROLCOMMAND")
  (make-package "CROSBOT_MSGS::CONTROLCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ControlCommand.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*CMD_EM_STOP*" (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(shadow '*CMD_EM_STOP* (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(defconstant crosbot_msgs::ControlCommand::*CMD_EM_STOP* "command_EM_STOP")
(intern "*CMD_RESET*" (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(shadow '*CMD_RESET* (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(defconstant crosbot_msgs::ControlCommand::*CMD_RESET* "command_reset")
(intern "*CMD_RESUME*" (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(shadow '*CMD_RESUME* (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(defconstant crosbot_msgs::ControlCommand::*CMD_RESUME* "command_resume")
(intern "*CMD_START*" (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(shadow '*CMD_START* (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(defconstant crosbot_msgs::ControlCommand::*CMD_START* "command_start")
(intern "*CMD_STOP*" (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(shadow '*CMD_STOP* (find-package "CROSBOT_MSGS::CONTROLCOMMAND"))
(defconstant crosbot_msgs::ControlCommand::*CMD_STOP* "command_stop")
(defclass crosbot_msgs::ControlCommand
  :super ros::object
  :slots (_header _cmd_namespace _command _args _args_ints _args_doubles _args_poses ))

(defmethod crosbot_msgs::ControlCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cmd_namespace __cmd_namespace) "")
    ((:command __command) "")
    ((:args __args) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:args_ints __args_ints) (make-array 0 :initial-element 0 :element-type :integer))
    ((:args_doubles __args_doubles) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:args_poses __args_poses) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _cmd_namespace (string __cmd_namespace))
   (setq _command (string __command))
   (setq _args __args)
   (setq _args_ints __args_ints)
   (setq _args_doubles __args_doubles)
   (setq _args_poses __args_poses)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cmd_namespace
   (&optional __cmd_namespace)
   (if __cmd_namespace (setq _cmd_namespace __cmd_namespace)) _cmd_namespace)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:args
   (&optional __args)
   (if __args (setq _args __args)) _args)
  (:args_ints
   (&optional __args_ints)
   (if __args_ints (setq _args_ints __args_ints)) _args_ints)
  (:args_doubles
   (&optional __args_doubles)
   (if __args_doubles (setq _args_doubles __args_doubles)) _args_doubles)
  (:args_poses
   (&rest __args_poses)
   (if (keywordp (car __args_poses))
       (send* _args_poses __args_poses)
     (progn
       (if __args_poses (setq _args_poses (car __args_poses)))
       _args_poses)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _cmd_namespace
    4 (length _cmd_namespace)
    ;; string _command
    4 (length _command)
    ;; string[] _args
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _args)) 4
    ;; int64[] _args_ints
    (* 8    (length _args_ints)) 4
    ;; float64[] _args_doubles
    (* 8    (length _args_doubles)) 4
    ;; geometry_msgs/Pose[] _args_poses
    (apply #'+ (send-all _args_poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _cmd_namespace
       (write-long (length _cmd_namespace) s) (princ _cmd_namespace s)
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; string[] _args
     (write-long (length _args) s)
     (dolist (elem _args)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int64[] _args_ints
     (write-long (length _args_ints) s)
     (dotimes (i (length _args_ints))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _args_ints i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _args_ints i)) (= (length ((elt _args_ints i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _args_ints i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _args_ints i) . bv) 1) -1) s))
             ((and (class (elt _args_ints i)) (= (length ((elt _args_ints i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _args_ints i) . bv) 0) s)
              (write-long (if (>= (elt _args_ints i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _args_ints i) s)(write-long (if (>= (elt _args_ints i) 0) 0 #xffffffff) s)))
       )
     ;; float64[] _args_doubles
     (write-long (length _args_doubles) s)
     (dotimes (i (length _args_doubles))
       (sys::poke (elt _args_doubles i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Pose[] _args_poses
     (write-long (length _args_poses) s)
     (dolist (elem _args_poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _cmd_namespace
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd_namespace (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _args
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _args (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _args i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int64[] _args_ints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _args_ints (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _args_ints i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _args_ints i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; float64[] _args_doubles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _args_doubles (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _args_doubles i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; geometry_msgs/Pose[] _args_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _args_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _args_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get crosbot_msgs::ControlCommand :md5sum-) "be744f9916e492f48f3380f551cec1ce")
(setf (get crosbot_msgs::ControlCommand :datatype-) "crosbot_msgs/ControlCommand")
(setf (get crosbot_msgs::ControlCommand :definition-)
      "Header      header

# Command messages may target a particular namespace. Empty namespace targets \"all\"
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

")



(provide :crosbot_msgs/ControlCommand "be744f9916e492f48f3380f551cec1ce")


