(define (queens board-size)
  (define (queen-cols k)
	(if (= k 0)
	  (list empty-board)
	  (filter
		(lambda (position) (safe? k position))
		(flatmap
		  (lambda (rest-of-queens)
			(map (lambda (new-row)
				   (adjoin-position new-row k rest-of-queens))
				 (enumerate-interval 1 board-size)))
		  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
	'()
	(cons low (enumerate-interval (+ low 1) high))))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? k position)

  ;;cols-ok? is used to judge whether there is a column repeated. 
  (define (cols-ok? n position)
	(if (null? position)
	  #t
	  (if (= n (car position))
		#f
		(cols-ok? n (cdr position)))))

  ;;cross-ok? is uesd to judge whether there is a cross-line between two queens. 
  (define (cross-ok? n position cols)
	(if (null? position)
	  #t
	  (if (= (abs (- k cols)) (abs (- (car position) n)))
	  	#f
	  	(cross-ok? n (cdr position) (- cols 1)))))

  (if (cols-ok? (car position) (cdr position))
	(if (cross-ok? (car position) (cdr position) (- k 1))
	  #t
	  #f)
	#f))

(define (display-queens n)
  (define lst (queens n))
  (map (lambda (x)
		 (begin
		   (display x)
		   (newline)))
		 lst))
