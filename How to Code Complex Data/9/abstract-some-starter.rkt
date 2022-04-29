;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname abstract-some-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; abstract-some-starter.rkt

;
; PROBLEM:
;
; Design an abstract function called some-pred? (including signature, purpose,
; and tests) to simplify the following two functions. When you are done
; rewrite the original functions to use your new some-pred? function.
;

(check-expect (some-pred? empty positive?) false)
(check-expect (some-pred? (list 2 -3 -4) positive?) true)
(check-expect (some-pred? (list -2 -3 -4) positive?) false)

(check-expect (some-pred? empty negative?) false)
(check-expect (some-pred? (list 2 3 -4) negative?) true)
(check-expect (some-pred? (list 2 3 4) negative?) false)



(define (some-pred? lon fn)
  (cond [(empty? lon) false]
        [else
         (or (fn (first lon))
             (some-pred? (rest lon) fn))]))


;; ListOfNumber -> Boolean
;; produce true if some number in lon is positive
(check-expect (some-positive? empty) false)
(check-expect (some-positive? (list 2 -3 -4)) true)
(check-expect (some-positive? (list -2 -3 -4)) false)

(define (some-positive? lon)
  (cond [(empty? lon) false]
        [else
         (or (positive? (first lon))
             (some-positive? (rest lon)))]))


;; ListOfNumber -> Boolean
;; produce true if some number in lon is negative
(check-expect (some-negative? empty) false)
(check-expect (some-negative? (list 2 3 -4)) true)
(check-expect (some-negative? (list 2 3 4)) false)

(define (some-negative? lon)
  (cond [(empty? lon) false]
        [else
         (or (negative? (first lon))
             (some-negative? (rest lon)))]))