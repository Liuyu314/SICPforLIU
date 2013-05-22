(define (fringe x)
  (if (not (pair? x))
	x
	(if (pair? (car x))
	  (append (fringe (car x))
			  (fringe (cdr x)))
	  (cons (fringe (car x))
			(fringe (cdr x))))))

(define x (list (list 1 2) (list 3 4)))
