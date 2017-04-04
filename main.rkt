#lang racket/base

(require "array-ops.rkt")


(module+ test
  (require rackunit
           math/array))

(define (linear-model-predict xs beta bias)
  (+ bias (for/sum ([x xs] [b beta]) (* b x))))

(define (linear-model-learn X ys)
  (define X-transposed (array-transpose X))
  (array-dot (array-dot (array-dot X-transposed X) X-transposed) ys))

(module+ test
  (check-eqv? (linear-model-predict (vector 1) (vector 1) 1) 2)
  (check-equal? (linear-model-learn (array #[#[1 0] #[0 1]]) (array #[1 1]))
                (mutable-array #[1 1])))

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  )
