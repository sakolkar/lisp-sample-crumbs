(defsystem "lisp-sample-crumbs-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Satyen Akolkar"
  :license ""
  :depends-on ("lisp-sample-crumbs"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "lisp-sample-crumbs"))))
  :description "Test system for lisp-sample-crumbs"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
