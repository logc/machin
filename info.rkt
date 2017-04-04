#lang info
(define collection "machin")
(define deps '("base"
               "math-lib"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc" "scribble-math"))
(define scribblings '(("scribblings/machin.scrbl" ())))
(define pkg-desc "A Machine Learning package")
(define version "0.0")
(define pkg-authors '(logc))
