
(cl:in-package :asdf)

(defsystem "crosbot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ColourMsg" :depends-on ("_package_ColourMsg"))
    (:file "_package_ColourMsg" :depends-on ("_package"))
    (:file "ColouredPointMsg" :depends-on ("_package_ColouredPointMsg"))
    (:file "_package_ColouredPointMsg" :depends-on ("_package"))
    (:file "ControlCommand" :depends-on ("_package_ControlCommand"))
    (:file "_package_ControlCommand" :depends-on ("_package"))
    (:file "ControlStatus" :depends-on ("_package_ControlStatus"))
    (:file "_package_ControlStatus" :depends-on ("_package"))
    (:file "PointCloudMsg" :depends-on ("_package_PointCloudMsg"))
    (:file "_package_PointCloudMsg" :depends-on ("_package"))
    (:file "StringArray" :depends-on ("_package_StringArray"))
    (:file "_package_StringArray" :depends-on ("_package"))
  ))