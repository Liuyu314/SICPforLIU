(define dx 0.00001)

(define (smooth f)
  (lambda (x)
	(/ (+ (f (- x dx))
	      (f x)
	   	  (f (+ x dx)))
	   3)))

(define (repeated f n)
  (lambda (x)
	(if (= n 1)
	  (f x)
	  ((compose f (repeated f (- n 1))) x))))

(define (compose f g)
  (lambda (x)
	(f (g x))))

(define (ntimes-smooth f n)
  (lambda (x)
	(if (= n 1)
	  ((smooth f) x)
	  ((smooth (ntimes-smooth f (- n 1))) x))))
