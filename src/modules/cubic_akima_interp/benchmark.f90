program bench_akm
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_akm_types
    use m_akm_core
    implicit none
    integer, parameter :: n = 64
    real(dp) :: x(n), y(n), acc
    type(akima_seg_t) :: segs(n - 1)
    integer(int64) :: t0, t1, rate
    integer :: i, st

    do i = 1, n
        x(i) = real(i, dp) * 0.1_dp
        y(i) = sin(x(i))
    end do
    call fit_akima_spline(n, x, y, segs, st)
    acc = 0.0_dp
    call system_clock(t0, rate)
    do i = 1, 20000
        acc = acc + eval_akima(n, segs, 0.15_dp + 0.0002_dp * real(mod(i, 1000), dp))
    end do
    call system_clock(t1)
    if (abs(acc) < 1.0e-12_dp .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_akm
