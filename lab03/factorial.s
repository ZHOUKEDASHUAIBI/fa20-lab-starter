.globl factorial

.data
n: .word 7

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw t0, 4(sp)
    sw t1, 0(sp)
    addi s0, x0, 1      #set fact(s0) = 1
    jal ra, loop
    lw ra, 12(sp)
    lw s0, 8(sp)
    lw t0, 4(sp)
    lw t1, 0(sp)
    addi sp, sp, 16
    jr ra
loop:
    beq a0, x0, exit1
    addi sp, sp, -4    
    sw ra, 0(sp)
    add t1, x0, x0          #store fact * a0
    add t0, a0, x0          #index i
    jal ra, time
    lw ra, 0(sp)
    addi sp, sp, 4
    addi a0, a0, -1
    j loop
time:
    beq t0, x0, exit2
    add t1, t1, s0          #add fact i(t0) times
    addi t0, t0, -1
    j time
exit1:
    add a0, s0, x0
    jr ra
exit2:
    add s0, t1, x0
    jr ra