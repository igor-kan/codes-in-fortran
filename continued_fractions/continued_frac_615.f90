module continued_frac_615_mod
  implicit none
contains
  real(8) function compute_continued_frac_615(x)
    real(8), intent(in) :: x
    real(8) :: a
    integer :: k
    a = 1.0d0
    do k = 4, 1, -1
      a = dble(k) + x / (merge(a, 1.0d0, a /= 0.0d0))
    end do
    compute_continued_frac_615 = a
  end function
end module

program test_continued_frac_615
  use continued_frac_615_mod
  implicit none
  real(8) :: res
  res = compute_continued_frac_615(0.5d0)
  if (res /= res) stop 1
end program
