;; Auto-generated. Do not edit!


(when (boundp 'crosbot_explore::ExplorerFeedback)
  (if (not (find-package "CROSBOT_EXPLORE"))
    (make-package "CROSBOT_EXPLORE"))
  (shadow 'ExplorerFeedback (find-package "CROSBOT_EXPLORE")))
(unless (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK")
  (make-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude ExplorerFeedback.msg.html


(intern "*STATUS_PAUSED*" (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(shadow '*STATUS_PAUSED* (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(defconstant crosbot_explore::ExplorerFeedback::*STATUS_PAUSED* 0)
(intern "*STATUS_RUNNING*" (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(shadow '*STATUS_RUNNING* (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(defconstant crosbot_explore::ExplorerFeedback::*STATUS_RUNNING* 1)
(intern "*STATUS_ARRIVED*" (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(shadow '*STATUS_ARRIVED* (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(defconstant crosbot_explore::ExplorerFeedback::*STATUS_ARRIVED* 2)
(intern "*STATUS_BLOCKED*" (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(shadow '*STATUS_BLOCKED* (find-package "CROSBOT_EXPLORE::EXPLORERFEEDBACK"))
(defconstant crosbot_explore::ExplorerFeedback::*STATUS_BLOCKED* 3)
(defclass crosbot_explore::ExplorerFeedback
  :super ros::object
  :slots (_id _status _operating _searchStrategy ))

(defmethod crosbot_explore::ExplorerFeedback
  (:init
   (&key
    ((:id __id) 0)
    ((:status __status) 0)
    ((:operating __operating) nil)
    ((:searchStrategy __searchStrategy) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _status (round __status))
   (setq _operating __operating)
   (setq _searchStrategy (round __searchStrategy))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:operating
   (&optional __operating)
   (if __operating (setq _operating __operating)) _operating)
  (:searchStrategy
   (&optional __searchStrategy)
   (if __searchStrategy (setq _searchStrategy __searchStrategy)) _searchStrategy)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _status
    4
    ;; bool _operating
    1
    ;; int32 _searchStrategy
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _status
       (write-long _status s)
     ;; bool _operating
       (if _operating (write-byte -1 s) (write-byte 0 s))
     ;; int32 _searchStrategy
       (write-long _searchStrategy s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _status
     (setq _status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _operating
     (setq _operating (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _searchStrategy
     (setq _searchStrategy (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get crosbot_explore::ExplorerFeedback :md5sum-) "14c37f9333fc84ff10be1492d008d4b0")
(setf (get crosbot_explore::ExplorerFeedback :datatype-) "crosbot_explore/ExplorerFeedback")
(setf (get crosbot_explore::ExplorerFeedback :definition-)
      "# Corresponding Action id
int32 id

# Status (as listed in crosbot_explore/explorer.hpp)
int32   STATUS_PAUSED   = 0
int32   STATUS_RUNNING  = 1
int32   STATUS_ARRIVED  = 2
int32   STATUS_BLOCKED  = 3
int32 status

# Keep updated on continuing state of exploration
# Search strategy uses mode numbers
bool   operating
int32  searchStrategy

")



(provide :crosbot_explore/ExplorerFeedback "14c37f9333fc84ff10be1492d008d4b0")


