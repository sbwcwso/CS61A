(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  (define (helper index s)
    (if (null? s) nil (cons (cons index (cons (car s) nil)) (helper (+ index 1) (cdr s)))))
  (helper 0 s)
)
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond
   ((null? list1) list2)
   ((null? list2) list1)
   ((comp (car list1) (car list2)) (cons (car list1) (merge comp (cdr list1) list2)))
   (else (cons (car list2) (merge comp list1 (cdr list2))))
   )
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
  (cond
   ((null? s) nil)
   ((null? (cdr s)) (cons (cons (car s) nil) nil))
   ((> (car s) (cadr s)) (cons (cons (car s) nil) (nondecreaselist (cdr s))))
   (else (define sublist (nondecreaselist (cdr s))) (cons (cons (car s) (car sublist)) (cdr sublist)))
   ) 
)
    ; END PROBLEM 17


