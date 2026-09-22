module continued_fraction_mod
  implicit none
  private
  public :: cf_eval, golden_ratio_cf
contains
  real(8) function cf_eval(a, n) result(v)
    integer, intent(in) :: n
    real(8), intent(in) :: a(n)
    integer :: i
    v = a(n)
    do i = n - 1, 1, -1
      v = a(i) + 1.0d0 / v
    end do
  end function cf_eval

  real(8) function golden_ratio_cf(n) result(v)
    integer, intent(in) :: n
    real(8) :: a(n)
    a = 1.0d0
    a(1) = 0.0d0
    v = cf_eval(a, n)
  end function golden_ratio_cf
end module continued_fraction_mod
