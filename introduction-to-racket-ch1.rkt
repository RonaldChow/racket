#lang racket
; Introduction to Racket by Tyr Chen
; http://racket.tchen.me/index.html
; Chapter 1

; Section 1.2 Print "Hello World!"
(displayln "Hello World!")

; Section 1.4 Initial Impression of Racket
(+ 1 1)

;General structure of syntax in Racket
; (function-name args1 ...)

(+ 2 4 6)

(* 2 (+ 3 4))

;compute 2^3
(expt 2 3)

;Quotient
(quotient 5 2)

;Remainder
(remainder 5 2)

(/ 4 6)

;Convert exact numbers to inexact numbers and exact-->inexact is a function
(exact->inexact 2/3)

;Complex number
(* 1+2i 3+4i)

(not #t)

(and -1 #f)

(and -1 2)
;All non-false data are true. So both values are true.

(or -1 #f)

(or #f #f)

(xor #f 10)

(xor 10 20)

(> 1 2)

(< -1 0)

(= 10 20)

(string-append "Hello" "," " World!")

(format "~a,~a!" "Hello" " World")

;no quotation mark in the output
(printf "~a,~a!" "Hello" " World!")

(number->string 42)

(string->number "42")

(string->number "hello world")

(string-length "hello world!")

(string? "Hello")

(number? "1")

(number? 1+2i)

(define PI 3.1415926)

(define hello "hello world")

(format "~a:~a" hello PI)

(define (circle-area r)
  (* pi (sqr r)))


(circle-area 10)

;Section 1.5 Dance with Racket

(require 2htdp/image)

(define flag (rectangle 100 61.8 "solid" "red"))
flag

(define big-star (star 15 "solid" "yellow"))
big-star

(overlay big-star flag)

(triangle 40 "solid" "tan")

(rhombus 40 60 "outline" "magenta")

(circle 20 "solid" "green")

(regular-polygon 50 3 "outline" "red")

(regular-polygon 40 4 "solid" "blue")

(regular-polygon 20 8 "solid" "red")

(ellipse 50 30 "solid" "purple")

(overlay (ellipse 10 10 "solid" "red")
         (ellipse 20 20 "solid" "black")
         (ellipse 30 30 "solid" "red")
         (ellipse 40 40 "solid" "black")
         (ellipse 50 50 "solid" "red")
         (ellipse 60 60 "solid" "black"))

(overlay/xy (rectangle 20 20 "solid" "red")
            10 10 (rectangle 20 20 "solid" "black"))

(radial-star 8 8 64 "solid" "darkslategray")

(define (my-star x)
  (radial-star x 8 64 "solid" "darkslategray"))

(my-star 20)

(place-image (my-star 30) 75 75 (empty-scene 150 150))

(require 2htdp/universe)
;-------------------------------------------------------------------------------
(animate (lambda (x)
                (place-image (my-star (+ x 2)) 75 75 (empty-scene 150 150))))

;--------------------------------------------------------------------------------
;The above is equivalent to the following
(define (my-image x)
  (place-image (my-star (+ x 2)) 75 75 (empty-scene 150 150)))
(animate my-image)
;animate() will initiate a clock which outputs a value into my-image() as input.

(define (my-star2 x)
  (radial-star (+ (remainder x 100) 2 ) 8 64 "solid" "darkslategray"))

(define (my-star3 x) (radial-star x 8 64 "solid" "blue"))
(define (ten? x) (equal? x 10))
(big-bang 100
         [to-draw my-star]
         [on-tick sub1]
         [stop-when ten?]
         [on-key (lambda (s ke) 100)])

  

 
