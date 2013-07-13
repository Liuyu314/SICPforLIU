;;a
(define (install-divison1-package)
  ;;attach a tag on every comments
  ;;(define get-record...)
  (put 'divison1 'get-record get-record-divison1))

((get 'divison1 'get-record) (comments record))

;;b
(define (install-divison1-package)
  ;;attach a tag on every comments
  ;;(define get-record...)
  ;;(define get-salary...)
  (put 'divison1 'get-record get-record-divison1)
  (put 'divison1 'get-salary get-salary-divison1))

((get 'divison1 'get-record) (comments record))
((get 'divison1 'get-salary) (comments record))
;;c
(define (find-employee-record name divisons)
  (let ((divison (map type-tag divisons)))
	(let ((proc (get 'find-name divison)))
	  (if proc
		(if (proc name divison)
		  divison
		  (display "not in the divison:" divison))
		(error "No method find-name in divison:" divison)))))

;;c
;;rewrite a new divison in (install-divisonx-package)
;;and add some method information like get-record, get-salary or find-name
