;; Load the parser
(load "parser.lisp")

;; Define test cases
(defparameter valid-tests '((i x o y o w s) (i x s) (i x o y o w d s b s)))
(defparameter invalid-tests '((i o w s) (i x d s) (i d b s)))

;; Run valid tests
(format t "Valid test cases:~%")
(dolist (test valid-tests) 
  (parse test))

;; Run invalid tests
(format t "Invalid test cases:~%")
(dolist (test invalid-tests) 
  (parse test))

