#CSCI 4720 - 09/18/2025
#This MIPS assembly code will request an integer from the user, and compare it to a hardcoded value (value .byte)
    .data
message:
    .asciiz "Please guess an integer:\n"
messageo:
    .asciiz "The integer you just input is:\n"
message_larger:
    .asciiz "Your input is larger than what we have!\n"
message_smaller:
    .asciiz "Your input is smaller than what we have!\n"
message_equal:
    .asciiz "Congratulations! You got it!\n"
value:
    .align 2 #2^k, 2^2 = 4 bytes
    .word 100

    .text
main:
    la $a0, message #Put the address of our message into register a0
    li $v0, 4 #Load system call 4 (print_string) (loading integer 4 into register v0)
    syscall #Call print string, which pulls string from $a0
    li $v0, 5 #Load system call 5 (read_int)
    syscall #Syscall will put the grabbed integer directly into v0
    lw $a1, value #Load our comparison value into register a1
    beq $v0, $a1, eq_label #If the inputted integer is equal to the comparison value, jump to eq_label
    bgt $v0, $a1, gt_label #If greater than comparison value, jump to gt_label
    #Beginning of Else condition (less than) - no branch is needed as it's a catch-all
    la $a0, message_smaller
    li $v0, 4 #Load system call 4 (print_string)
    syscall #Call print string, which pulls string from $a0
    j main #Loop back to beginning of main
gt_label:
    la $a0, message_larger
    li $v0, 4
    syscall
    j main
eq_label:
    la $a0, message_equal
    li $v0, 4
    syscall
exit_label:
    jr $ra #Exit the program (jump register return address)
