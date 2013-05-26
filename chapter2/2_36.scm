(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define lst (list (list 1 2 3) 
                  (list 4 5 6)
                  (list 7 8 9) 
                  (list 10 11 12)))

(define (accumulate-n op init segs)
  (if (null? (car segs))
      '()
      (cons (accumulate op 
                        init
                        segs)
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x)) segs)))))

(define add
  (lambda (x y) (+ (car x) y)))

;;for testing
;;(accumulate add 0 lst)
