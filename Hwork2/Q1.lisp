; Author: Bhumika Basnet
; Course: CSCI 330
; Date: 02/04/2025

; Q 3.1 : Evaluates to NIL because 3 is equal to the absolute value of -3
(print (NOT (EQUAL 3 (ABS -3))))

; Q 3.2 : Compute (8 + 12) / 2 using EVAL notation
(print (/ (+ 8 12) 2))

; Q 3.3 : Compute the sum of squares of 3 and 4
(print (+ (* 3 3) (* 4 4)))

; Q 3.7 : Define a function MILES-PER-GALLON to calculate fuel efficiency
(defun MILES-PER-GALLON (INITIAL-ODOMETER-READING FINAL-ODOMETER-READING GALLONS-CONSUMED)
  (/ (- FINAL-ODOMETER-READING INITIAL-ODOMETER-READING) GALLONS-CONSUMED)
)

; Testing MILES-PER-GALLON function
(print (MILES-PER-GALLON 1000 2000 50)) ; Expected output: 20 (miles per gallon)

; 3.10 : Fixing syntax issues in expressions
; (third (the quick brown fox)) - Incorrect because 'the quick brown fox' needs to be quoted
(third '(the quick brown fox))

; (list 2 and 2 is 4) - Incorrect since 'and' is unquoted and treated as a variable
(list 2 'and 2 'is 4)

; (+ 1 ’(length (list t t t t))) - Incorrect due to misplaced quote
(+ 1 (length '(t t t t)))

; (cons ’patrick (seymour marvin)) - Incorrect because 'seymour' and 'marvin' are unquoted
(cons 'patrick '(seymour marvin))

; (cons ’patrick (list seymour marvin)) - Incorrect because 'seymour' and 'marvin' need to be quoted
(cons 'patrick (list 'seymour 'marvin))

; 3.20 : Defining a function that swaps the first two elements of a list
(defun mystery (x)
    (list (second x) (first x)))

; Testing the mystery function
(print (mystery '(dancing bear))) ; Expected output: (BEAR DANCING)
;(print(mystery ’dancing ’bear))  ; Error: 'DANCING' is unbound
(print (mystery '(zowie)))  ; Expected output: (NIL ZOWIE)
;(print (mystery (list ’first ’second)) ) ; Error: 'FIRST' is unbound

; 3.21 : Define a function that constructs a sentence
(defun speak (x y) (list 'all x 'is y))
; Common mistakes in function definitions:
; (defun speak (x y) (list ’all ’x ’is ’y)) - Quoting 'x' and 'y' inside list is unnecessary
; (defun speak (x) (y) (list ’all x ’is y)) - Incorrect function syntax
; (defun speak ((x) (y)) (list all ’x is ’y)) - Incorrect parameter structure

; 3.25 : Evaluating different Lisp expressions
(print (list 'cons t nil)) ; Output: (CONS T NIL)
(print (eval (list 'cons t nil))) ; Output: (T)
;(print (eval (eval (list 'cons t nil)))) ; Error: T is undefined
(print (apply #'cons '(t nil))) ; Output: (T)
(print (eval nil)) ; Output: NIL
(print (list 'eval nil)) ; Output: (EVAL NIL)
(print (eval (list 'eval nil))) ; Output: NIL
