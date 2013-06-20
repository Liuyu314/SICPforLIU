(define (flip-horiz painter)
  (transform-painter painter
					 (make-vect 1.0 0.0)
					 (make-vect 0.0 0.0)
					 (make-vect 1.0 1.0)))

(define (flip-rotate180 painter)
  (transform-painter painter
					 (make-vect 1.0 0.0)
					 (make-vect 0.0 1.0)
					 (make-vect 1.0 0.0)))

(define (flip-horiz painter)
  (transform-painter painter
					 (make-vect 0.0 1.0)
					 (make-vect 0.0 0.0)
					 (make-vect 1.0 1.0)))

;;U may think the flip-horiz is much like filp-rotate90,
;;But the second make-vect is the x-axis, the third make-vect
;;is y-axis.
;;U need to focus on the right axis from the original position
;;to where it located after changing.
