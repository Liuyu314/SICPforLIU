(define (fast-expt2 a b n)
  (cond ((= n 0) a)
		((even? n) (fast-expt2 a (square b) (/ n 2)))
		(else (fast-expt2 (* a b) b (- n 1)))))
