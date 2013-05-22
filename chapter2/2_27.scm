(define (deep-reverse x)
  (if (not (pair? x))
	x
	(reverse (cons (deep-reverse (car x))
				   (deep-reverse (cdr x))))))

(define x (list (list 1 2) (list 3 4)))
(define y (list (list 1 2) 3 (list 4 5)))

;When I run (reverse y), the answer is (3 (5 4) (2 1))
;I think if the code is correct, the answer should be ((5 4) 3 (2 1))
;So this code is unfinished.
