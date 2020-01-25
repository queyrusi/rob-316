(define (domain hanoi)
(:requirements :strips)
(:predicates (clear ?x)
             (on ?x ?y)
             (pincing ?x)
             (disc ?x)
             (emptyPince)
             (peg ?x)
             (vide ?p)
             (smaller ?x ?y))

; (:action move
; :parameters (?disc ?from ?to)
; :precondition (and (smaller ?to ?disc) 
;                    (on ?disc ?from) 
;                    (clear ?disc) 
;                    (clear ?to))
; :effect  (and (clear ?from) 
;               (on ?disc ?to) 
;               (not (on ?disc ?from))  
;               (not (clear ?to)))
;  )
 
(:action enleverDuPeg
:parameters (?disc ?peg)
:precondition (and 
                   (smaller ?peg ?disc) 
                   (emptyPince) 
                   (disc ?disc) 
                   (peg ?peg) 
                   (on ?disc ?peg) 
                   (clear ?disc))
:effect  (and (vide ?peg) 
              (pincing ?disc) 
              (not (emptyPince))
              (not (on ?disc ?peg))  
              (not (clear ?disc)))
 )

(:action mettreSurPeg
:parameters (?disc ?peg)
:precondition (and 
                (disc ?disc) 
                (peg ?peg) 
                (pincing ?disc) 
                (vide ?peg)
                )
:effect  (and (clear ?disc) 
            (not (pincing ?disc))
            (emptyPince)
            (on ?disc ?peg)
            (not (vide ?peg)))
)

(:action mettreSurDisc
:parameters (?disc ?to)
:precondition (and 
                   (smaller ?to ?disc) 
                   (disc ?disc) 
                   (disc ?to) 
                   (pincing ?disc) 
                   (clear ?to))
:effect  (and (clear ?disc) 
              (on ?disc ?to) 
              (emptyPince)
              (not (pincing ?disc))  
              (not (clear ?to)))
)

(:action enleverDuDisc
:parameters (?disc ?from)
:precondition (and 
                   (disc ?disc) 
                   (disc ?from) 
                   (emptyPince)
                   (on ?disc ?from) 
                   (clear ?disc))
:effect  (and (clear ?from) 
              (pincing ?disc) 
              (not (emptyPince))
              (not (on ?disc ?from))  
              )
 )

) 