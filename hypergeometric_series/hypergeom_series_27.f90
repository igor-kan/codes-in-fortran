module hypergeom_series_27_mod
  implicit none
contains
  real(8) function compute_hypergeom_series_27(x)
    real(8), intent(in) :: x
    compute_hypergeom_series_27 = (x ** 3) / 1.0d0
  end function
end module

program test_hypergeom_series_27
  use hypergeom_series_27_mod
  implicit none
  real(8) :: res
  res = compute_hypergeom_series_27(0.5d0)
  if (res /= res) stop 1
end program
