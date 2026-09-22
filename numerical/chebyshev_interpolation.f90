module chebyshev_interpolation_mod
  implicit none
  private
  public :: chebyshev_nodes, chebyshev_eval, runge
contains
  real(8) function runge(x)
    real(8), intent(in) :: x
    runge = 1.0d0 / (1.0d0 + 25.0d0 * x * x)
  end function runge

  subroutine chebyshev_nodes(n, nodes)
    integer, intent(in) :: n
    real(8), intent(out) :: nodes(n)
    integer :: k
    real(8), parameter :: pi = 3.141592653589793d0
    do k = 1, n
      nodes(k) = cos(pi * (2.0d0 * real(k, 8) - 1.0d0) / (2.0d0 * real(n, 8)))
    end do
  end subroutine chebyshev_nodes

  real(8) function chebyshev_eval(nodes, values, n, x) result(s)
    integer, intent(in) :: n
    real(8), intent(in) :: nodes(n), values(n), x
    real(8) :: num, den
    integer :: i, j
    s = 0.0d0
    do i = 1, n
      num = 1.0d0
      den = 1.0d0
      do j = 1, n
        if (j /= i) then
          num = num * (x - nodes(j))
          den = den * (nodes(i) - nodes(j))
        end if
      end do
      s = s + values(i) * num / den
    end do
  end function chebyshev_eval
end module chebyshev_interpolation_mod
