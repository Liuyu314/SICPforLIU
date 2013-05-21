;(define (f n)
;  (if (< n 3)
;	n
;	(+ (f (- n 1)) 
;			 (* 2 (f (- n 2))) 
;			 (* 3 (f (- n 3))))))

;(define (f1 n)
;  (f-iter 3 2 1 0 n))
;(define (f-iter counter a1 a2 a3 max-counter)
;  (if (< n counter)
;	a1
;	(f-iter (+ counter 1) (+ a1 (* 2 a2) (* 3 a3)) a1 a2 max-counter)))

;;; 11-iter.scm

(define (f n)
    (f-iter 2 1 0 0 n))

(define (f-iter a b c i n)
    (if (= i n)
        c
        (f-iter (+ a (* 2 b) (* 3 c))   ; new a
                a                       ; new b
                b                       ; new c
                (+ i 1)
                n)))
