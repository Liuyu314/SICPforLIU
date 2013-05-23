(define (square-tree tree)
  (tree-map square tree))

(define (square-tree2 tree)
  (tree-map2 square tree))

(define (double-tree tree)
  (tree-map (lambda (tree) (* 2 tree))
			tree))


(define (tree-map func tree)
  (cond ((null? tree) tree)
		((not (pair? tree)) (func tree))
		(else (cons (tree-map func (car tree))
					(tree-map func (cdr tree))))))

(define (tree-map2 func tree)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
		   (tree-map2 func sub-tree)
		   (func sub-tree)))
	   tree))

(define t (list 1 (list 2 (list 3 4) 5) (list 6 7)))
