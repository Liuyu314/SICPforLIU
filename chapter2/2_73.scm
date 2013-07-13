;;a
;;(operator exp)得到分母的符号，使用(get 'deriv (operator exp))从操作表（数据导向分派）中找到对加法求导的操作，
;;对(operands exp)和var使用该操作.由于number?和same-variable?是通用操作，没必要加入数据导向分派中。
;;
;;b
;;from http://sicp.readthedocs.org/en/latest/chp2/73.html
(define (install-sum-package)

    ;;; internal procedures 
    (define (addend s)
        (car s))

    (define (augend s)
        (cadr s))

    (define (make-sum x y)
        (cond ((=number? x 0)
                y)
              ((=number? y 0)
                x)
              ((and (number? x) (number? y))
                (+ x y))
              (else
                (attach-tag '+ x y))))

    ;;; interface to the rest of the system
    (put 'addend '+ addend)
    (put 'augend '+ augend)
    (put 'make-sum '+ make-sum)

    (put 'deriv '+
        (lambda (exp var)
            (make-sum (deriv (addend exp) var)
                      (deriv (augend exp) var))))

'done)

(define (make-sum x y)
    ((get 'make-sum '+) x y))

(define (addend sum)
    ((get 'addend '+) (contents sum)))

(define (augend sum)
    ((get 'augend '+) (contents sum)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (install-product-package)

    ;;; internal procedures
    (define (multiplier p)
        (car p))

    (define (multiplicand p)
        (cadr p))

    (define (make-product x y)
        (cond ((or (=number? x 0) (=number? y 0))
                0)
              ((=number? x 1)
                y)
              ((=number? y 1)
                x)
              ((and (number? x) (number? y))
                (* x y))
              (else
                (attach-tag '* x y))))

    ;;; interface to the rest of the system
    (put 'multiplier '* multiplier)
    (put 'multiplicand '* multiplicand)
    (put 'make-product '* make-product)

    (put 'deriv '*
        (lambda (exp var)
            (make-sum
                (make-product (multiplier exp)
                              (deriv (multiplicand exp) var))
                (make-product (deriv (multiplier exp) var)
                              (multiplicand exp)))))

'done)

(define (make-product x y)
    ((get 'make-product '*) x y))

(define (multiplier product)
    ((get 'multiplier '*) (contents product)))

(define (multiplicand product)
    ((get 'multiplicand '*) (contents product)))

;;c
(define (install-exponentiation-package)

  ;;; internal procedures
  (define (make-exponentiation b e)
	(cond ((=number? b 0) 0)
          ((=number? b 1) 1)
          ((=number? e 0) 1)
          (else
			(attach-tag '^ b e))))
  (define (exponentiation? x)
	(and (pair? x) (eq? (car x) '^)))

  (define (exponent exp)
	(caddr exp))

  (define (base exp)
	(cadr exp))

    ;;; interface to the rest of the system
    (put 'make-exponentiation '^ make-exponentiation)
    (put 'base '^ base)
    (put 'exponent '^ exponent)

    (put 'deriv '*
        (lambda (exp var)
		  (make-product (exponent exp) 
						(make-exponentiation e2 (- e1 1))
						(deriv (base exp) var))))
'done)

(define (make-exponentiation b e)
    ((get 'make-exponentiation '^) b e))

(define (base exp)
    ((get 'base '^) (contents exp)))

(define (exponent exp)
    ((get 'exponent '^) (contents exp)))

;;d
;;a中数据导向分派如下：
;;                    类型
;;
;;  操作    +        ×         ^         /           
;;       | --------------------------------
;; deriv | 求导加 |求导乘 |求导对数  |求导除 
;; 整数  | 整数加 |整数乘 |整数求对数|整数除
;; 。。。|。。。。
;;       |
;;       |
;;
;;d中数据导向分派如下：
;;                    类型
;;
;;  操作   deriv     整数 。。。            
;;       | --------------------------------
;;    +  | 求导加  |整数加   
;;    ×  | 求导乘  |整数乘
;;    ^  | 求导对数|整数求对数
;;    /  | 求导除  |整数求导
;;       |。。。。
;;
;;每次我们需要导入的是类型，如果a中添加整数操作，则在"install-sum-package"加入操作整数的代码并put，其他相同。
;;根据d的要求，我们不仅要把像install-sum-package中的(put 'addend '+ addend)改为(put '+ 'addend addend)等，还要将install-sum-package
;;和install-product-package等合为一个，表示一个类型。当你要加入整数操作时，再写一个类型加入加法乘法等。
