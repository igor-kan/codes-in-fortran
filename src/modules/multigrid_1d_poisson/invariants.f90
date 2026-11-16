module m_mg_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_mg_fast
    implicit none
contains
    function verify_mg_accuracy(n, h, pi, u, f) result(ok)
        integer, intent(in) :: n
        real(dp), intent(in) :: h, pi, u(0:n), f(0:n)
        logical :: ok
        real(dp) :: err
        integer :: i
        err = 0.0_dp
        do i = 0, n
            err = max(err, abs(u(i) - sin(pi * real(i, dp) * h)))
        end do
        ok = (residual_l2_1d(n, h, u, f) < 1.0e-8_dp .and. err < 2.0_dp * h * h)
    end function verify_mg_accuracy
end module m_mg_inv
