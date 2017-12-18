#ifndef _SRC_LIBSEMIGROUPS_CONFIG_H
#define _SRC_LIBSEMIGROUPS_CONFIG_H 1
 
/* src/libsemigroups-config.h. Generated automatically at end of configure. */
/* config/config.h.  Generated from config.h.in by configure.  */
/* config/config.h.in.  Generated from configure.ac by autoheader.  */

/* define if building in debug mode */
/* #undef DEBUG */

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

/* Define to 1 if you have the <limits.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_LIMITS_H
#define LIBSEMIGROUPS_HAVE_LIMITS_H 1
#endif

/* Define to 1 if your system has a GNU libc compatible `malloc' function, and
   to 0 otherwise. */
#ifndef LIBSEMIGROUPS_HAVE_MALLOC
#define LIBSEMIGROUPS_HAVE_MALLOC 1
#endif

/* Define to 1 if you have the <memory.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_MEMORY_H
#define LIBSEMIGROUPS_HAVE_MEMORY_H 1
#endif

/* Define to 1 if you have the `memset' function. */
#ifndef LIBSEMIGROUPS_HAVE_MEMSET
#define LIBSEMIGROUPS_HAVE_MEMSET 1
#endif

/* Define to 1 if you have the `pow' function. */
#ifndef LIBSEMIGROUPS_HAVE_POW
#define LIBSEMIGROUPS_HAVE_POW 1
#endif

/* Define to 1 if you have the <pthread.h> header file. */
#ifndef LIBSEMIGROUPS_HAVE_PTHREAD_H
#define LIBSEMIGROUPS_HAVE_PTHREAD_H 1
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

/* Define to 1 if the system has the type `_Bool'. */
/* #undef HAVE__BOOL */

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
#define LIBSEMIGROUPS_PACKAGE_STRING "libsemigroups 0.5.2"
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
#define LIBSEMIGROUPS_PACKAGE_VERSION "0.5.2"
#endif

/* define if building in stats mode */
/* #undef STATS */

/* Define to 1 if you have the ANSI C header files. */
#ifndef LIBSEMIGROUPS_STDC_HEADERS
#define LIBSEMIGROUPS_STDC_HEADERS 1
#endif

/* Version number of package */
#ifndef LIBSEMIGROUPS_VERSION
#define LIBSEMIGROUPS_VERSION "0.5.2"
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
 
/* once: _SRC_LIBSEMIGROUPS_CONFIG_H */
#endif
