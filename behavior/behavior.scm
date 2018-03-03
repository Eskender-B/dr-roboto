
(use-modules (opencog atom-types)(opencog pointmem)
             (opencog nlp relex2logic)
             (opencog openpsi)
             (opencog openpsi dynamics)
             (opencog eva-behavior)
             (opencog nlp)
             (opencog ghost))

(use-modules (ice-9 readline)) (activate-readline)
(add-to-load-path "/usr/local/share/opencog/scm")
(add-to-load-path ".")
(use-modules (opencog))
(use-modules (opencog query))
(use-modules (opencog exec))
(load-from-path "opencog.scm")




;; ----------------------------------------------
;; Parse ghost topic files. 
;; Ghost rules handle speech interactions.

(ghost-parse-file "test.top")


;; ----------------------------------------------
;; Add events and callbacks.
;; Events are monitored actions the robot periodically checks for.
;; The detection of event causes interaction rules to trigger.
;; The interaction rules can then in turn cause ghost rules to trigger speech output
;; or cause some other function to execute.

(load "events.scm")


;; ----------------------------------------------
;; Add dynamic interaction rules.
;; Interaction rule mainly handle non-speech triggered response.

(load "interaction-rules.scm")



;; ------------------------------------------------
;; Add testing functions
;; The functions are used to simulate the occurence of events for testing.

(load "test.scm")
