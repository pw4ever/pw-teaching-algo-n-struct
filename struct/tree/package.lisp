(defpackage #:pw-teaching-algo-n-struct.tree
  (:nicknames #:pw-t-as.tree)
  (:use
   #:cl
   #:alexandria
   #:cl-containers
   )
  (:export
   #:make-binary-search-tree
   #:make-red-black-tree

   #:insert-items-into-tree
   #:delete-items-from-tree

   #:list-trees
   #:find-tree
   #:remove-tree
   #:remove-all-trees

   #:pprint-list-representation

   #:*verbose*
   ))

