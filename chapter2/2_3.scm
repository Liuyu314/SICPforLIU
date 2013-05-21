(define (rectangle1 segment1 segment2)
  (cons segment1 segment2))

(define (rectangle2 segment1 segment2)
  (cons segment1 segment2))

(define (length-segment segment)
  (sqrt (+ (square (- (x-point (start-segment segment))
					  (x-point (end-segment segment))))
		   (square (- (y-point (start-segment segment))
					  (y-point (end-segment segment)))))))

(define (trangle-segment segment1 segment2)
  (sqrt (- (square (length-segment segment1)) (square (length-segment segment2)))))

(define (area len1 len2)
  (* len1 len2))

(define (perimeter len1 len2)
  (* 2 (+ len1 len2)))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define A (make-point 1 4))

(define B (make-point 4 4))

(define C (make-point 1 2))

(define AB (make-segment A B))
(define AC (make-segment A C))
(define BC (make-segment B C))

(define rect1 (rectangle1 AB AC))
(define rect2 (rectangle2 AB BC))

(area (length-segment AB) (length-segment AC))
(perimeter (length-segment AB) (length-segment AC))
(area (length-segment AB) (trangle-segment AB BC))
(perimeter (length-segment AB) (trangle-segment AB BC))
