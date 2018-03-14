;;; This file loads the shared library containing c++ detector functions.
;;; The C++ functions are either returning or looping.
;;; The looping functions are started in a single thread for each and result is updated
;;; on a global hash table.

;; For returning functions result is found as a return value

;; For looping functions result is updated on a global hash table named as follows
	;; func_name_hashT
	;; Check the value of last update time in the table for the key 'time' to check expiry
	;; (compare against (current-time) in seconds
	;; For the other key-value pairs check each functions documentation


(load-extension (string-append TOPDIR "detectors/libdetectors") "init_detectors") 



;; Run looping detector functions in a single thread for each

(call-with-new-thread detector-looping-func)
