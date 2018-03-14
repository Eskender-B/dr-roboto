/**
 This file contains scheme wrappers for every C++ detector functions.
*/


#include "CppToScm.h"


// Global variables are defined elsewhere (In detector implementation files.
// For every global variable add extern declaration to use in this file
extern SCM hashT_looping_func;


/**
 Wrapping function for sample looping function.
*/

SCM looping_func_wrapper(void)
{
	looping_func();
}


/**
 Wrapping function for sample returning function.
*/

SCM returning_func_wrapper(void)
{
	return scm_from_long( returning_func() );
}



/**
 Initialization function that is first called when this library is loaded in scheme
*/

void init_in_module(void* data)
{
	// Global variables for communicating with the looping functions are defined here
	scm_c_define("detector-name", scm_from_utf8_string("Dr. Roboto"));
	
	hashT_looping_func = scm_make_weak_key_hash_table(scm_from_int(2));
	scm_c_define("detector-looping-func-hashT", hashT_looping_func);

	// Register and bind C++ procedures for scheme
	scm_c_define_gsubr("detector-looping-func", 0, 0, 0, (void*)looping_func_wrapper);
	scm_c_define_gsubr("detector-returning-func", 0, 0, 0, (void*)returning_func_wrapper);
}


void* init_in_guile(void* data)
{
	scm_c_define_module("detectors", init_in_module, NULL);
  	scm_c_use_module("detectors");
	return NULL;

}

void init_detectors(void)
{
	scm_with_guile(init_in_guile, NULL);
}
