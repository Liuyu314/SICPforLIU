(define (intersection-tree tree1 tree2)
  (list->tree
	(intersection-set (tree->list tree1)
			 		  (tree->list tree2))))


(define (union-tree tree1 tree2)
  (list->tree
	(union-set (tree->list-2 tree1)
			   (tree->list-2 tree2))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
	'()
	(let ((x1 (car set1)) (x2 (car set2)))
	  (cond ((= x1 x2)
			 (cons x1
				   (intersection-set (cdr set1) (cdr set2))))
			((< x1 x2)
			 (intersection-set (cdr set1) set2))
			((< x2 x1)
			  (intersection-set set1 (cdr set2)))))))

(define (union-set set another)
    (cond ((and (null? set) (null? another))
            '())
          ((null? set)
            another)
          ((null? another)
            set)
          (else
            (let ((x (car set)) (y (car another)))
                (cond ((= x y)
                        (cons x (union-set (cdr set) (cdr another))))
                      ((< x y)
                        (cons x (union-set (cdr set) another)))
                      ((> x y)
                        (cons y (union-set set (cdr another)))))))))

(define (tree->list-1 tree)
    (if (null? tree)
        '()
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                      (tree->list-1 (right-branch tree))))))

(define (make-tree entry left right)
    (list entry left right))

(define (entry tree)
    (car tree))

(define (left-branch tree)
    (cadr tree))

(define (right-branch tree)
    (caddr tree))
;;You may think this answer is simple, I have the same doubt like you;
;;I have asked this question on stackoverflow:
;;Here is the exercise 2.65 of SICP:

;;Use the results of exercises 2.63 and 2.64 to give жи(n) implementations of union-set and intersection-set for sets implemented as (balanced) binary trees.

;;In the chapter "Sets as ordered lists" and exercise 2.62, we already have the union-set and intersection-set for the ordered lists. I have searched the Internet, the answer of 2.65 is too simple to accept, they just convert the binary trees into lists and still use the the union-set and intersection-set for the ordered lists.

;;n my opinion, we need to convert the sets into binary trees and rewrite the union-set and intersection-set for the binary trees.

;;So, do I misunderstand the meanning of exercise 2.65 of SICP? Or is there a good answer?
;;
;;And the answer is just simple.
