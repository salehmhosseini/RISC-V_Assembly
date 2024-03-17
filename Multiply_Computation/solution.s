.text # TODO get the input in one line
li a7, 5      # Read the number of test cases and store in a0
ecall
mv t0, a0     # t0: number of test cases

li t1, 0      # t1: loop initialization index
test_case_loop:
  bge t1, t0, exit_test_case_loop

  li a7, 5    # Read the first number (A)
  ecall
  mv t2, a0   # t2: the first number (A)

  li a7, 5    # Read the second number (B)
  ecall
  mv t3, a0   # t3: the second number (B)

  li t4, 0    # t4: result of multiplication, initialize to 0

  multiply_loop:
    beqz t3, exit_multiply_loop  # If B is 0, exit multiplication loop
    add t4, t4, t2               # Add A to the result
    addi t3, t3, -1              # Decrement B
    j multiply_loop

  exit_multiply_loop:
    li a7, 1    # Print the result
    mv a0, t4
    ecall

  addi t1, t1, 1
  j test_case_loop

exit_test_case_loop:
  li a7, 10   # Exit program
  ecall
