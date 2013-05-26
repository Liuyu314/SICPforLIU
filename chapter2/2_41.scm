(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;;Generate a list like this: when n is equal to 4, the list
;;would be ((1 2) (1 3) (2 3))
;;I remove the (1 4) and (2 4), because it cannot make a list 
;;with 3 numbers whict are not bigger than 4 
(define (make-2-list n)
  (define (go-on? pair)
	(> (- n (cadr pair)) 0))
  (filter go-on?
		  (flatmap
			(lambda (i)
			  (map (lambda (j) (list i j))
				   (enumerate-interval (+ i 1) n)))
			(enumerate-interval 1 n))))

;;I use the 'make-2-list' to generate a list with 3 numbers
(define (make-3-list n)
  (flatmap
	  (lambda (pair)
		(map (lambda (k) (append pair (list k)))
			 (enumerate-interval (+ (cadr pair) 1) n)))
	  (make-2-list n)))

(define (make-s-sum s n)
  (define lst (make-3-list n))
  (define (sum-ok? lst)
	(= (+ (car lst) (cadr lst) (cadr (cdr lst))) s))
  (filter sum-ok?
		  lst))

;;********************************************************************
;;The following codes are from the web:
;;http://sicp.readthedocs.org/en/latest/chp2/41.html
;;I think the codes are better than mine.

(define (unique-pairs n)
    (flatmap (lambda (i)
                 (map (lambda (j) (list i j))
                      (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

;;We can use the 'unique-triples' to generate a list which includes
;;some lists with 3 numbers.
(define (unique-triples n)
    (flatmap (lambda (i)
                 (map (lambda (j)                   
                          (cons i j))
                      (unique-pairs (- i 1))))      
             (enumerate-interval 1 n)))  

;;********************************************************************

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
