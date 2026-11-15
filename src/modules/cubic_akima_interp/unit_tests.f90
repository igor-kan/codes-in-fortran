program test_akm_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    use m_akm_err
    use m_akm_core
    use m_akm_val
    use m_akm_inv
    implicit none
    integer, parameter :: n = 6
    real(dp) :: x(n), y(n), ymid
    type(akima_seg_t) :: segs(n - 1)
    integer :: i, st

    do i = 1, n
        x(i) = real(i - 1, dp) * 0.5_dp
        y(i) = 2.0_dp * x(i) + 1.0_dp
    end do
    if (validate_strict_grid(n, x) /= ERR_OK) stop 1
    call fit_akima_spline(n, x, y, segs, st)
    if (st /= ERR_OK) stop 2
    if (max_knot_error(n, x, y, segs) > 1.0e-13_dp) stop 3
    ymid = eval_akima(n, segs, 1.25_dp)
    if (abs(ymid - 3.5_dp) > 1.0e-13_dp) stop 4
end program test_akm_unit
