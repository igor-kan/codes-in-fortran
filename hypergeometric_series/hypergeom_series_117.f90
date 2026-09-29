module hypergeom_series_117_mod
  implicit none
contains
  real(8) function compute_hypergeom_series_117(x)
    real(8), intent(in) :: x
    compute_hypergeom_series_117 = (x ** 1) / 1.0d0
  end function
end module

program test_hypergeom_series_117
  use hypergeom_series_117_mod
  implicit none
  real(8) :: res
  res = compute_hypergeom_series_117(0.5d0)
  if (res /= res) stop 1
end program
