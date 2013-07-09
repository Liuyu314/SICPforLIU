(define (lookup-tree given-key tree-of-records)
  (cond ((null? set-of-records) #f)
		((equal? given-key (key (entry tree-of-records))
				 (entry tree-of-records)))
		((< given-key (key (entry tree-of-records)))
		 (lookup-tree given-key (left-branch tree-of-records)))
		((> given-key (key (entry tree-of-records)))
		 (lookup-tree given-key (right-branch tree-of-records)))))
				 

(define (entry tree)
    (car tree))

(define (left-branch tree)
    (cadr tree))

(define (right-branch tree)
    (caddr tree))
