module chebyshev_colloc_14207_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_14207(x)
    real(8),intent(in)::x
    compute_chebyshev_colloc_14207=cos(3.14159265358979d0*7.0d0/8.0d0)*x
  end function compute_chebyshev_colloc_14207
end module chebyshev_colloc_14207_mod
