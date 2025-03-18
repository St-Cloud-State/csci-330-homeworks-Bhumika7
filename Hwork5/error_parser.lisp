(defun parse-I (input pos)
  "Q8: Parses I -> iES with error tracking"
  (if (and (not (null input)) (eq (car input) 'i))
      (let ((rest (cdr input)))
        (multiple-value-bind (success rest err) (parse-E rest (1+ pos))
          (if success
              (multiple-value-bind (success rest err) (parse-S rest (1+ pos))
                (if success
                    (values T rest)
                    (values NIL (format nil "Error at position ~A: ~A" pos err))))
              (values NIL (format nil "Error at position ~A: ~A" pos err)))))
      (values NIL (format nil "Error at position ~A: Expected 'i', found ~A" pos (car input)))))
  