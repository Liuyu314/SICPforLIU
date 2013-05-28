(define (spilt func1 func2 painter n)
  (if (= n 0)
	painter
	(let ((smaller (spilt func1 func2 painter (- n 1))))
	  (func1 painter (func2 smaller smaller)))))

;;We can also ues lambda
(define (split2 func1 func2)
  (lambda (painter n)
	(if (= n 0)
	  painter
	  (let ((smaller (spilt func1 func2) painter (- n 1)))
		(func1 painter (func2 smaller smaller))))))
