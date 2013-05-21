(define (tan-cf x k)
  (define (cal-f i)
	(if (> i k)
	  0
	  (if (= i 1)
		(/ x (- (- (* i 2) 1) (cal-f (+ i 1))))
		(/ (square x) (- (- (* i 2) 1) (cal-f (+ i 1)))))))
  (cal-f 1))
