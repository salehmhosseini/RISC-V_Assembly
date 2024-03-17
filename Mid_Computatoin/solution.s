.text
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

  add t4, t2, t3    # Add A and B
  srai t4, t4, 1    # Shift right arithmetic to divide by 2 (compute average)

  li a7, 1    # Print the result
  mv a0, t4
  ecall

  addi t1, t1, 1
  j test_case_loop

exit_test_case_loop:
  li a7, 10   # Exit program
  ecall
