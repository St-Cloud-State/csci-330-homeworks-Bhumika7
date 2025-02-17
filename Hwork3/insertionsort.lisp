;; Function to insert an element into a sorted list.
(defun insert (x lst)
  "Inserts element x into the sorted list lst while maintaining order."
  (cond
    ;; If the list is empty, insert x as the only element.
    ((null lst) (list x))
    
    ;; If x is smaller than or equal to the first element, place x at the front.
    ((<= x (first lst)) (cons x lst))
    
    ;; Otherwise, keep the first element and insert x recursively into the rest.
    (t (cons (first lst) (insert x (rest lst))))))

;; Function to sort a list using the insertion sort algorithm.
(defun insertion-sort (lst)
  "Sorts a list lst using the insertion sort algorithm."
  (if (null lst)
      ;; Base case: If the list is empty, return an empty list.
      '()
      
      ;; Recursive case: Sort the rest of the list and insert the first element correctly.
      (insert (first lst) (insertion-sort (rest lst)))))

;; Testing the insertion sort function
(format t "~%Sorted List: ~a" (insertion-sort '(4 3 1 6 2 8 5 7))) ;; Expected: (1 2 3 4 5 6 7 8)
(format t "~%Sorted List: ~a" (insertion-sort '(9 4 6 2 7 5 3 8 1))) ;; Expected: (1 2 3 4 5 6 7 8 9)
(format t "~%Sorted List: ~a" (insertion-sort '(10 9 8 7 6 5 4 3 2 1))) ;; Expected: (1 2 3 4 5 6 7 8 9 10)
(format t "~%Sorted List: ~a" (insertion-sort '(1))) ;; Expected: (1)
(format t "~%Sorted List: ~a" (insertion-sort '())) ;; Expected: ()