(define (reverse lst)
  (cond ((null? lst) 
		 (display "null"))
		((null? (cdr lst))
		 (list (car lst)))
		(else
		  (append (reverse (cdr lst)) (list (car lst))))))

(define (reverse2 lst)
  (if (null? lst)
	lst
	(append (reverse2 (cdr lst))
			(list (car lst)))))
