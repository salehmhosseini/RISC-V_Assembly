.data # not get the data in one line

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

  mod_compute_loop:
    blt t2, t3, exit_mod_compute_loop
    sub t2, t2, t3
    j mod_compute_loop

  exit_mod_compute_loop:
    li a7, 1    # Print the result
    mv a0, t2
    ecall

  addi t1, t1, 1
  j test_case_loop

exit_test_case_loop:
  li a7, 10   # Exit program
  ecall
