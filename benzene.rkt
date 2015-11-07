#lang racket
(require 2htdp/image)
(define (benzene)
(overlay
 (circle 20 "outline" "Red")
(regular-polygon 40 6 "outline" "Red")))


(benzene)
(beside (benzene) (benzene))

(beside (rotate 90 (benzene)) (rotate 90 (benzene)))

(stick)


