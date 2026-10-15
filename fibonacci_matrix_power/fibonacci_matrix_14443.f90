module fibonacci_matrix_14443_mod
  implicit none
contains
  real(8) function compute_fibonacci_matrix_14443(x)
    real(8),intent(in)::x
    real(8)::f0,f1,nxt;integer::i
    f0=1.0d0;f1=1.0d0
    do i=1,8
      nxt=f0+f1*x*0.1d0;f0=f1;f1=nxt
    end do
    compute_fibonacci_matrix_14443=f1
  end function compute_fibonacci_matrix_14443
end module fibonacci_matrix_14443_mod
