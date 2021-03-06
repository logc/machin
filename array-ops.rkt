#lang racket/base

(require math/array
         racket/vector)

(provide (all-defined-out))

(define (array-transpose an-array)
  (array-axis-swap an-array 0 1))

(define (array-dot A B)
  (when (not (= (vector-ref (array-shape A) 1)
                (vector-ref (array-shape B) 0)))
    (error "Incompatible arrays for matrix multiplication!"))
  (define n (vector-ref (array-shape A) 0))
  (define m (vector-ref (array-shape A) 1))
  (define p (vector-ref (array-shape B) 0))
  (define (matrix-matrix-dot A B)
    (for*/array #:shape (vector n p)
     ([i (in-range n)] [j (in-range p)])
     (for/sum ([k (in-range m)])
       (* (array-ref A (vector i k)) (array-ref B (vector k j))))))
  (define (matrix-vector-dot A B)
    (for*/array #:shape (vector n)
     ([i (in-range n)] [j (in-range p)])
     (for/sum ([k (in-range m)])
       (* (array-ref A (vector i k)) (array-ref B (vector k))))))
  (define (is-matrix-like? an-array)
    (= (vector-length (array-shape an-array)) 2))
  (define (is-vector-like? an-array)
    (= (vector-length (array-shape an-array)) 1))
  (cond [(and (is-matrix-like? A) (is-matrix-like? B))
         (matrix-matrix-dot A B)]
        [(and (is-matrix-like? A) (is-vector-like? B))
         (matrix-vector-dot A B)]))
