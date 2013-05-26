(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))



;;Some interesting codes
;;If you input:
;;(fold-right2 / 1 (list 1 2 3))
;;the output would be 3/2
;;If you input:
;;(fold-right2 list '() (list 1 2 3))
;;the output would be '(((3 2) 1) ())

;;But if you input: (fold-right2 / 1 (list 1 2 3 4))
;;The output would be 2/3
;;If you input:(fold-right / 1 (list 1 2 3 4))
;;The output would be 8/3
;;The fold-right2 is wrong, because it works like this:
;;(/ (/ (/ 4 3) 2) 1)
(define (fold-right2 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (op (iter (car rest) (cdr rest)) result)))
  (iter initial sequence))
;;The fold-right3 may be wrong too, it works like this:
;;(/ 3 (/ 2 (/ 1 1)))
(define (fold-right3 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op (car rest) result)
              (cdr rest))))
  (iter initial sequence))

;;The correct code should work like this:
;;(/ 1 (/ 2 (/ 3 1)))
(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (op (car rest)
            (iter result (cdr rest)))))
  (iter initial sequence))

;;Based on the problem, the 'op' should ignore the sequence
;;of the list, such as '+' or '*'
