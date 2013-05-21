(define (cont-frac n d k)
  (define (cal n d k)
	(if (= k 0)
	  0
	  (/ n (+ d (cal n d (lambda (k) (- k 1)))))))
  (/ 1 (cal n d k)))
