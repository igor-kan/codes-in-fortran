module chebyshev_colloc_5042_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_5042(x)
    real(8),intent(in)::x
    compute_chebyshev_colloc_5042=cos(3.14159265358979d0*2.0d0/3.0d0)*x
  end function
end module
program test_chebyshev_colloc_5042
  use chebyshev_colloc_5042_mod
  implicit none
  real(8)::res
  res=compute_chebyshev_colloc_5042(0.5d0)
  if(res/=res) stop 1
end program
