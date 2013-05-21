(define (square-list items)
  (define (iter things answer)
	(if (null? things)
	  answer
	  (iter (cdr things)
			(cons (square (car things))
				  answer))))
  (reverse (iter items '())))

(define a (list 1 2 3 4))

;; 情况1：answer是向左递增的。
;; 情况2：answer初始为空，不能放在表头。
