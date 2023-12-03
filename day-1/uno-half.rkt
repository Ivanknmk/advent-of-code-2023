#lang racket

(require rackunit)
(require racket/port)

(define (find-calibration-value-in text-line)
  (let* ([list-of-chars   (string->list text-line)]
         [numbers-in-list (filter char-numeric? list-of-chars)]
         [first-and-last  (match numbers-in-list
                            [(list ) (list 0)]
                            [(list a) (list a a)]
                            [(list a ... b) (list (first a) b)])]
         [as-string       (list->string first-and-last)])
    (string->number as-string)))

(define (sum-calibration-values lines-as-list)
  (let* ([values (map find-calibration-value-in lines-as-list)])
    (foldl + 0 values)))

(define (sum-calibration-values-from-file path)
  (let* ([input         (open-input-file path)]
         [lines-as-list (port->lines input)])
    (sum-calibration-values lines-as-list)))


(check-equal? (find-calibration-value-in "qzjggk1one") 11)
(check-equal? (find-calibration-value-in "llrfcqczjldmlvvrxeightnvjgkqblgj7six") 77)
(check-equal? (find-calibration-value-in "vszthreetwo6threethree4two3") 63)

(check-equal? (sum-calibration-values (list "1abc2" "pqr3stu8vwx" "a1b2c3d4e5f" "treb7uchet")) 142)

(sum-calibration-values-from-file "./input")
