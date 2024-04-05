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

  gcd_compute_loop:
    bnez t3, continue_gcd_compute_loop  # If B is not 0, continue
    mv t4, t2                          # GCD is in t2
    j exit_gcd_compute_loop

  continue_gcd_compute_loop:
    blt t2, t3, swap_t2_t3             # If t2 < t3, swap t2 and t3
    sub t2, t2, t3                     # Subtract t3 from t2
    j gcd_compute_loop

  swap_t2_t3:
    mv t4, t2
    mv t2, t3
    mv t3, t4
    j gcd_compute_loop

  exit_gcd_compute_loop:
    li a7, 1    # Print the result (GCD is in t2)
    mv a0, t2
    ecall

  addi t1, t1, 1
  j test_case_loop

exit_test_case_loop:
  li a7, 10   # Exit program
  ecall
