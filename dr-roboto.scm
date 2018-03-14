;;; Main script for starting everything

;(add-to-load-path "behavior/")
;(add-to-load-path "socket/")

(define-public TOPDIR (current-filename))
(set! TOPDIR (string-drop-right TOPDIR 
	(- 
		(- (string-length TOPDIR) 1)
		(string-rindex TOPDIR #\/)
	))
)

;; Load C++ detectors
(include "detectors/detectors.scm")

;; Load behavior script
(include "behavior/behavior.scm")

;; Load socket implementation script for STT and TTS
(include "socket/socket.scm")
