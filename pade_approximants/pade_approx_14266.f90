module pade_approx_14266_mod
  implicit none
contains
  real(8) function compute_pade_approx_14266(x)
    real(8),intent(in)::x
    compute_pade_approx_14266=(1.0d0+x*2.0d0)/(1.0d0+x*x*1.0d0)
  end function compute_pade_approx_14266
end module pade_approx_14266_mod
