module pade_approx_14256_mod
  implicit none
contains
  real(8) function compute_pade_approx_14256(x)
    real(8),intent(in)::x
    compute_pade_approx_14256=(1.0d0+x*1.0d0)/(1.0d0+x*x*1.0d0)
  end function compute_pade_approx_14256
end module pade_approx_14256_mod
