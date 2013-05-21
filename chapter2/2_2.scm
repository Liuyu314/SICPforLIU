(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-setment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (mid-segment segment)
  (define mid-point 
	(make-point
	  (average (x-point (start-segment segment))
			   (x-point (end-segment segment)))
	  (average (y-point (start-segment segment))
			   (y-point (end-segment segment)))))
  mid-point)

(define (average x y)
  (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define A (make-point 2 1))
(define B (make-point 1 3))
(define AB (make-setment A B))
