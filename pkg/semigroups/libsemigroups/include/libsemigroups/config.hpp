#ifndef _INCLUDE_LIBSEMIGROUPS_CONFIG_HPP
#define _INCLUDE_LIBSEMIGROUPS_CONFIG_HPP 1
 
/* include/libsemigroups/config.hpp. Generated automatically at end of configure. */
/* config/config.h.  Generated from config.h.in by configure.  */
/* config/config.h.in.  Generated from configure.ac by autoheader.  */

/* define if building in debug mode */
/* #undef DEBUG */

/* define if building with eigen */
#ifndef LIBSEMIGROUPS_EIGEN_ENABLED
#define LIBSEMIGROUPS_EIGEN_ENABLED 1
#endif

/* define if building with stats mode */
#ifndef LIBSEMIGROUPS_ENABLE_STATS
#define LIBSEMIGROUPS_ENABLE_STATS 1
#endif

/* define if building with fmt */
/* #undef FMT_ENABLED */

/* define if the compiler supports basic C++14 syntax */
#ifndef LIBSEMIGROUPS_HAVE_CXX14
#define LIBSEMIGROUPS_HAVE_CXX14 1
#endif

/* Define to 1 if you have the <dlfcn.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_DLFCN_H
#define LIBSEMIGROUPS_HAVE_DLFCN_H 1
#endif

/* Define to 1 if you have the `gettimeofday' function. */
#ifndef LIBSEMIGROUPS_HAVE_GETTIMEOFDAY
#define LIBSEMIGROUPS_HAVE_GETTIMEOFDAY 1
#endif

/* Define to 1 if you have the <inttypes.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_INTTYPES_H
#define LIBSEMIGROUPS_HAVE_INTTYPES_H 1
#endif

/* Define to 1 if you have the `pthread' library (-lpthread). */
#ifndef LIBSEMIGROUPS_HAVE_LIBPTHREAD
#define LIBSEMIGROUPS_HAVE_LIBPTHREAD 1
#endif

/* Define to 1 if you have the <limits.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_LIMITS_H
#define LIBSEMIGROUPS_HAVE_LIMITS_H 1
#endif

/* Define to 1 if your system has a GNU libc compatible `malloc' function, and
   to 0 otherwise. */
#ifndef LIBSEMIGROUPS_HAVE_MALLOC
#define LIBSEMIGROUPS_HAVE_MALLOC 1
#endif

/* Define to 1 if you have the `memset' function. */
#ifndef LIBSEMIGROUPS_HAVE_MEMSET
#define LIBSEMIGROUPS_HAVE_MEMSET 1
#endif

/* Define to 1 if you have the `pow' function. */
#ifndef LIBSEMIGROUPS_HAVE_POW
#define LIBSEMIGROUPS_HAVE_POW 1
#endif

/* Define if you have POSIX threads libraries and header files. */
#ifndef LIBSEMIGROUPS_HAVE_PTHREAD
#define LIBSEMIGROUPS_HAVE_PTHREAD 1
#endif

/* Define to 1 if you have the <pthread.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_PTHREAD_H
#define LIBSEMIGROUPS_HAVE_PTHREAD_H 1
#endif

/* Have PTHREAD_PRIO_INHERIT. */
#ifndef LIBSEMIGROUPS_HAVE_PTHREAD_PRIO_INHERIT
#define LIBSEMIGROUPS_HAVE_PTHREAD_PRIO_INHERIT 1
#endif

/* Define to 1 if the system has the type `ptrdiff_t'. */
#ifndef LIBSEMIGROUPS_HAVE_PTRDIFF_T
#define LIBSEMIGROUPS_HAVE_PTRDIFF_T 1
#endif

/* Define to 1 if you have the `sqrt' function. */
#ifndef LIBSEMIGROUPS_HAVE_SQRT
#define LIBSEMIGROUPS_HAVE_SQRT 1
#endif

/* Define to 1 if you have the <stdint.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_STDINT_H
#define LIBSEMIGROUPS_HAVE_STDINT_H 1
#endif

/* Define to 1 if you have the <stdio.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_STDIO_H
#define LIBSEMIGROUPS_HAVE_STDIO_H 1
#endif

/* Define to 1 if you have the <stdlib.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_STDLIB_H
#define LIBSEMIGROUPS_HAVE_STDLIB_H 1
#endif

/* Define to 1 if you have the <strings.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_STRINGS_H
#define LIBSEMIGROUPS_HAVE_STRINGS_H 1
#endif

/* Define to 1 if you have the <string.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_STRING_H
#define LIBSEMIGROUPS_HAVE_STRING_H 1
#endif

/* Define to 1 if you have the <sys/stat.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_SYS_STAT_H
#define LIBSEMIGROUPS_HAVE_SYS_STAT_H 1
#endif

/* Define to 1 if you have the <sys/time.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_SYS_TIME_H
#define LIBSEMIGROUPS_HAVE_SYS_TIME_H 1
#endif

/* Define to 1 if you have the <sys/types.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_SYS_TYPES_H
#define LIBSEMIGROUPS_HAVE_SYS_TYPES_H 1
#endif

/* Define to 1 if you have the <unistd.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_UNISTD_H
#define LIBSEMIGROUPS_HAVE_UNISTD_H 1
#endif

/* Define to 1 if you have the <x86intrin.h> header file. */
/* #undef HAVE_X86INTRIN_H */

