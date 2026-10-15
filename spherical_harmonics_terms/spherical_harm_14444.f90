module spherical_harm_14444_mod
  implicit none
contains
  real(8) function compute_spherical_harm_14444(x)
    real(8),intent(in)::x
    compute_spherical_harm_14444=(x**5)/dble(10)
  end function compute_spherical_harm_14444
end module spherical_harm_14444_mod
