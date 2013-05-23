(define (make-mobile left right)
  (list left right))
  ;(cons left right))

(define (make-branch length structure)
  (list length structure))
  ;(cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))
  ;(cdr mobile))

(define (total-weight mobile)
  (if (not (pair? (left-branch mobile)))
	(left-branch mobile)
	(+ (total-weight (left-branch mobile))
	   (total-weight (right-branch mobile)))))

(define (total-torque mobile)
  (if (not (pair? (left-branch mobile)))
	(* (left-branch mobile) (right-branch mobile))
	(+ (total-torque (left-branch mobile))
	   (total-torque (right-branch mobile)))))

(define (balance-mobile? mobile)
  (= (total-torque (left-branch mobile))
	 (total-torque (right-branch mobile))))

(define tree (make-mobile (make-branch 1 2) 
						  (make-mobile (make-branch 3 4) 
									   (make-branch 5 6))))
(define tree2 (make-mobile (make-branch 1 2)
						   (make-branch 3 4)))

(define tree3 (make-mobile (make-branch 4 4)
						   (make-mobile (make-branch 2 2)
										(make-branch 3 4))))
;;If we change the "make-branch" and "make-mobile" into
;;(define (make-mobile left right)
;;	(cons left right))
;;(define (make-branch length structure)
;;	(cons length structure))
;;
;;The "right-branch" should be changed into
;;(define (right-branch mobile)
;;	(cdr mobile))
