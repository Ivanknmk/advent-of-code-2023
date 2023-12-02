#lang racket

(require rackunit)

(define (zum uno dos)
  (+ uno dos))

(check-equal? (zum 1 2) 3)

(define (find-calibration-value-in text-line)
  (let* ([list-of-chars (string->list text-line)]
         [numbers-in-list (filter char-numeric? list-of-chars)]
         [first-and-last (match numbers-in-list
                           [(list ) (list 0)]
                           [(list a) (list a)]
                           [(list a ... b) (list (first a) b)])]
         [as-string (list->string first-and-last)])
    (string->number as-string)))


(check-equal? (find-calibration-value-in "qzjggk1one") 1)
(check-equal? (find-calibration-value-in "llrfcqczjldmlvvrxeightnvjgkqblgj7six") 7)
(check-equal? (find-calibration-value-in "vszthreetwo6threethree4two3") 63)
