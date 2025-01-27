;Author: Bhumika Basnet
;CSCI 330
;01/26/2025

;; Define test lists
(defparameter *list1* '(a b x d))         ; Flat list
(defparameter *list2* '(a (b (x d))))     ; Nested list
(defparameter *list3* '(((a (b (x) d))))) ; Deeply nested list

;; Question 3: Access and print 'x' from each list
(print (caddr *list1*))  ; Get 3rd element from flat list *list1*
(print (car (car (cdr (car (cdr *list2*))))))  ; Get 'x' from *list2*
(print (car (car (cdr (car (cdr (car (car *list3*))))))))  ; Get 'x' from *list3*

;; Question 4: Recreate the lists using `cons`
(defparameter *list1-cons* (cons 'a (cons 'b (cons 'x (cons 'd nil)))))
(print *list1-cons*)  ; should print (a b x d)

(defparameter *list2-cons* (cons 'a (cons (cons 'b (cons (cons 'x (cons 'd nil)) nil)) nil)))
(print *list2-cons*)  ; should print (a (b (x d)))

(defparameter *list3-cons* (cons (cons (cons 'a (cons (cons 'b (cons (cons 'x nil) (cons 'd nil))) nil)) nil) nil))
(print *list3-cons*)  ; should print ((( a (b (x) d))))