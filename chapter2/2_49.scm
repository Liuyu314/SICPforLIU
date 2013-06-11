;;Here segments->painter has already defined in the book.
(define (frame-maker frame)
  (segments->painter frame))

;;We need to define four pointers which compose a square.
;;
;; C      E      D
;; *------*------*
;; |             |
;; |             |
;; |             |
;; *F            *G
;; |             |
;; |             |
;; |             |
;; *------*------*
;; A      H      B
;;
;;
(define A (make-vect 0.0 2.0))
(define B (make-vect 0.0 4.0))
(define C (make-vect 2.0 2.0))
(define D (make-vect 2.0 4.0))

(define AB (make-segment A B))
(define AC (make-segment A C))
(define CD (make-segment C D))
(define BD (make-segment B D))

(define AD (make-segment A D))
(define BC (make-segment B C))

(define (mid-point segment)
  (make-vect
	(/ (+ (car (start-segment segment))
	      (car (end-segment segment)))
	   2)
	(/ (+ (cdr (start-segment segment))
	      (cdr (end-segment segment)))
	   2)))

(define HG (make-segment
			 (mid-point AB)
			 (mid-point CD)))
(define HF (make-segment
			 (mid-point AB)
			 (mid-point AC)))
(define FE (make-segment
			 (mid-point AC)
			 (mid-point CD)))
(define GE (make-segment
			 (mid-point BD)
			 (mid-point CD)))
;;Wave 
;;Because it is too complicated, I just make wave-segment to be the
;;segment lists
(define frame-segment (list AB AC CD BD))
(define cross-segment (list AD BC))
(define diamond-segment (list HG HF FE GE))
;;for test
;;(frame-maker frame-segment)
;;(frame-maker cross-segment)
;;(frame-maker diamond-segment)
;;(frame-maker wave-segment)
