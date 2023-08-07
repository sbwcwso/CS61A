(define (flatmap f x)
  (define (flatmap-helper x m)
    (if (null? x)
        m
        (flatmap-helper (cdr x) (cons (f (car x)) m))
        )
    )
  (define (reverse-iter s r)
    (if (null? s)
        r
        (reverse-iter (cdr s) (if (list? (car s))
                                  (append (car s) r)
                                  (cons (car s) r)))
        ))
  (reverse-iter (flatmap-helper x nil) nil)
)

(define (expand lst)
  (define (expand-helper item)
    (cond
     ((eq? item 'x) '(x r y f r))
     ((eq? item 'y) '(l f x l y))
     (else item)
     )
    )
  (flatmap expand-helper lst)
  )

(define (interpret instr dist)
  (if (null? instr) nil
      (begin
        (define first (car instr))
        (cond
         ((eq? first 'f) (forward dist))
         ((eq? first 'l) (left 90))
         ((eq? first 'r) (right 90))
         (else nil)
         )

        (interpret (cdr instr) dist)
        ))
  )

(define (apply-many n f x)
  (if (zero? n)
      x
      (apply-many (- n 1) f (f x))))

(define (dragon n d)
  ;; (apply-many n expand '(f x)))
  (interpret (apply-many n expand '(f x)) d))
