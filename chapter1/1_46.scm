(define (iterative-improve good-enough? improve)
  (lambda (guess)
	(if (good-enough? guess)
	  guess
	  ((iterative-improve good-enough? improve)
	   (improve guess)))))

(define (sqrt guess x)

  (define (improve guess)
	(average guess (/ x guess)))
  (define (good-enough? guess)
	(< (abs (- (square guess) x)) 0.001))

  ((iterative-improve good-enough? improve) guess))

(define (average x y)
  (/ (+ x y) 2))

;;(sqrt 1.0 9)

(define (fixed-point f guess)

  (define (try guess)
	(f guess))
  (define (close-enough? guess)
	(< (abs (- guess (try guess))) tolerance))

  ((iterative-improve close-enough? try) guess))

(define tolerance 0.00001)
