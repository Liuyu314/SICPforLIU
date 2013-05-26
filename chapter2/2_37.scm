(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define m1 (list (list 1 2 3 4) 
                  (list 4 5 6 6)
                  (list 6 7 8 9)))

(define m2 (list (list 2 2 2) 
                  (list 3 3 3)
                  (list 4 4 4)))

(define v1 (list 1 2 3 4))

(define (accumulate-n op init segs)
  (if (null? (car segs))
      '()
      (cons (accumulate op 
                        init
                        segs)
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x)) segs)))))
(define (dot-product v w)
  (accumulate +
              0 
              (map * v w)))
;;for testing
;;(dot-product v1 v1)

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v))
       m))
;;for testing
;;(matrix-*-vector m1 v1)

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons (car x) y))
                '()
                mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m)
           (accumulate (lambda (x y) (cons (dot-product x m)
                                           y))
                       '()
                       cols))
         m)))
;;for testing
;;(matrix-*-matrix m2 m1)
