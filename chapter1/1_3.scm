(define (<= x y) (or (< x y) (= x y)))

;Value: <=

(<= 2 4)

;Value: #t

(define (sumoftwobigger x y z)
	(cond ((and (<= x y) (<= x z)) (+ y z))
	      ((and (<= y z) (<= y x)) (+ x z))
	      ((and (<= z x) (<= z y)) (+ x y))))

;Value: sumoftwobigger

(sumoftwobigger 1 2 3) 

;Value: 5

(sumoftwobigger 2 3 4)

;Value: 7

(sumoftwobigger 4 2 5)


