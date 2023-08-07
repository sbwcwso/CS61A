;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: A flower
;;;
;;; Description:
;;;   A flower

(define (repeat fn k)
  (if (= k 1) (fn)
      (begin (fn) (repeat fn (- k 1)))))


(define (draw_petal)
  (color "#800080")
  (begin_fill)
  (circle 365 50)
  (left 130)
  (circle 365 50)
  (end_fill)
  (left 160)
  )

(define (draw)
   (hideturtle)
   (repeat draw_petal 12)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
