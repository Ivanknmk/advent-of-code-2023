#lang racket

(require rackunit)

(define (zum uno dos)
  (+ uno dos))

(check-equal? (zum 1 2) 3)

(define (find-calibration-value-in text-line)
  (let* ([list-of-chars (string->list text-line)])
         [numbers-in-list (filter number? list-of-chars)]))
    
      