(in-package :cl-user)
(defpackage lisp-sample-crumbs.web
  (:use :cl
        :caveman2
        :lisp-sample-crumbs.config
        :lisp-sample-crumbs.view
        :lisp-sample-crumbs.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :lisp-sample-crumbs.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/qwer" ()
  (render #P"pages/index.js" (list :a-list (list 1 2 3)
                                   :crumbs-path (config :crumbs))))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
