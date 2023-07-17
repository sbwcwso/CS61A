; ;;;;;;;;;;;;;;
; ; Questions ;;
; ;;;;;;;;;;;;;;
; Scheme
(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (sign x)
  (cond 
    ((> x 0) 1)
    ((< x 0) -1)
    (else    0)
  )
)

(define (square x) (* x x))

(define (pow b n)
  (cond 
    ((= n 0)   1)
    ((even? n) (square (pow b (/ n 2))))
    (else      (* b (pow b (- n 1))))
  )
)

(define (unique s)
  (if (null? s)
      nil
      (cons (car s)
            (filter (lambda (item) (not (eq? item (car s))))
                    (unique (cdr s))
            )
      )
  )
)
