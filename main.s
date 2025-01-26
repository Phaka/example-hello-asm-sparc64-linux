! SPARC64 assembly for Linux
! System calls for SPARC64 Linux:
! 4 for write
! 1 for exit

        .section ".text"
        .align 4
        .global _start

_start:
        ! Write system call
        mov     4, %g1          ! System call number for write
        mov     1, %o0          ! File descriptor 1 is stdout
        setx    message, %g4, %o1 ! Load 64-bit address of message
        mov     14, %o2         ! Message length
        ta      0x6d            ! Make system call

        ! Exit system call
        mov     1, %g1          ! System call number for exit
        mov     0, %o0          ! Return code 0
        ta      0x6d            ! Make system call

        .section ".rodata"
        .align 8                ! 64-bit alignment
message:
        .asciz "Hello, World!\n"
