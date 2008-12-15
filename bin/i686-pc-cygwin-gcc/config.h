/* config.h.  Generated from config.hin by configure.  */
/****************************************************************************
**
*D  user edit-able defines
*/

/* initial amount of memory if '-m' is not given in KB                          */
#define SY_STOR_MIN		(24 * 1024)


/****************************************************************************
**
*D  debug flags (user edit-able)
*/



/* * * * * * * * * *  saving/loading the workspace * * * * * * * * * * * * */

/* define to get information while restoring                               */
/* #undef DEBUG_LOADING */

/* define to debug registering of global bags                              */
/* #undef DEBUG_GLOBAL_BAGS */

/* define to debug registering of function handlers                        */
/* #undef DEBUG_HANDLER_REGISTRATION */


/* * * * * * * * * * * * * debugging GASMAN  * * * * * * * * * * * * * * * */

/* define to create functions PTR_BAG, etc instead of macros               */
/* #undef DEBUG_FUNCTIONS_BAGS */

/* define to debug the generational aspect of gasman                       */
/* #undef DEBUG_DEADSONS_BAGS */

/* define to debug masterpointers errors                                   */
/* #undef DEBUG_MASTERPOINTERS */


/****************************************************************************
**
*D  architecture
*/

/* define the name of the architucture                                     */
#define SYS_ARCH "i686-pc-cygwin-gcc"

/* define as 1 if the user resource file is ".gaprc"                       */
#define HAVE_DOTGAPRC		1

/* define as 1 if there is a environment variable $PATH                    */
#define HAVE_PATH_ENV		1


/****************************************************************************
**
*D  check for the compiler features
*/

/* define as size of `long int' in bytes                                   */
#define SIZEOF_VOID_P 4

/* define as empty if `const' does not work                                */
/* #undef const */

/* define as empty if `inline' does not work                                */
/* #undef inline */

/* define if most significant bits have smallest addresses                 */
/* #undef WORDS_BIGENDIAN */

/* define as least offset which is still safe for an unaligned access      */
#define C_LONG_ALIGN 2

/* define as least offset we have to check the stack for pointer           */
#define C_STACK_ALIGN 2

/* define as 1 on SPARC architecture to flush register windows */
#define SPARC                   0

/* define as 1 on Itanium architecture to flush and mark register stack */
#define ITANIUM                   0

/* define as 1 if you symbols in ".o" files begin with `_'                 */
#define C_UNDERSCORE_SYMBOLS 1


/****************************************************************************
**
*D  check for "the" standard include files
*/

/* define as 1 if you have the include file "termio.h"                     */
#define HAVE_TERMIO_H 1

/* define as 1 if you have the include file "termios.h"                    */
#define HAVE_TERMIOS_H 1

/* define as 1 if you have the include file "sgtty.h"                      */
#define HAVE_SGTTY_H		0

/* define as 1 if you have the include file "signal.h"                     */
#define HAVE_SIGNAL_H 1

/* define as 1 if you have the include file "stdio.h"                      */
#define HAVE_STDIO_H 1

/* define as 1 if you have the standard ANSI C header files                */
#define STDC_HEADERS 1

/* define as 1 if you have the include file "libc.h"                       */
#define HAVE_LIBC_H 	  	0

/* define as 1 if you have the include file "unistd.h"                     */
#define HAVE_UNISTD_H 1

/* define as 1 if you have `getpseudotty'                                  */
#define HAVE_GETPSEUDOTTY	0

/* define as 1 if you have `_getpty'                                       */
#define HAVE__GETPTY		0

/* define as 1 if you have the include file "fcntl.h"                      */
#define HAVE_FCNTL_H 1

#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_SYSMACROS_H 1
#define HAVE_ERRNO_H 1
#define HAVE_ASSERT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MATH_H 1
#define HAVE_GETPT              0
#define HAVE_PTSNAME_R         0
#define HAVE_SETPGID 1
/****************************************************************************
**
*D  define if and how dynamic loading is supported
*/

