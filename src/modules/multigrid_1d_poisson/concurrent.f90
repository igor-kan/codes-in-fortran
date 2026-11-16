module m_mg_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine compute_manufactured_rhs(n, h, pi, f)
        integer, intent(in) :: n
        real(dp), intent(in) :: h, pi
        real(dp), intent(out) :: f(0:n)
        integer :: i
        do concurrent (i = 0:n)
            f(i) = pi * pi * sin(pi * real(i, dp) * h)
        end do
    end subroutine compute_manufactured_rhs
end module m_mg_conc
