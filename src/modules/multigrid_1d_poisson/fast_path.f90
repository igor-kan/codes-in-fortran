module m_mg_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function residual_l2_1d(n, h, u, f) result(rn)
        integer, intent(in) :: n
        real(dp), intent(in) :: h, u(0:n), f(0:n)
        real(dp) :: rn, r, invh2
        integer :: i
        invh2 = 1.0_dp / (h * h)
        rn = 0.0_dp
        do i = 1, n - 1
            r = f(i) - (-u(i - 1) + 2.0_dp * u(i) - u(i + 1)) * invh2
            rn = rn + r * r
        end do
        rn = sqrt(rn / real(n, dp))
    end function residual_l2_1d
end module m_mg_fast
