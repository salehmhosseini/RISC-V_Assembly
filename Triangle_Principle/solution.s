.data # not work correctly

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

  li a7, 5    # Read the third number (C)
  ecall
  mv t4, a0   # t4: the third number (C)

  # Check if the sum of any two sides is greater than the third side
  add t5, t2, t3   # t5 = A + B
  blt t5, t4, not_triangle   # if A + B < C, not a triangle

  add t5, t2, t4   # t5 = A + C
  blt t5, t3, not_triangle   # if A + C < B, not a triangle

  add t5, t3, t4   # t5 = B + C
  blt t5, t2, not_triangle   # if B + C < A, not a triangle

  li a7, 1   # Print 1 if it's a triangle
  mv a0, t2
  ecall
  j end_test_case

not_triangle:
  li a7, 1   # Print 0 if it's not a triangle
  li a0, 0
  ecall

end_test_case:
  addi t1, t1, 1
  j test_case_loop

exit_test_case_loop:
  li a7, 10   # Exit program
  ecall
