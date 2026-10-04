module spherical_harm_1119_mod
  implicit none
contains
  real(8) function compute_spherical_harm_1119(x)
    real(8), intent(in) :: x
    compute_spherical_harm_1119 = (x ** 5) / 10.0d0
  end function
end module

program test_spherical_harm_1119
  use spherical_harm_1119_mod
  implicit none
  real(8) :: res
  res = compute_spherical_harm_1119(0.5d0)
  if (res /= res) stop 1
end program
