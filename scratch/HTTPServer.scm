; This is a web server implementation for listening and responding to scratch request
; Server runs on port 7777

(use-modules (web server)
 	     (web request)
	     (web response)
	     (web uri))


; Functons used by http handler implemented below
(define (speech-input speech)
	(ghost speech)
	"okay" ;Http response
)

(define (ghost-rule rule)

	(ghost-parse rule)
	"okay"	;HTTP response
)

(define (speech-output)
	
	(string-append "speechOutput " "Dummy output\n")
)

; Implement HTTP Handler
(define (scratch-handler request request-body)
	
	; Split string into list by '/' character
	;(define command (string-split request #\/))

	(define command
			(split-and-decode-uri-path (uri-path (request-uri request))))

	(define resp
		(cond
			((equal? (list-ref command 0) "speechInput") (speech-input (list-ref command 1)))
			((equal? (list-ref command 0) "ghostRule") (ghost-rule (list-ref command 1))  )
			((equal? (list-ref command 0) "poll") (speech-output) )
		)
	)
	
	(values 
		'((content-type . (text/html)))
		resp
	)	
)	



; Run the server in a thread
(call-with-new-thread
	(lambda ()
		(run-server scratch-handler 'http '(#:port 7777))
	)
)
(display "Scratch server started on port 7777.\n")
