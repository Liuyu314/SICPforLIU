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

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree) 
  (if (leaf? (left-branch tree))
      (if (eq? symbol (symbol-leaf (left-branch tree)))
          (list 0)
          (if (leaf? (right-branch tree))
              (if (eq? symbol (symbol-leaf (right-branch tree)))
                  (list 1)
                  (error "bad symbol -- ENCODE_SYMBOL" symbol))
              (if (memq symbol (caddr (right-branch tree)))
                  (cons 1 (encode-symbol symbol (right-branch tree)))
                  (error "bad symbol -- ENCODE_SYMBOL" symbol))))
      (if (memq symbol (caddr (left-branch tree)))
          (cons 0 (encode-symbol symbol (left-branch tree)))
          (cons 1 (encode-symbol symbol (right-branch tree))))))
   
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (cond ((null? set) '())
		((null? (cdr set)) (car set))
		(else
		  (successive-merge (adjoin-set (make-code-tree (car set) (cadr set)) (cddr set))))))

(define tree1 '((a 1) (b 2) (c 4) (d 8) (f 16)))
(define tree2 '((a 1) (b 2) (c 4) (d 8) (f 16) (e 32) (f 64) (g 128) (h 256) (i 512) (j 1024)))

;;>(generate-huffman-tree tree1)
;;>(((((leaf a 1) (leaf b 2) (a b) 3) (leaf c 4) (a b c) 7) (leaf d 8) (a b c d) 15) (leaf f 16) (a b c d f) 31)
;;
;;>(generate-huffman-tree tree2)
;;
;;>(((((((((((leaf a 1) (leaf b 2) (a b) 3) (leaf c 4) (a b c) 7) (leaf d 8) (a b c d) 15) (leaf f 16) (a b c d f) 31) (leaf e 32) (a b c d f e) 63) (leaf f 64) (a b c d f e f) 127) (leaf g 128) (a b c d f e f g) 255) (leaf h 256) (a b c d f e f g h) 511) (leaf i 512) (a b c d f e f g h i) 1023) (leaf j 1024) (a b c d f e f g h i j) 2047)
;;
;;The most frequent symbol need 1 bit. The least frequent symbol need n-1 bits.
