(define (same-parity x . y)
  (define (parity lst)
	(if (null? (cdr lst))
	  lst
	  (if (odd? (- (car lst) (car (cdr lst))))
		(parity (cons (car lst) (cdr (cdr lst))))
		(cons (car lst) (parity (cdr lst))))))
  (parity (cons x y)))
