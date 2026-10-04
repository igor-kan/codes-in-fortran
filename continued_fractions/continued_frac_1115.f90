module continued_frac_1115_mod
  implicit none
contains
  real(8) function compute_continued_frac_1115(x)
    real(8), intent(in) :: x
    real(8) :: a
    integer :: k
    a = 1.0d0
    do k = 6, 1, -1
      a = dble(k) + x / (merge(a, 1.0d0, a /= 0.0d0))
    end do
    compute_continued_frac_1115 = a
  end function
end module

program test_continued_frac_1115
  use continued_frac_1115_mod
  implicit none
  real(8) :: res
  res = compute_continued_frac_1115(0.5d0)
  if (res /= res) stop 1
end program
