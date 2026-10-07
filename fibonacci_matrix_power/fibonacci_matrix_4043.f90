module fibonacci_matrix_4043_mod
  implicit none
contains
  real(8) function compute_fibonacci_matrix_4043(x)
    real(8),intent(in)::x
    real(8)::f0,f1,nxt;integer::i
    f0=1.0d0;f1=1.0d0
    do i=1,12
      nxt=f0+f1*x*0.1d0;f0=f1;f1=nxt
    end do
    compute_fibonacci_matrix_4043=f1
  end function
end module
program test_fibonacci_matrix_4043
  use fibonacci_matrix_4043_mod
  implicit none
  real(8)::res
  res=compute_fibonacci_matrix_4043(0.5d0)
  if(res/=res) stop 1
end program
