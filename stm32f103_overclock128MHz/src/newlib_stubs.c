#include <errno.h>
#include <sys/stat.h>
#include <sys/times.h>
#include <sys/unistd.h>

#include "stm32f10x_usart.h"

#ifndef STDOUT_USART
#define STDOUT_USART 1
#endif

#ifndef STDERR_USART
#define STDERR_USART 1
#endif

#ifndef STDIN_USART
#define STDIN_USART 1
#endif

#undef errno
extern int errno;

/* a pointer to a list of env vars and their values.  */
char *__env[1] = { 0 };
char **environ = __env;

int _write(int file, char *ptr, int len);

/*void _exit(int status) {
	_write(1, "exit", 4);
	while(1) {
		;
	}
}*/

int _close(int file) {
	return -1;
}

/* TODO execve transfer control to a new process. */
int _execve(char *name, char**argv, char **env) {
	errno = ENOMEM;
	return -1;
}

int _fork() {
	errno = EAGAIN;
	return -1;
}

int _fstat(int file, struct stat *st) {
	st->st_mode = S_IFCHR;
	return 0;
}

int _getpid() {
	return 1;
}

int _isatty(int file) {
	switch(file) {
		case STDOUT_FILENO:
		case STDERR_FILENO:
		case STDIN_FILENO:
			return 1;
		default:
			errno = EBADF;
			return 0;
	 }
}

int _kill(int pid, int sig) {
	errno = EINVAL;
	return -1;
}


int _link(char *old, char *new) {
    errno = EMLINK;
    return -1;
}

/*
 lseek
 Set position in a file. Minimal implementation:
 */
int _lseek(int file, int ptr, int dir) {
    return 0;
}

/*
 sbrk
 Increase program data space.
 Malloc and related functions depend on this
 */
caddr_t _sbrk(int incr) {

    extern char _ebss; // Defined by the linker
    static char *heap_end;
    char *prev_heap_end;

    if (heap_end == 0) {
        heap_end = &_ebss;
    }
    prev_heap_end = heap_end;

char * stack = (char*) __get_MSP();
     if (heap_end + incr >  stack)
     {
         _write (STDERR_FILENO, "Heap and stack collision\n", 25);
         errno = ENOMEM;
         return  (caddr_t) -1;
         //abort ();
     }

    heap_end += incr;
    return (caddr_t) prev_heap_end;

}

/*
 read
 Read a character to a file. `libc' subroutines will use this system routine for input from all files, including stdin
 Returns -1 on error or blocks until the number of characters have been read.
 */


int _read(int file, char *ptr, int len) {
    int n;
    int num = 0;
    switch (file) {
    case STDIN_FILENO:
        for (n = 0; n < len; n++) {
#if   STDIN_USART == 1
            while ((USART1->SR & USART_FLAG_RXNE) == (uint16_t)RESET) {}
            char c = (char)(USART1->DR & (uint16_t)0x01FF);
#elif STDIN_USART == 2
            while ((USART2->SR & USART_FLAG_RXNE) == (uint16_t) RESET) {}
            char c = (char) (USART2->DR & (uint16_t) 0x01FF);
#elif STDIN_USART == 3
            while ((USART3->SR & USART_FLAG_RXNE) == (uint16_t)RESET) {}
            char c = (char)(USART3->DR & (uint16_t)0x01FF);
#endif
            *ptr++ = c;
            num++;
        }
        break;
    default:
        errno = EBADF;
        return -1;
    }
    return num;
}

/*
 stat
 Status of a file (by name). Minimal implementation:
 int    _EXFUN(stat,( const char *__path, struct stat *__sbuf ));
 */

int _stat(const char *filepath, struct stat *st) {
    st->st_mode = S_IFCHR;
    return 0;
}

/*
 times
 Timing information for current process. Minimal implementation:
 */

clock_t _times(struct tms *buf) {
    return -1;
}

/*
 unlink
 Remove a file's directory entry. Minimal implementation:
 */
int _unlink(char *name) {
    errno = ENOENT;
    return -1;
}

/*
 wait
 Wait for a child process. Minimal implementation:
 */
int _wait(int *status) {
    errno = ECHILD;
    return -1;
}

/*
 write
 Write a character to a file. `libc' subroutines will use this system routine for output to all files, including stdout
 Returns -1 on error or number of bytes sent
 */
int _write(int file, char *ptr, int len) {
    int n;
    switch (file) {
    case STDOUT_FILENO: /*stdout*/
        for (n = 0; n < len; n++) {
#if STDOUT_USART == 1
            while ((USART1->SR & USART_FLAG_TC) == (uint16_t)RESET) {}
            USART1->DR = (*ptr++ & (uint16_t)0x01FF);
#elif  STDOUT_USART == 2
            while ((USART2->SR & USART_FLAG_TC) == (uint16_t) RESET) {
            }
            USART2->DR = (*ptr++ & (uint16_t) 0x01FF);
#elif  STDOUT_USART == 3
            while ((USART3->SR & USART_FLAG_TC) == (uint16_t)RESET) {}
            USART3->DR = (*ptr++ & (uint16_t)0x01FF);
#endif
        }
        break;
    case STDERR_FILENO: /* stderr */
        for (n = 0; n < len; n++) {
#if STDERR_USART == 1
            while ((USART1->SR & USART_FLAG_TC) == (uint16_t)RESET) {}
            USART1->DR = (*ptr++ & (uint16_t)0x01FF);
#elif  STDERR_USART == 2
            while ((USART2->SR & USART_FLAG_TC) == (uint16_t) RESET) {
            }
            USART2->DR = (*ptr++ & (uint16_t) 0x01FF);
#elif  STDERR_USART == 3
            while ((USART3->SR & USART_FLAG_TC) == (uint16_t)RESET) {}
            USART3->DR = (*ptr++ & (uint16_t)0x01FF);
#endif
        }
        break;
    default:
        errno = EBADF;
        return -1;
    }
    return len;
}

