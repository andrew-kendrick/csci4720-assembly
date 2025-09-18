#CSCI 4720 - 09/16/2025
#This MIPS assembly code will request an integer from the user, and print it back to them
    .data
message:
    .asciiz "Please input an integer:\n"
messageo:
    .asciiz "The integer you just input is:\n"
message_larger:
    .asciiz "Your input is larger than what we have!\n"
message_smaller:
    .asciiz "Your input is smaller than what we have!\n"
message_equal:
    .asciiz "Congratulations! You got it!\n"
value:
    .byte 100

    .text
main:
    la $a0, message #Put the address of our message into register a0
    li $v0, 4 #Load system call 4 (print_string) (loading integer 4 into register v0)
    syscall
    li $v0, 5 #Load system call 5 (read_int)
    syscall #Syscall will put the grabbed integer directly into v0, so we'll need to move it somewhere
    move $a1, $v0 #Move the inputted integer (in v0) to a0
    la $a0, messageo #Load messageo into register a0
    li $v0, 4 #Load system call 4 (print_string)
    syscall #Print the string in a0
    move $a0, $a1 #Swap a1 into a0 for use in print_int call
    li $v0, 1 #Load system call 1 (print_int)
    syscall #Will print integer in a0 (the integer the user inputted)
    jr $ra #Exit