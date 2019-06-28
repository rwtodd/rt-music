(asdf:defsystem "rt-music"
  :description "music theory and other ideas in common lisp"
  :author "Richard Todd <richard.wesley.todd@gmail.com>"
  :license "GPL V3"
;;  :depends-on ("")
  :components ((:file "package")
               (:file "tunings" :depends-on ("package"))))
