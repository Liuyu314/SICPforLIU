(define lst1 (list 1 2 (list 5 7) 9))
(define a (car (cdr (car (cdr (cdr lst1))))))

(define lst2 (list (list 7)))
(define b (car (car lst2)))

(define lst3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define c (car (cdr 
				 (car (cdr 
						(car (cdr 
							   (car (cdr 
									  (car (cdr 
											 (car (cdr lst3)))))))))))))
