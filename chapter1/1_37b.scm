(define (cont-frac n d k)
  (define (cal product k)
	(if (= k 0)
	  product
	  (cal (/ n (+ d product)) (- k 1))))
  (/ 1 (cal 0 k)))
