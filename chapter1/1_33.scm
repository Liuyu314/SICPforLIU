(define (filter-accumulate combiner null-value 
						   filter? term a next b)
  (if (> a b)
	null-value
	(if (filter? a)
	  (combiner (term a)
				(filter-accumulate combiner null-value
								   filter? term (next a) next b))
	  (filter-accumulate combiner null-value
						 filter? term (next a) next b))))

(define (sum-odd a b)
  (filter-accumulate (lambda (a b) (+ a b))
					 0
					 ;be-odd
					 (lambda (x) (= (remainder x 2) 1))
					 (lambda (x) x)
					 a
					 (lambda (x) (+ x 1))
					 b))

(define (be-odd x)
  (= (remainder x 2) 1))

