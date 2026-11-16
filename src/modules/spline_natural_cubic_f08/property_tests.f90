program test_spl_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_err
    use m_spl_core
    use m_spl_conc
    implicit none
    integer, parameter :: n = 9, m = 5
    real(dp) :: x(n), y(n), b(n), c(n), d(n), xq(m), yq(m)
    integer :: i, code
    do i = 1, n
        x(i) = real(i, dp)
        y(i) = 3.0_dp * x(i) - 7.0_dp
    end do
    call fit_natural_spline(n, x, y, b, c, d, code)
    if (code /= ERR_OK) stop 1
    xq = [1.5_dp, 3.2_dp, 5.7_dp, 7.1_dp, 8.9_dp]
    call batch_eval_spline(n, x, y, b, c, d, m, xq, yq)
    do i = 1, m
        if (abs(yq(i) - (3.0_dp * xq(i) - 7.0_dp)) > 1.0e-11_dp) stop 2
    end do
end program test_spl_prop
