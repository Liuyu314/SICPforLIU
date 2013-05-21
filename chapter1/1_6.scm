(define (new-if predicate then-clause else-clause)
  	(cond (predicate then-clause)
		  (else else-clause)))
(define (sqrt-iter guess x)
  	(new-if (good-enough? guess x)
			guess
			(sqrt-iter (improve guess x) 
					   x)))

;Value: sqrt-iter

(define (improve guess x)
	(average guess (/ x guess)))

;Value: improve

(define (average x y)
	(/ (+ x y) 2))

;Value: average

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

;Value: good-enough?

(define (abs x) 
	(if (< x 0) (- x) x))

;Value: abs

(define (square x) (* x x))

;Value: square

(define (sqrt x) (sqrt-iter 1.0 x))

;Value: sqrt

(sqrt 9)

;Value: 3.00009155413138

(sqrt (+ 100 37))

;Value: 11.704699917758145
