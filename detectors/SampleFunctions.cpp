/**
 This file contains sample looping and returning detector functions.
 Follow this format for any other C++ detector functions/files.
*/


#include <libguile.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

/**
 A sample looping function that updates global scheme variable
*/

SCM hashT_looping_func;

void looping_func(void)
{
	while(1)
	{
		srandom( (unsigned int)time(NULL) );
		scm_hash_set_x(hashT_looping_func, \
					scm_from_utf8_string("val"), \
					scm_from_long( random() ) );

		scm_hash_set_x(hashT_looping_func, \
					scm_from_utf8_string("time"), \
					scm_current_time() );
		sleep(1);
	}
}


/**
 A sample returning function
*/
long int returning_func(void)
{
	srandom( (unsigned int)time(NULL) );
	return random();
}
