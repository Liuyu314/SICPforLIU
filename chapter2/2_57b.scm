(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum 
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "Unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2) (+ a1 a2)))
        (else (list '+ a1 a2))))

(define (make-product m1 m2) 
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (=number? exp num)
   (and (number? exp) (= exp num)))

(define (sum? x)
  (and (list? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) 
  (cond ((list? (car (cdr (cdr s)))) (car (cdr (cdr s))))
        ((null? (cdr (cdr (cdr s)))) (car (cdr (cdr s))))
        (else (cdr (cdr s)))))

(define (product? x)
  (and (list? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p)
  (cond ((list? (car (cdr (cdr p)))) (car (cdr (cdr p))))
        ((null? (cdr (cdr (cdr p)))) (car (cdr (cdr p))))
        (else (cdr (cdr p)))))


;;Here is the bug.
;;> (deriv '(x + 2) 'x)
;;1
;;> (deriv '(x + 3 * (x + y + 2)) 'x)
;;4
;;> (deriv '(x + 3 * (x + y + x)) 'x)
;;7
;;> (deriv '(x + 3 * (x + y + 2) + x) 'x)
;;4
;;We can see that if a "+" after a "*", the output is wrong.
;;There is no problem about "+", such as "a + b * c", we can seperate the expression into "a" and "b * c".
;;But for the "*", for example "a * b + c", we should not seperate the expression into "a" and "b + c". We should handle "a * b" firstly, and then "(a * b) + c".
