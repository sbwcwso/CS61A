; Lab 14: Final Review

(define (compose-all funcs)
  (if (null? funcs)
      (lambda (x) x)
      (lambda (x) ((compose-all (cdr funcs)) ((car funcs) x)))
      )
)
