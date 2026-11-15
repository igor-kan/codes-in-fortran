program test_akm_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    use m_akm_core
    use m_akm_fast
    use m_akm_conc
    implicit none
    integer, parameter :: n = 8, m = 5
    real(dp) :: x(n), y(n), xq(m), yq(m), dl, dr
    type(akima_seg_t) :: segs(n - 1)
    integer :: i, st

    do i = 1, n
        x(i) = real(i - 1, dp)
        y(i) = merge(0.0_dp, 1.0_dp, i <= 4)
    end do
    call fit_akima_spline(n, x, y, segs, st)
    if (st /= 0) stop 1
    xq = [0.5_dp, 1.5_dp, 2.5_dp, 4.5_dp, 5.5_dp]
    call batch_eval_akima(n, segs, m, xq, yq)
    if (abs(yq(1)) > 1.0e-13_dp) stop 2
    dl = eval_akima_deriv(n, segs, 3.0_dp - 1.0e-9_dp)
    dr = eval_akima_deriv(n, segs, 3.0_dp + 1.0e-9_dp)
    if (abs(dl - dr) > 1.0e-6_dp) stop 3
end program test_akm_prop
