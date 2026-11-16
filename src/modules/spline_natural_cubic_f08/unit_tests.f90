program test_spl_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_err
    use m_spl_core
    use m_spl_val
    use m_spl_inv
    implicit none
    integer, parameter :: n = 6
    real(dp) :: x(n), y(n), b(n), c(n), d(n), v
    integer :: i, code
    do i = 1, n
        x(i) = real(i - 1, dp) * 0.4_dp
        y(i) = 2.5_dp * x(i) + sin(x(i))
    end do
    if (validate_knots(n, x) /= ERR_OK) stop 1
    call fit_natural_spline(n, x, y, b, c, d, code)
    if (code /= ERR_OK) stop 2
    if (.not. verify_c2_continuity(n, x, y, b, c, d, 1.0e-11_dp)) stop 3
    v = eval_natural_spline(n, x, y, b, c, d, 1.0_dp)
    if (abs(v - (2.5_dp + sin(1.0_dp))) > 1.0e-3_dp) stop 4
end program test_spl_unit
