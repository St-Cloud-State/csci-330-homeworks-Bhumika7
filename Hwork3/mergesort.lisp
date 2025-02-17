;; Bottom-Up Mergesort Implementation in Lisp
;; This implementation follows an iterative approach instead of recursion.

;; Function to merge two sorted lists into a single sorted list.
(defun merge_list (list1 list2)
  "Merges two sorted lists into a single sorted list."
  (cond
    ;; If one list is empty, return the other.
    ((null list1) list2)
    ((null list2) list1)
    ;; Compare the first elements of both lists.
    ;; If the first element of list1 is smaller, add it to the merged list
    ((< (car list1) (car list2))
     (cons (car list1) (merge_list (cdr list1) list2)))
    ;; Otherwise, add the first element of list2 to the merged list.
    (t
     (cons (car list2) (merge_list list1 (cdr list2))))))

;; Function to merge adjacent lists in a pass and return a new list of merged lists.
(defun merge-pass (lists)
  "Merges adjacent lists in a single pass and returns a new list of merged lists."
  (cond
    ;; If there are no lists, return an empty list.
    ((null lists) '())
    ;; If there's only one list left, return it as is.
    ((null (cdr lists)) lists)
    ;; Merge the first two lists and continue merging the remaining lists.
    (t
     (cons (merge_list (car lists) (cadr lists))  ;; Merge first two lists.
           (merge-pass (cddr lists))))))  ;; Continue merging the rest.

;; Function to sort a list using the bottom-up merge sort algorithm.
(defun bottom-up-merge-sort (lst)
  "Sorts a list using the bottom-up merge sort algorithm."
  ;; Convert each element into a singleton list.
  (let ((lists (mapcar #'list lst)))  ;; Example: (1 2 3) → ((1) (2) (3))
    (loop
      ;; Merge adjacent lists in each pass.
      (setq lists (merge-pass lists))
      ;; If only one sorted list remains, return it.
      (if (= (length lists) 1)
          (return (first lists))))))

;; Testing the bottom-up merge sort function
(format t "~%Sorted List: ~a" (bottom-up-merge-sort '(4 3 1 6 2 8 5 7))) ;; Expected: (1 2 3 4 5 6 7 8)
(format t "~%Sorted List: ~a" (bottom-up-merge-sort '(9 4 6 2 7 5 3 8 1))) ;; Expected: (1 2 3 4 5 6 7 8 9)
(format t "~%Sorted List: ~a" (bottom-up-merge-sort '(10 9 8 7 6 5 4 3 2 1))) ;; Expected: (1 2 3 4 5 6 7 8 9 10)
(format t "~%Sorted List: ~a" (bottom-up-merge-sort '(1))) ;; Expected: (1)
(format t "~%Sorted List: ~a" (bottom-up-merge-sort '())) ;; Expected: ()
