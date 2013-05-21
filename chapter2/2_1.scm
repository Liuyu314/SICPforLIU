(define (make-rat n d)
  (if (or (and (< n 0) (> d 0)) 
		  (and (> n 0) (> d 0)))
	(cons n d)
	(cons (- n) (- d))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display (denom x)))

(define (numer x) (car x))
(define (demon x) (cdr x))
