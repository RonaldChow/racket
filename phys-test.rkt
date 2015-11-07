#lang racket
(require math)

; Define the Langrangian of a free particle
; L(t,x,v) = (0.5 mv^2)
; Free particle --> Potential energy = 0
(define (L-free-particle mass velocity)
    (* mass (* velocity velocity)))
(L-free-particle 10 20)

; Trajectory of a particle in x,y,z dimension
(define (test-path t)
  (match (+ (* 4 t) 7)
      (+ (* 3 t) 5)
      (+ (* 2 t) 1)))

(test-path 10)

;Composition of function, L(test-path(t))
(L-free-particle 3 (test-path 10))

;Implementation of factorial
(define (recur1 n)
  (if (or (= n 1) (< n 1))
      1
      (* n (recur1 (- n 1)))))
(recur1 10)

      

