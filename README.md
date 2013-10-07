teaching data structure & algorithm with Common Lisp
===

how to run the code
---

If you already have Common Lisp set up (e.g., I use [SBCL][]), use the package like any [ASDF][]-defined system. [Quicklisp][] is recommended

Otherwise, an easy route to run these examples is to use [my Common Lisp setup helper for SBCL][dev-env cl helper] on a *vanilla* Linux machine with *sbcl*, *git*, *emacs*, *perl*, *curl* installed.

```bash
curl -L https://raw.github.com/pw4ever/dev-env/master/00helpers/setup-common-lisp.sh | sh
```

**NOTE: existing SBCL and Emacs configurations will be overwritten by the script. Read and adapt it before proceeding.**

This script will set up Emacs/[SLIME][] with Quicklisp that can load all project under `$HOME/hacking/common-lisp/` and its subdirectories (using ASDF's source registry facility `$HOME/.config/common-lisp/source-registry.conf.d/`).

Now, run the following Shell code:

```bash
cd $HOME/hacking/common-lisp/
git clone https://github.com/pw4ever/pw-teaching-algo-n-struct
```

Now you are all set.

To test the code, start emacs and enter `M-x slime` to enter SLIME REPL. 

An example session inside SLIME.

```lisp
; SLIME 2013-06-26
CL-USER> (ql:quickload :pw-teaching-algo-n-struct)
To load "pw-teaching-algo-n-struct":
  Load 1 ASDF system:
    pw-teaching-algo-n-struct
; Loading "pw-teaching-algo-n-struct"
..................................................
[package pw-teaching-algo-n-struct]...............
[package pw-teaching-algo-n-struct.tree].
(:PW-TEACHING-ALGO-N-STRUCT)
CL-USER> (in-package :pw-t-as.tree)
#<PACKAGE "PW-TEACHING-ALGO-N-STRUCT.TREE">
TREE> (make-red-black-tree :test)
#<RED-BLACK-TREE {1006CF6D23}>
TREE> (list-trees)
(:RBT-TEST)
TREE> (insert-items-into-tree :rbt-test 5 3 2 4 9 8 7)

#<RBT
*B > 
#<RBT
5B *B
   *B 
> 
#<RBT
5B 3R *B
      *B
   *B 
> 
#<RBT
3B 2R *B
      *B
   5R *B
      *B 
> 
#<RBT
3B 2B *B
      *B
   5B 4R *B
         *B
      *B 
> 
#<RBT
3B 2B *B
      *B
   5B 4R *B
         *B
      9R *B
         *B 
> 
#<RBT
3B 2B *B
      *B
   5R 4B *B
         *B
      9B 8R *B
            *B
         *B 
> 
#<RBT
3B 2B *B
      *B
   5R 4B *B
         *B
      8B 7R *B
            *B
         9R *B
            *B 
> 
NIL
TREE>
```

Tip: SLIME's documentation functions (with key map starting with `C-c C-d`) are extremely helpful in exploring new packages.

[sbcl]: http://www.sbcl.org "Steel Bank Common Lisp"
[asdf]: http://common-lisp.net/project/asdf/ "Another System Definition Facility"
[quicklisp]: http://www.quicklisp.org/beta/ "Quicklisp"
[dev-env cl helper]: https://github.com/pw4ever/dev-env/tree/master/00helpers
[slime]: http://common-lisp.net/project/slime/ "Superior Lisp Interaction Mode for Emacs"
