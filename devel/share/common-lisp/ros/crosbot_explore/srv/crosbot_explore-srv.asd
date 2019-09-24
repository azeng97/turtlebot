
(cl:in-package :asdf)

(defsystem "crosbot_explore-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :nav_msgs-msg
)
  :components ((:file "_package")
    (:file "GetPath" :depends-on ("_package_GetPath"))
    (:file "_package_GetPath" :depends-on ("_package"))
    (:file "SetExplorerMode" :depends-on ("_package_SetExplorerMode"))
    (:file "_package_SetExplorerMode" :depends-on ("_package"))
  ))