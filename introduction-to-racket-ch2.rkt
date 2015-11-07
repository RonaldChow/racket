#lang racket
;Introduction to Racket by Tyr Chen
;Chapter 2 - Basic Syntax

;Section 2.1.1

;(define x 1)
;(define x (+ x 1))
;x
;variables are immutable in Racket

(let ([a 3]
      [b (list-ref '(1 2 3 4) 3)])
  (sqr (+ a b)))

  


