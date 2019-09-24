;; Auto-generated. Do not edit!


(when (boundp 'crosbot_msgs::ColourMsg)
  (if (not (find-package "CROSBOT_MSGS"))
    (make-package "CROSBOT_MSGS"))
  (shadow 'ColourMsg (find-package "CROSBOT_MSGS")))
(unless (find-package "CROSBOT_MSGS::COLOURMSG")
  (make-package "CROSBOT_MSGS::COLOURMSG"))

(in-package "ROS")
;;//! \htmlinclude ColourMsg.msg.html


(defclass crosbot_msgs::ColourMsg
  :super ros::object
  :slots (_r _g _b _a ))

(defmethod crosbot_msgs::ColourMsg
  (:init
   (&key
    ((:r __r) 0)
    ((:g __g) 0)
    ((:b __b) 0)
    ((:a __a) 0)
    )
   (send-super :init)
   (setq _r (round __r))
   (setq _g (round __g))
   (setq _b (round __b))
   (setq _a (round __a))
   self)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; uint8 _r
    1
    ;; uint8 _g
    1
    ;; uint8 _b
    1
    ;; uint8 _a
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _r
       (write-byte _r s)
     ;; uint8 _g
       (write-byte _g s)
     ;; uint8 _b
       (write-byte _b s)
     ;; uint8 _a
       (write-byte _a s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _r
     (setq _r (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _g
     (setq _g (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _b
     (setq _b (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _a
     (setq _a (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get crosbot_msgs::ColourMsg :md5sum-) "3a89b17adab5bedef0b554f03235d9b3")
(setf (get crosbot_msgs::ColourMsg :datatype-) "crosbot_msgs/ColourMsg")
(setf (get crosbot_msgs::ColourMsg :definition-)
      "uint8 r
uint8 g
uint8 b
uint8 a
")



(provide :crosbot_msgs/ColourMsg "3a89b17adab5bedef0b554f03235d9b3")


