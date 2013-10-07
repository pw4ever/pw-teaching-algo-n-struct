(in-package :pw-t-as.tree)

(defmethod print-object ((node containers::red-black-node) stream)
  (labels ((list-representation (node)
	     (if node
		 (list (format nil "~A~A"
			       (if (containers:element node)
				   (containers:element node)
				   "*") 
			       (case (containers::rbt-color node) 
				 (0 :b) 
				 (1 :r)))
		       (list-representation (containers::left-child node))
		       (list-representation (containers::right-child node)))
		 nil)))
    (pprint-logical-block (stream nil
				  :prefix #. (format nil "#<RBT~%")
				  :suffix #. (format nil "~%>"))
      (pprint-list-representation (list-representation node)
				  stream))))

(defun make-red-black-tree (name &rest args)
  (let ((name (make-keyword (symbolicate :rbt- name))))
    (apply #'make-tree name 'containers:red-black-tree args)))
