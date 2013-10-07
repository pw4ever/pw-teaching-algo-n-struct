(in-package :pw-t-as.tree)

(defvar *trees*
  (make-hash-table)
  "all the trees managed by the package")

(defparameter *verbose*
  t
  "being verbose is good for teaching")

(defun make-tree (name class &rest args)
  (setf (gethash name *trees*)
	(apply #'make-instance class args)))

(defun list-trees (&optional (class t))
  (iter:iter
    (iter:for (name tree) :in-hashtable *trees*)
    (when (typep tree class)
      (iter:collect name))))

(defun insert-items-into-tree (name &rest items)
  (let ((tree (find-tree name)))
    (when tree
      (when *verbose*
	(print (root tree)))
      (iter:iter
	(iter:for item :in items)
	(insert-new-item tree item)
	(when *verbose*
	  (print (root tree)))))))

(defun delete-items-from-tree (name &rest items)
  (let ((tree (find-tree name)))
    (when tree
      (when *verbose*
	(print (root tree)))
      (iter:iter
	(iter:for item :in items)
	(delete-item tree item)
	(when *verbose*
	  (print (root tree)))))))

(defun find-tree (name)
  (gethash name *trees*))

(defun remove-tree (name)
  (remhash name *trees*))

(defun remove-all-trees ()
  (clrhash *trees*))

(defun pprint-list-representation (list-representation &optional stream &rest args &key (tab-colinc 3) (dummy "*") &allow-other-keys)
  "list representation has the element as first, and the children as rest"
  (pprint-logical-block (stream nil)
    (when list-representation
      (let ((element (first list-representation)))
	(write element :stream stream :escape nil :readably nil)
	(pprint-tab :section-relative 1 tab-colinc stream)
	(pprint-logical-block (stream nil)
	  (iter:iter
	    (iter:for children :first (rest list-representation) 
			       :then (subseq children (1+ p)))
	    (iter:for p :first (position-if-not #'null children) 
			:then (position-if-not #'null children))
	    (iter:while p)
	    (iter:iter 
	      (iter:repeat p)
	      (princ dummy stream)
	      (pprint-newline :mandatory stream))
	    (unless (iter:first-time-p)
	      (pprint-newline :mandatory stream))
	    (apply #'pprint-list-representation (elt children p) stream args)))))))
