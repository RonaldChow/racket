#lang racket
(require 2htdp/image)
(circle 20 "outline" "red")
(circle 50 "solid" "blue")

; = comment
; make your own color in R,G,B,and transparency
(circle 40 "solid" (make-color 255 100 0 255))
(circle 40 "solid" (make-color 255 100 0 100))
(star 40 "solid" "red")
(overlay (circle 20 "outline" "red") (circle 10 "outline" "blue"))
(/ 50 2)
(/ 3 2)
;100 + 20 + 50
(+ 100 20 50)
; Get decimal point
(/ 3 2.0)
;Define a variable called chief-execute with value of Donald Tsang
(define chief-executive "Donald Tsang")
chief-executive
;Define an annoymous function which shows "Hello World"
(lambda () "Hello World!")
;Execute the above function with ()
((lambda () "Hello World!"))
;For the short form of Lambda, press Ctrl + \ or Cmd + \ on Mac
((λ () "Hello World!"))
;Define another annoymous function which takes the value of x as input
((λ (x) (* x 0.5)) 689)
;Name the above function as half(x)
(define half (λ (x) (* x 0.5)))
(half 689)
; Define a function called captain which overlaps 3 different circles
(define (captain)
  (overlay (star 30 "solid" "white")
           (circle 30 "solid" "blue")
           (circle 40 "solid" "red")
           (circle 45 "solid" "white")
           (circle 50 "solid" "red")))
(captain)
;For the (overlay(arg1) (arg2) (arg3)), arg1 is placed top and arg3 is placed bottom.
;arg2 is placed in the middle
; Create a shield function which changes with a parameter called size
(define (shield size)
  (overlay (star (* size 0.6) "solid" "white")
           (circle (* size 0.6) "solid" "blue")
           (circle (* size 0.8) "solid" "red")
           (circle (* size 0.9) "solid" "white")
           (circle size "solid" "red")))

(shield 400)
(shield 100)
; List
(list 10 20 30)
(list 689 167 169)
; Combine List with Shield
(list (shield 10) (shield 20) (shield 30))
; Map() can be used to replace for loops
(map shield (list 10 20 30))
;x=10,20,30 and then evalaute circle(x) and then finally map for Len(list) times
(map (λ (x) (circle x "outline" "red"))
     (list 10 20 30))

;Reduce = foldl in Racket and Lisp
(foldl - 0 (list 100 20 10))
; What the above function does is that it starts from 0, and then it does 100 - (20 - 10) = 90
;Create an empty image
empty-image
(foldl overlay empty-image (map (λ (x) (circle x "outline" "red" ))
                                               (list 10 20 30)))

; Boolean
(define ten 10)
(> ten 12)
(= ten 12)

; Put two shields side by side
(beside (shield 10) (shield 20))

;Recursion; as a replacement of while loops
(define (lot-of-shield size)
  (if (< size 20) ; define base case, condition to be fulfilled
      empty-image
      ;else
      (beside (shield size)
              (lot-of-shield (- size 20)))))
(lot-of-shield 100)

; Define a function which takes in two variables
(define (smooth-circle size depth)
  (if (or (< size 10) (= 255 depth))
      empty-image
      (overlay (smooth-circle (- size 1) (+ depth 5))
               (circle size "solid"
                      (make-color depth depth 255)))))



(smooth-circle 40 0)
(smooth-circle 100 0)
;Genealize the smooth-circle to a function which takes other shapes other than circles
;by replacing circle with fn
(define (smooth fn size depth)
  (if (or (< size 10) (= 255 depth))
      empty-image
      (overlay (smooth fn (- size 1) (+ depth 5))
               (circle size "solid"
                      (make-color depth depth 255)))))

(smooth circle 100 0)
(smooth star 40 0)
(smooth triangle 100 0)
; Regular polygon function whch takes radius, # of sides, solid/outline, color
(regular-polygon 100 10 "solid" "red")
;Combine regular-polygon function with the smooth function
(smooth (λ (size style color)
          (regular-polygon size 7 style color)) 100 0)
;Create a npolygon function
(define (npolygon n)
  (λ (size style color)
          (regular-polygon size n style color)))
;Create a polygon with 17 sides
((npolygon 17) 60 "solid" "blue")

(list circle star regular-polygon)

(map (λ (fn) (smooth fn 50 0)) (list circle star))

;currying
(curry smooth)
((((curry smooth) circle) 40) 0)



