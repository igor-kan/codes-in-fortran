module chebyshev_colloc_5067_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_5067(x)
    real(8),intent(in)::x
    compute_chebyshev_colloc_5067=cos(3.14159265358979d0*7.0d0/8.0d0)*x
  end function
end module
program test_chebyshev_colloc_5067
  use chebyshev_colloc_5067_mod
  implicit none
  real(8)::res
  res=compute_chebyshev_colloc_5067(0.5d0)
  if(res/=res) stop 1
end program
