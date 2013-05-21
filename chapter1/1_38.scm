(define (cont-frac n d k)
  (define (cal product k)
	(if (= k 0)
	  product
	  (cal (/ n (+ (term d k) product)) (- k 1))))
  (+ 2 (cal 0 k)))

(define (term d k)
  (if (= (remainder (- k 2) 3) 0)
	(- k (/ (- k 2) 3))
	1))

(define (cal-e k)
  (cont-frac 1.0 
			 (+ 2 (* 2 (- k 1))) k))
