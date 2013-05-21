(define (accumulate combiner null-value term a next b)
  (if (> a b)
	null-value
	(accumulate combiner (combiner null-value a)
				term (next a) next b)))

(define (product a b)
  (accumulate (lambda (a b) (* a b))
			  1
			  (lambda (x) x)
			  a
			  (lambda (x) (+ 1 x))
			  b))
