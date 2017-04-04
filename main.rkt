#lang racket/base

(require racket/vector)

(module+ test
  (require rackunit))


(define (linear-model-predict xs beta bias)
  (+ bias (for/sum ([x xs] [b beta]) (* b x))))

(module+ test
  (check-eqv? (linear-model-predict (vector 1) (vector 1) 1) 2)
  )

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  )
