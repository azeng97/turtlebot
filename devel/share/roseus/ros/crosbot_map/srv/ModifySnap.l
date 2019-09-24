;; Auto-generated. Do not edit!


(when (boundp 'crosbot_map::ModifySnap)
  (if (not (find-package "CROSBOT_MAP"))
    (make-package "CROSBOT_MAP"))
  (shadow 'ModifySnap (find-package "CROSBOT_MAP")))
(unless (find-package "CROSBOT_MAP::MODIFYSNAP")
  (make-package "CROSBOT_MAP::MODIFYSNAP"))
(unless (find-package "CROSBOT_MAP::MODIFYSNAPREQUEST")
  (make-package "CROSBOT_MAP::MODIFYSNAPREQUEST"))
(unless (find-package "CROSBOT_MAP::MODIFYSNAPRESPONSE")
  (make-package "CROSBOT_MAP::MODIFYSNAPRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass crosbot_map::ModifySnapRequest
  :super ros::object
  :slots (_id _type _status _description ))

(defmethod crosbot_map::ModifySnapRequest
  (:init
   (&key
    ((:id __id) (instance std_msgs::Int32 :init))
    ((:type __type) (instance std_msgs::UInt8 :init))
    ((:status __status) (instance std_msgs::UInt8 :init))
    ((:description __description) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _id __id)
   (setq _type __type)
   (setq _status __status)
   (setq _description __description)
   self)
  (:id
   (&rest __id)
   (if (keywordp (car __id))
       (send* _id __id)
     (progn
       (if __id (setq _id (car __id)))
       _id)))
  (:type
   (&rest __type)
   (if (keywordp (car __type))
       (send* _type __type)
     (progn
       (if __type (setq _type (car __type)))
       _type)))
  (:status
   (&rest __status)
   (if (keywordp (car __status))
       (send* _status __status)
     (progn
       (if __status (setq _status (car __status)))
       _status)))
  (:description
   (&rest __description)
   (if (keywordp (car __description))
       (send* _description __description)
     (progn
       (if __description (setq _description (car __description)))
       _description)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int32 _id
    (send _id :serialization-length)
    ;; std_msgs/UInt8 _type
    (send _type :serialization-length)
    ;; std_msgs/UInt8 _status
    (send _status :serialization-length)
    ;; std_msgs/String _description
    (send _description :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32 _id
       (send _id :serialize s)
     ;; std_msgs/UInt8 _type
       (send _type :serialize s)
     ;; std_msgs/UInt8 _status
       (send _status :serialize s)
     ;; std_msgs/String _description
       (send _description :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32 _id
     (send _id :deserialize buf ptr-) (incf ptr- (send _id :serialization-length))
   ;; std_msgs/UInt8 _type
     (send _type :deserialize buf ptr-) (incf ptr- (send _type :serialization-length))
   ;; std_msgs/UInt8 _status
     (send _status :deserialize buf ptr-) (incf ptr- (send _status :serialization-length))
   ;; std_msgs/String _description
     (send _description :deserialize buf ptr-) (incf ptr- (send _description :serialization-length))
   ;;
   self)
  )

(defclass crosbot_map::ModifySnapResponse
  :super ros::object
  :slots ())

(defmethod crosbot_map::ModifySnapResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass crosbot_map::ModifySnap
  :super ros::object
  :slots ())

(setf (get crosbot_map::ModifySnap :md5sum-) "c1c64c0c3bf7d1de1b6bf7e6bbdda46c")
(setf (get crosbot_map::ModifySnap :datatype-) "crosbot_map/ModifySnap")
(setf (get crosbot_map::ModifySnap :request) crosbot_map::ModifySnapRequest)
(setf (get crosbot_map::ModifySnap :response) crosbot_map::ModifySnapResponse)

(defmethod crosbot_map::ModifySnapRequest
  (:response () (instance crosbot_map::ModifySnapResponse :init)))

(setf (get crosbot_map::ModifySnapRequest :md5sum-) "c1c64c0c3bf7d1de1b6bf7e6bbdda46c")
(setf (get crosbot_map::ModifySnapRequest :datatype-) "crosbot_map/ModifySnapRequest")
(setf (get crosbot_map::ModifySnapRequest :definition-)
      "std_msgs/Int32  id
std_msgs/UInt8  type
std_msgs/UInt8  status
std_msgs/String description

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/UInt8
uint8 data

================================================================================
MSG: std_msgs/String
string data
---

")

(setf (get crosbot_map::ModifySnapResponse :md5sum-) "c1c64c0c3bf7d1de1b6bf7e6bbdda46c")
(setf (get crosbot_map::ModifySnapResponse :datatype-) "crosbot_map/ModifySnapResponse")
(setf (get crosbot_map::ModifySnapResponse :definition-)
      "std_msgs/Int32  id
std_msgs/UInt8  type
std_msgs/UInt8  status
std_msgs/String description

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/UInt8
uint8 data

================================================================================
MSG: std_msgs/String
string data
---

")



(provide :crosbot_map/ModifySnap "c1c64c0c3bf7d1de1b6bf7e6bbdda46c")


