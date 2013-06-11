(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

;;They are the same as Test 2.2, but here the segment is not composed of point,
;;it is a vector

;;for test
(define A (make-vect 1.0 2.0))
(define B (make-vect 3.0 4.0))

;;(define AB (make-segment A B))
