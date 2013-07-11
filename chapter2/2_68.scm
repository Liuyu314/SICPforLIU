(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (make-code-tree left right)
  (list left 
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE_BRANCH" bit))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree 
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
(define sample-massage '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree) 
  (if (leaf? (left-branch tree))
      (if (eq? symbol (symbol-leaf (left-branch tree)))
          (list '0)
          (if (leaf? (right-branch tree))
              (if (eq? symbol (symbol-leaf (right-branch tree)))
                  (list '1)
                  (error "bad symbol -- ENCODE_SYMBOL" symbol))
              (if (memq symbol (caddr (right-branch tree)))
                  (cons 1 (encode-symbol symbol (right-branch tree)))
                  (error "bad symbol -- ENCODE_SYMBOL" symbol))))
      (if (memq symbol (caddr (left-branch tree)))
          (cons 0 (encode-symbol symbol (left-branch tree)))
          (encode-symbol symbol (right-branch tree)))))
   
(define message '(A D A B B C A))   
   
 
  

;;> (decode sample-massage sample-tree)
;;>'(A D A B B C A)
;;> (encode message sample-tree)
;;>(0 1 1 0 0 1 0 1 0 1 1 1 0)
