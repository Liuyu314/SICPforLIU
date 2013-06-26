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
        ((exponentiation? exp)
         (make-exponentiation (exponent exp) 
                    (base exp)
                    (deriv (base exp) var)))
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

(define (make-exponentiation e1 e2 e3)
  (cond ((or (=number? e1 0) (=number? e3 0)) 0)
        ((=number? e1 1) e3)
        (else 
         (make-product e1 (list '^ e2 (list '- e1 1))))))

(define (exponentiation? x)
  (and (list? x) (eq? (car x) '^)))

(define (exponent exp)
  (caddr exp))

(define (base exp)
  (cadr exp))

 (define (=number? exp num)
   (and (number? exp) (= exp num)))

(define (sum? x)
  (and (list? x) (eq? (car x) '+)))

(define (addend s) 
  (if (null? (cdr s))
      0
      (cadr s)))

(define (augend s)
  (if (null? (cdr s))
      0
      (cons (car s) (cdr (cdr s)))))

(define (product? x)
  (and (list? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) 
  (if (null? (cdr (cdr p)))
      1
      (cons (car p) (cdr (cdr p)))))
