(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (if (< (length set1) (length set2))
      (intersection set1 set2)
      (intersection set2 set1)))

(define (intersection set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (if (< (length set1) (length set2))
      (union set1 set2)
      (union set2 set1)))

(define (union set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else 
         (cons (car set1)
               (union-set (cdr set1) set2)))))  


(define a (list 1 2 3 4 4 4 5))
(define b (list 3 4 7 0 4 9))



;;> (intersection-set a b)
;;'(3 4 4)
;;> (union-set a b)
;;'(7 0 9 1 2 3 4 4 4 5)
;;
;;If length of a is bigger than b, we need to exchange a into b and b into a.
