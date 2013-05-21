(define (cons a b)
  (* (expr 2 a) (expr 3 b)))

(define (expr base n)
  (if (= n 0)
	1
	(* base (expr base (- n 1)))))

(define (car z)
  (define (car-x x z)
	(if (= (remainder z 2) 0)
	  (car-x (+ x 1) (/ z 2))
	  x))
  (car-x 0 z))

(define (cdr z)
  (define (cdr-y y z)
	(if (= (remainder z 3) 0)
	  (cdr-y (+ y 1) (/ z 3))
	  y))
  (cdr-y 0 z))