/* define as 1 if you have `dlopen' and `dlsym'                            */
#define HAVE_DLOPEN 1

/* define as 1 if you have `rld_load' and `rld_lockup'                     */
#define HAVE_RLD_LOAD		0


/****************************************************************************
**
*D  define if and how the timing functions work
*/

/* define as 1 if you have `getrusage'                                     */
#define HAVE_GETRUSAGE 1

/* define as 1 if you have `times' (but not `getrusage')                   */
#define HAVE_TIMES 1

/* define as 1 if you have the include file "sys/param.h"                  */
#define HAVE_SYS_PARAM_H 1

/* define as 1 if you have the include file "sys/times.h"                  */
#define HAVE_SYS_TIMES_H 1


/****************************************************************************
**
*D  define if and how virtual memory works
*/

/* define as 1 if you have `vm_allocate'                                   */
#define HAVE_VM_ALLOCATE	0

/* define as 1 if you have `sbrk' (but not `vm_allocate')                  */
#define HAVE_SBRK 1


/****************************************************************************
**
*D  define if and how subprocesses are executed
*/

/* define as 1 if you have the include file "vfork.h"                      */
#define HAVE_VFORK_H		0

/* define as 1 if you have `fork'                                          */
#define HAVE_FORK 1

/* define as 1 ifyou have `popen'                                          */
#define HAVE_POPEN 1

/* define vfork as fork if vfork does not work                             */
/* #undef vfork */

/* define pid_t as int if pid_t does not work                              */
/* #undef pid_t */

/* define as 1 if you have a POSIX compatible "sys/wait.h"                 */
#define HAVE_SYS_WAIT_H 1

/* define as 1 if you have `waitpid'                                       */
#define HAVE_WAITPID 1

/* define as 1 if you have `wait4' (but not waitpid)                       */
#define HAVE_WAIT4 1

/* define as 1 if you have "union wait"                                    */
#define HAVE_UNION_WAIT		0


/****************************************************************************
**
*D  define if and how signal handling works
*/

/* define as 1 if you have `signal'                                        */
#define HAVE_SIGNAL 1

/* define as the return type of the signal handler                         */
#define RETSIGTYPE void

/* define as 1 if <RTSIGTYPE> is void                                      */
#define HAVE_SIGNAL_VOID 1


/****************************************************************************
**
*D  define if and how standard input/output works
*/

/* define as 1 if you have `ttyname'                                       */
#define HAVE_TTYNAME 1

/* define as 1 if you have `strerror'                                      */
#define HAVE_STRERROR 1

/* define as 1 if you have `select'                                        */
#define HAVE_SELECT 1

/****************************************************************************
**
*D  define if and how file access checks work
*/

/* define as 1 if your directory separator is '/'                          */
#define HAVE_SLASH_SEPARATOR	1

/* define as 1 if you have `access'                                        */
#define HAVE_ACCESS 1

/* define as 1 if you have `stat'                                          */
#define HAVE_STAT 1

/* define as 1 if you have `fstat'                                         */
#define HAVE_FSTAT 1

/* define as 1 if you have `lstat'                                         */
#define HAVE_LSTAT 1

/* define as 1 if the macros `S_ISDIR', `S_ISREG' do not work properly     */
#define STAT_MACROS_BROKEN	0

/* define as 1 if you have `mkdir'                                         */
#define HAVE_MKDIR 1

/* define as 1 if you have `unlink'                                        */
#define HAVE_UNLINK 1

/* define as 1 if you have `mkstemp'                                       */
#define HAVE_MKSTEMP 1

/* define as 1 if you have `mkdtemp'                                       */
#define HAVE_MKDTEMP 1

/* define as 1 if you have `rmdir'                                         */
#define HAVE_RMDIR 1

