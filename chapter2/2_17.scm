(define (last-pair lst)
  (if (null? lst)
	(begin
	  ((newline))
	  ((display "empty list -- LAST-PAIR")))
	(if (null? (cdr lst))
	  lst
	  (last-pair (cdr lst)))))
