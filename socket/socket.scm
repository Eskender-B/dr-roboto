;;; This file contains TCP socket implementation for input and output text from and to STT and TTS respectively

(use-modules (ice-9 textual-ports))


;; Port 5555: Text input from STT
(define input-port 5555)

;; Port 6666: Text output to TTS 
(define output-port 6666)



(define (input-from-stt)
	(let ((sock (socket PF_INET SOCK_STREAM IPPROTO_TCP))
	      (speech-txt ""))

		(bind sock (make-socket-address AF_INET INADDR_LOOPBACK input-port))
		(listen sock 2)

		(simple-format #t "Listening for text input from port: ~S: " input-port)
		(newline)

		(while #t
			(let* ((client-conn (accept sock))
			       (client-details (cdr client-conn))
			       (client (car client-conn)))

				(simple-format #t "Got client connection: ~S" client-details)
				(newline)
				(simple-format #t "Client address: ~S" (gethostbyaddr 
									  (sockaddr:addr client-details)))
				(newline)
				(while #t
					(display "speech: " client)
					(set! speech-txt (get-line client))
					(if (eof-object? speech-txt)
					    (break)
					    (begin 
						; Remove any trailing \r\n 
						(set! speech-txt (string-trim-right speech-txt #\newline))
						(set! speech-txt (string-trim-right speech-txt #\return))
						(set! speech-txt (string-trim-both speech-txt))

						; Finally give txt to Ghost
						(if (string-null? speech-txt)
						    (begin (display "Empty string\n" client) (continue))
						    (ghost speech-txt)
						)
					    )
					)
				)
				(close client)
				(display "Client closed.\n")
			)
		)
	)
)



;; Instantiate functions in threads

(define input-thread (call-with-new-thread input-from-stt))
(display "Text input thread started.\n")
