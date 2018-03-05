(use-modules
	(opencog)
	(opencog exec)
	(opencog atom-types)
	(opencog pointmem)
	(opencog nlp relex2logic)
	(opencog openpsi)
	(opencog openpsi dynamics)
	(opencog eva-behavior)
	(opencog nlp )
	(opencog ghost))


;; ---------------------------------------------
;; Define functions used by the rules
(load "functions.scm")


;; ----------------------------------------------
;; Parse ghost topic files. 
;; Ghost rules handle speech interactions.

(ghost-parse-file "test.top")


;; ----------------------------------------------
;; Add events and callbacks.
;; Events are monitored actions the robot periodically checks for.
;; The detection of an event causes interaction rules to trigger.
;; The interaction rules can then in turn cause ghost rules to trigger speech output
;; or cause some other function to execute.

(load "events.scm")


;; ----------------------------------------------
;; Add dynamic interaction rules.
;; Interaction rules mainly handle non-speech triggered response.

(load "interaction-rules.scm")

;; ------------------------------------------------
;; Add testing functions
;; The functions are used to simulate the occurence of events for testing.

(load "test.scm")



;; Run ghost loop
;(ghost-run)


;; Run dynamic psi
;(psi-updater-run)