/* Define to 1 if the system has the type `_Bool'. */
#ifndef LIBSEMIGROUPS_HAVE__BOOL
#define LIBSEMIGROUPS_HAVE__BOOL 1
#endif

/* Define to 1 if the system has the `__builtin_clzll' built-in function */
#ifndef LIBSEMIGROUPS_HAVE___BUILTIN_CLZLL
#define LIBSEMIGROUPS_HAVE___BUILTIN_CLZLL 1
#endif

/* Define to 1 if the system has the `__builtin_popcountl' built-in function
   */
#ifndef LIBSEMIGROUPS_HAVE___BUILTIN_POPCOUNTL
#define LIBSEMIGROUPS_HAVE___BUILTIN_POPCOUNTL 1
#endif

/* define if building with HPCombi */
/* #undef HPCOMBI_ENABLED */

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#ifndef LIBSEMIGROUPS_LT_OBJDIR
#define LIBSEMIGROUPS_LT_OBJDIR ".libs/"
#endif

/* Name of package */
#ifndef LIBSEMIGROUPS_PACKAGE
#define LIBSEMIGROUPS_PACKAGE "libsemigroups"
#endif

/* Define to the address where bug reports for this package should be sent. */
#ifndef LIBSEMIGROUPS_PACKAGE_BUGREPORT
#define LIBSEMIGROUPS_PACKAGE_BUGREPORT "jdm3@st-andrews.ac.uk"
#endif

/* Define to the full name of this package. */
#ifndef LIBSEMIGROUPS_PACKAGE_NAME
#define LIBSEMIGROUPS_PACKAGE_NAME "libsemigroups"
#endif

/* Define to the full name and version of this package. */
#ifndef LIBSEMIGROUPS_PACKAGE_STRING
#define LIBSEMIGROUPS_PACKAGE_STRING "libsemigroups 2.3.2"
#endif

/* Define to the one symbol short name of this package. */
#ifndef LIBSEMIGROUPS_PACKAGE_TARNAME
#define LIBSEMIGROUPS_PACKAGE_TARNAME "libsemigroups"
#endif

/* Define to the home page for this package. */
#ifndef LIBSEMIGROUPS_PACKAGE_URL
#define LIBSEMIGROUPS_PACKAGE_URL ""
#endif

/* Define to the version of this package. */
#ifndef LIBSEMIGROUPS_PACKAGE_VERSION
#define LIBSEMIGROUPS_PACKAGE_VERSION "2.3.2"
#endif

/* Define to necessary symbol if this constant uses a non-standard name on
   your system. */
/* #undef PTHREAD_CREATE_JOINABLE */

/* The size of `void *', as computed by sizeof. */
#ifndef LIBSEMIGROUPS_SIZEOF_VOID_P
#define LIBSEMIGROUPS_SIZEOF_VOID_P 8
#endif

/* Define to 1 if all of the C90 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it. */
#ifndef LIBSEMIGROUPS_STDC_HEADERS
#define LIBSEMIGROUPS_STDC_HEADERS 1
#endif

/* define as 1 if we should try and use the __builtin_clzlll function if
   available */
#ifndef LIBSEMIGROUPS_USE_CLZLL
#define LIBSEMIGROUPS_USE_CLZLL 1
#endif

/* define as 1 if we should try and use the __builtin_popcntl function if
   available */
#ifndef LIBSEMIGROUPS_USE_POPCNT
#define LIBSEMIGROUPS_USE_POPCNT 1
#endif

/* define if building in verbose mode */
/* #undef VERBOSE */

/* Version number of package */
#ifndef LIBSEMIGROUPS_VERSION
#define LIBSEMIGROUPS_VERSION "2.3.2"
#endif

/* Define for Solaris 2.5.1 so the uint64_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT64_T */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to the type of a signed integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int64_t */

/* Define to rpl_malloc if the replacement function should be used. */
/* #undef malloc */

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to the type of an unsigned integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint64_t */
 
/* once: _INCLUDE_LIBSEMIGROUPS_CONFIG_HPP */
#endif
