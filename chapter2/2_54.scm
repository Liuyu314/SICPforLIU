(define (equal? item1 item2)
  (if (and (list? item1) (list? item2))
	(cond ((and (null? item1) (null? item2)) #t)
		  ((or (null? item1) (null? item2)) #f)
		  ((and (eq? (car item1) (car item2)) 
				(equal? (cdr item1) (cdr item2))))
		  (else #f))
	(if (and (symbol? item1) (symbol? item2))
	  (eq? item1 item2)
	  #f)))
