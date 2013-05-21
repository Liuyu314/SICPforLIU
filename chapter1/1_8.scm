(define (tri-iter guess x)
	(if (good-enough? guess x)
	    guess
	    (tri-iter (improve guess x)
		x)))


(define (improve guess x)
	(/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
	(< (abs (- (tripple guess) x)) 0.001))


(define (abs x) 
	(if (< x 0) (- x) x))

(define (tripple x) (* x x x))
(define (square x) (* x x))


(define (tri x) (tri-iter 1.0 x))
