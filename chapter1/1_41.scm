(define (double f)
  (lambda (x)
	(f (f x))))

(define inc
  (lambda (x) (+ x 1)))
