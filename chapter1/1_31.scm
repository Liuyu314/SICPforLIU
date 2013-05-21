(define (product term a next b)
  (if (> a b)
	1
	(* (term a)
	   (product term (next a) next b))))

(define (product2 end term a next b)
  (if (> a b)
	end
	(product2 (* end (term a)) term (next a) next b)))

(define (factorial n)
  (product2 1 identity 1 inc n))

(define (identity x) x)

(define (inc x) (+ x 1))

;n is the maximum number
(define (pi-cal n)
  (if (odd? n)
	 (* 4.0 2.0 n (/ (product square 4 add-two n) (product square 3 add-two n)))
	 (/ (* 4.0 2.0 (/ (product square 4 add-two n) (product square 3 add-two n))) 
		n)))

(define (square n)
  (* n n))

(define (add-two n)
  (+ 2 n))

