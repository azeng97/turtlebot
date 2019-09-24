
(cl:in-package :asdf)

(defsystem "crosbot_explore-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ExplorerFeedback" :depends-on ("_package_ExplorerFeedback"))
    (:file "_package_ExplorerFeedback" :depends-on ("_package"))
  ))