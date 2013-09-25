(define (make-account balance secret-password)
  (define (withdraw amount)
	(if (>= balance amount)
	  (begin (set! balance (- balance amount))
			 balance)
	  "Insufficient funds"))
  (define (deposit amount)
	(set! balance (+ balance amount))
	balance)
   (define (display-wrong-password-message useless-arg)              
	         (display "Incorrect password"))                                
  (define (dispatch m1 m2)
	(if (eq? m1 secret-password)
	  (cond ((eq? m2 'withdraw) withdraw)
			((eq? m2 'deposit) deposit)
		  	(else (error "Unknown request -- MAKE-ACCOUNT"
					   m2)))
	  display-wrong-password-message))
  dispatch)

;;Thanks to http://sicp.readthedocs.org/en/latest/chp3/3.html about the display-wrong-password-message.
;;It is very thougthful:).

(define acc (make-account 100 'secret-password))
