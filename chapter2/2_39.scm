(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (op (car rest)
            (iter result (cdr rest)))))
  (iter initial sequence))

(define (reverse1 sequence)
  (fold-left (lambda (x y) (cons y x))
             '()
             sequence))

(define (reverse2 sequence)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              sequence))
