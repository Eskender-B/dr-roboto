# Dr. Roboto

Dr. Roboto is an interacting little robot with personality centered around curiosity, pleasing user and story telling. It makes use of opencog's [Ghost](https://github.com/opencog/opencog/tree/master/opencog/ghost) and [OpenPsi](https://github.com/opencog/opencog/tree/master/opencog/openpsi) submodules as engines to drive its behavior.


## Implementation

* Code connecting the behavior module to STT is found at [socket/socket.scm](socket/socket.scm).
* Behavior codes and rules are under [behavior/](behavior/).
	* Ghost rules that lists all syntax are found at [behavior/test.top](behavior/test.top).
	* Ghost rules are used for speech triggered actions.
	* For non-speech triggered actions OpenPsi's dynamic module is used to indirectly trigger ghost rules.
	```
		event ==> phony speech                          (Dynamic OpenPsi rule)
		phony speech ==> speech or some action		(Ghost rule)
	```
	* Events and event monitoring functions are at [behavior/events.scm](behavior/events.scm).
	* Dynamic openPsi rules are found at [behavior/interaction-rules.scm](behavior/interaction-rules.scm).
	* Functions/actions used by Ghost rules are found at [behavior/functions.scm](behavior/functions.scm).

	* Testing functions are found at [behavior/test.scm](behavior/test.scm).
	* Scheme-C++ binding and detector functions are found at [detectors/](detectors/)

## Status

* Currently basic layout and some simple functions and rules are implemented.
* Scheme binding for C++ functions is implemented
* Sample detector functions are also implemented alongside
* As stories are added each topic may have its own set of files for ghost rules, interaction rules, events and so on ...

## Usage
* Start relex server
* Compile C++ detectors in source:
	```
	$ make
	```
* run [run.sh](run.sh) to run guile instance:

	``` 
	$ ./run.sh
	```
* In the started guile instance you can run test simulation functions. For example for simulating face event 
	```
	guile> (test-set-face-event) 
	```
* In another terminal use telnet to enter speech text input

	``` 
	$ telnet localhost 5555
	```
* At the moment you can see the result in the opened guile instance.

## To Do
* Add detector c++ functions 
* Add a better testing module for effectively testing stories and rules regardless of the detectors.
* May be write a better action selector for Ghost rules.
* Add a lot of stories.
* Interface with scratch.

## Dependency

* [OpenCog](https://github.com/opencog) (clone from Feb 26)
* [Relex](https://github.com/opencog/relex)
* [Guile 2.2](https://www.gnu.org/software/guile/download/)