/* define as 1 if you have `link'                                          */
#define HAVE_LINK 1

/* define as 1 if you have `rename'                                        */
#define HAVE_RENAME 1

/* define as 1 if you have `symlink'                                       */
#define HAVE_SYMLINK 1

/* define as 1 if you have `readlink'                                      */
#define HAVE_READLINK 1

/* define as 1 if you have `lstat'                                         */
#define HAVE_LSTAT 1

/* define as 1 if you have `chmod'                                         */
#define HAVE_CHMOD 1

/* define as 1 if you have `fchmod'                                        */
#define HAVE_FCHMOD 1

/* define as 1 if you have `chown'                                         */
#define HAVE_CHOWN 1

/* define as 1 if you have `fchown'                                        */
#define HAVE_FCHOWN 1

/* define as 1 if you have `lchown'                                        */
#define HAVE_LCHOWN 1

/* define as 1 if you have `dup'                                           */
#define HAVE_DUP 1

/* define as 1 if you have `dup2'                                          */
#define HAVE_DUP2 1

/* define as 1 if you have `mknod'                                         */
#define HAVE_MKNOD 1

/* define as 1 if you have `mkfifo'                                        */
#define HAVE_MKFIFO 1


/****************************************************************************
**
*D  define if and how directory access checks work
*/

/* define as 1 if you have the include file "dirent.h"                     */
#define HAVE_DIRENT_H 1

/* define as 1 if you have `opendir'                                       */
#define HAVE_OPENDIR 1

/* define as 1 if you have `closedir'                                      */
#define HAVE_CLOSEDIR 1

/* define as 1 if you have `dirfd'                                         */
#define HAVE_DIRFD 1

/* define as 1 if you have `readdir'                                       */
#define HAVE_READDIR 1

/* define as 1 if you have `rewinddir'                                     */
#define HAVE_REWINDDIR 1

/* define as 1 if you have `seekdir'                                       */
#define HAVE_SEEKDIR 1

/* define as 1 if you have `telldir'                                       */
#define HAVE_TELLDIR 1

/* define as 1 if you have `telldir'                                       */
#define HAVE_TELLDIR 1

/****************************************************************************
**
*D  sockets
*/

/* define as 1 if you have `socket'                                        */
#define HAVE_SOCKET 1

/* define as 1 if you have `listen'                                        */
#define HAVE_LISTEN 1

/* define as 1 if you have `accept'                                        */
#define HAVE_ACCEPT 1

/* define as 1 if you have `connect'                                       */
#define HAVE_CONNECT 1

/* define as 1 if you have `bind'                                          */
#define HAVE_BIND 1

/* define as 1 if you have `getsockname'                                   */
#define HAVE_GETSOCKNAME 1

/* define as 1 if you have `recv'                                          */
#define HAVE_RECV 1

/* define as 1 if you have `recvfrom'                                      */
#define HAVE_RECVFROM 1

/* define as 1 if you have `recvmsg'                                       */
#define HAVE_RECVMSG 1

/* define as 1 if you have `send'                                          */
#define HAVE_SEND 1

/* define as 1 if you have `sendto'                                        */
#define HAVE_SENDTO 1

/* define as 1 if you have `sendmsg'                                       */
#define HAVE_SENDMSG 1

/* define as 1 if you have `getsockopt'                                    */
#define HAVE_GETSOCKOPT 1

/* define as 1 if you have `setsockopt'                                    */
#define HAVE_SETSOCKOPT 1

/* define as 1 if you have `getprotobyname'                                */
#define HAVE_GETPROTOBYNAME 1

/* define as 1 if you have `gethostbyname'                                 */
#define HAVE_GETHOSTBYNAME 1


/****************************************************************************
**
*D  miscellaneous
*/

/* define if this is the Cygwin32 port */
#define SYS_IS_CYGWIN32 1

/* define if this is the Darwin port */
#define SYS_IS_DARWIN 0

