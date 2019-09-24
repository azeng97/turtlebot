;; Auto-generated. Do not edit!


(when (boundp 'crosbot_msgs::ColouredPointMsg)
  (if (not (find-package "CROSBOT_MSGS"))
    (make-package "CROSBOT_MSGS"))
  (shadow 'ColouredPointMsg (find-package "CROSBOT_MSGS")))
(unless (find-package "CROSBOT_MSGS::COLOUREDPOINTMSG")
  (make-package "CROSBOT_MSGS::COLOUREDPOINTMSG"))

(in-package "ROS")
;;//! \htmlinclude ColouredPointMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass crosbot_msgs::ColouredPointMsg
  :super ros::object
  :slots (_p _c ))

(defmethod crosbot_msgs::ColouredPointMsg
  (:init
   (&key
    ((:p __p) (instance geometry_msgs::Point :init))
    ((:c __c) (instance crosbot_msgs::ColourMsg :init))
    )
   (send-super :init)
   (setq _p __p)
   (setq _c __c)
   self)
  (:p
   (&rest __p)
   (if (keywordp (car __p))
       (send* _p __p)
     (progn
       (if __p (setq _p (car __p)))
       _p)))
  (:c
   (&rest __c)
   (if (keywordp (car __c))
       (send* _c __c)
     (progn
       (if __c (setq _c (car __c)))
       _c)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _p
    (send _p :serialization-length)
    ;; crosbot_msgs/ColourMsg _c
    (send _c :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _p
       (send _p :serialize s)
     ;; crosbot_msgs/ColourMsg _c
       (send _c :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _p
     (send _p :deserialize buf ptr-) (incf ptr- (send _p :serialization-length))
   ;; crosbot_msgs/ColourMsg _c
     (send _c :deserialize buf ptr-) (incf ptr- (send _c :serialization-length))
   ;;
   self)
  )

(setf (get crosbot_msgs::ColouredPointMsg :md5sum-) "d75f9aa7b2fc4712f55c6e6703f1c090")
(setf (get crosbot_msgs::ColouredPointMsg :datatype-) "crosbot_msgs/ColouredPointMsg")
(setf (get crosbot_msgs::ColouredPointMsg :definition-)
      "geometry_msgs/Point p
ColourMsg c
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: crosbot_msgs/ColourMsg
uint8 r
uint8 g
uint8 b
uint8 a
")



(provide :crosbot_msgs/ColouredPointMsg "d75f9aa7b2fc4712f55c6e6703f1c090")


