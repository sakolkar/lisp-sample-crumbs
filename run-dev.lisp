(ql:quickload :lisp-sample-crumbs)
(ql:quickload :osicat)

(setf (osicat:environment-variable "APP_ENV") "development")

(in-package :lisp-sample-crumbs)
(handler-case
    (lisp-sample-crumbs:start :server :hunchentoot :port 4240 :acceptor-write-timeout 3 :acceptor-read-timeout 3)
  (error (c)
    (format *error-output* "~&An error occured: ~a~&" c)
    (uiop:quit 1)))
