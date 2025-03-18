;; Recursive Descent Parser for the given grammar

(defun parse-G (input)
  "Parses G -> x | y | z | w"
  (if (and input (member (car input) '(x y z w)))
      (values T (cdr input))
      (values NIL "Error: Expected x, y, z, or w")))

(defun parse-E' (input)
  "Parses E' -> oG E' | ε"
  (if (and input (eq (car input) 'o))
      (multiple-value-bind (success rest) (parse-G (cdr input))
        (if success (parse-E' rest) (values NIL "Error: Expected G after 'o'"))))
  (values T input))

(defun parse-E (input)
  "Parses E -> G E'"
  (multiple-value-bind (success rest) (parse-G input)
    (if success (parse-E' rest) (values NIL "Error: Expected G in E"))))

(defun parse-L (input)
  "Parses L -> s L' where L' -> L | ε"
  (if (and input (eq (car input) 's))
      (parse-L (cdr input))
      (values T input)))

(defun parse-S (input)
  "Parses S -> s | d L b"
  (cond
    ((and input (eq (car input) 's)) (values T (cdr input)))
    ((and input (eq (car input) 'd))
     (multiple-value-bind (success rest) (parse-L (cdr input))
       (if (and success rest (eq (car rest) 'b)) (values T (cdr rest))
           (values NIL "Error: Expected 'b' after L in S")))))
    (T (values NIL "Error: Expected 's' or 'd' in S"))))

(defun parse-I (input)
  "Parses I -> i E S"
  (if (and input (eq (car input) 'i))
      (multiple-value-bind (success rest) (parse-E (cdr input))
        (if success (parse-S rest) (values NIL "Error: Expected S after E"))))
  (values NIL "Error: Expected 'i' at start"))

(defun parse (input)
  "Entry function to parse a full input list"
  (multiple-value-bind (success rest) (parse-I input)
    (if (and success (null rest))
        (format t "Accepted: ~A~%" input)
        (format t "Rejected: ~A~% Error: ~A~%" input rest))))
