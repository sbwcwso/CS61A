; ; Scheme ;;
(define (over-or-under a b)
  (cond 
    ((< a b) -1)
    ((= a b) 0)
    (else    1)
  )
)

; ;; Tests
(over-or-under 1 2)

; expect -1
(over-or-under 2 1)

; expect 1
(over-or-under 1 1)

; expect 0
(define (filter-lst fn lst)
  (if (null? lst)
      (list)
      (if (fn (car lst))
          (cons (car lst) (filter-lst fn (cdr lst)))
          (filter-lst fn (cdr lst))
      )
  )
)

; ;; Tests
(define (even? x) (= (modulo x 2) 0))

(filter-lst even? '(0 1 1 2 3 5 8))

; expect (0 2 8)
(define (make-adder n)
  (lambda (operand) (+ n operand))
)

; ;; Tests
(define adder (make-adder 5))

(adder 8)

; expect 13
; ; Extra questions
(define lst
        (cons (cons 1 nil)
              (cons 2 (cons (cons 3 (cons 4 nil)) (cons 5 nil)))
        )
)

(define (composed f g) (lambda (x) (f (g x))))

(define (remove item lst)
  (filter-lst (lambda (x) (not (eq? item x))) lst)
)

; ;; Tests
(remove 3 nil)

; expect ()
(remove 3 '(1 3 5))

; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))

; expect (3 1 4 4)
(define (no-repeats s)
  (if (null? s)
      (list)
      (cons (car s)
            (filter-lst (lambda (item) (not (= item (car s))))
                        (no-repeats (cdr s))
            )
      )
  )
)

(define (substitute s old new)
  (cond 
    ((null? s)
     nil
    )
    ((pair? (car s))
     (cons (substitute (car s) old new)
           (substitute (cdr s) old new)
     )
    )
    ((eq? (car s) old)
     (cons new (substitute (cdr s) old new))
    )
    (else
     (cons (car s) (substitute (cdr s) old new))
    )
  )
)

(define (sub-all s olds news)
  (if (null? olds)
      s
      (sub-all (substitute s (car olds) (car news))
               (cdr olds)
               (cdr news)
      )
  )
)
