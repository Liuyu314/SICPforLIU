;;a
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define tree-a (make-tree 7 
                          (make-tree 3 
                                     (make-tree 1 '() '())
                                     (make-tree 5 '() '()))
                          (make-tree 9 
                                     '()
                                     (make-tree 11 '() '()))))

(define tree-b (make-tree 3 
                          (make-tree 1 '() '())
                          (make-tree 7
                                     (make-tree 5 '() '())
                                     (make-tree 9
                                                '()
                                                (make-tree 11 '() '())))))

(define tree-c (make-tree 5
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     '())
                          (make-tree 9
                                     (make-tree 7 '() '())
                                     (make-tree 11 '() '()))))


;;We can see they are all the same output.
;;> (tree->list-1 tree-a)
;;'(1 3 5 7 9 11)
;;>  (tree->list-1 tree-b)
;;'(1 3 5 7 9 11)
;;> (tree->list-1 tree-c)
;;'(1 3 5 7 9 11)
;;> (tree->list-2 tree-a)
;;'(1 3 5 7 9 11)
;;> (tree->list-2 tree-b)
;;'(1 3 5 7 9 11)
;;> (tree->list-2 tree-c)
;;'(1 3 5 7 9 11)

;;b
;;The complexity of tree->list-1 is O(n2), but the tree->list-2 is O(n).
