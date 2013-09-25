(define (make-accumulator base)
  (lambda (add-number)
	(set! base (+ base add-number))
	base))

(define A (make-accumulator 5))
