(in-package :pw-t-as.tree)

(defmethod print-object ((node containers::bst-node) stream)
  (labels ((list-representation (node)
	     (if (and node (containers:element node))
		 (list (containers:element node)
		       (list-representation (containers::left-child node))
		       (list-representation (containers::right-child node)))
		 nil)))
    (pprint-logical-block (stream nil
				  :prefix #. (format nil "#<BST~%")
				  :suffix #. (format nil "~%>"))
      (pprint-list-representation (list-representation node)
				  stream))))


(defun make-binary-search-tree (name &rest args)
  (let ((name (make-keyword (symbolicate :bst- name))))
    (apply #'make-tree name 'containers:binary-search-tree args)))
