(asdf:defsystem #:pw-teaching-algo-n-struct
  :serial t
  :description "teaching algorithm and data structure"
  :author "Wei Peng <pengw@umail.iu.edu>"
  :license "MIT"
  :version "0.1"
  :depends-on (
	       #:alexandria
	       #:iterate
	       #:cl-ppcre

	       #:optima
	       #:optima.ppcre
	       #:named-readtables
	       #:fare-quasiquote-extras

	       #:cl-containers
	       )
  :components ((:file "package")
	       (:module structure
			:pathname "struct"
			:components 
			((
			  :module tree
			  :components (
				       (:file "package")
				       (:file "util")
				       (:file "binary-search-tree")
				       (:file "red-black-tree")
				       ))
			 ))
	       ))
