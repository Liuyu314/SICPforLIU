(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;;unique is HERE
(define (unique n)
  (flatmap
	(lambda (i)
	  (map (lambda (j) (list j i))
		   (enumerate-interval (+ i 1) n)))
	(enumerate-interval 1 n)))

;;;;The example of the book
;(define (prime-sum-pairs n)
;  (map make-pair-sum
;	   (filter prime-sum?
;			   (flatmap
;				 (lambda (i)
;				   (map (lambda (j) (list i j))
;						(enumerate-interval 1 (- i 1))))
;				 (enumerate-interval 1 n)))))

;;The new prime-sum-pair
(define (prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum?
				 (unique n))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (enumerate-interval low high)
  (if (> low high)
	'()
	(cons low (enumerate-interval (+ low 1) high))))

;;*******The following codes is all about how to judge whether a number is prime*****
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))