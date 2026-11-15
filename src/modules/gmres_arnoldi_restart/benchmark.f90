program bench_gmr
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_gmr_types
    use m_gmr_core
    implicit none
    integer, parameter :: n = 32
    real(dp) :: a(n, n), b(n), x(n)
    type(gmres_config_t) :: cfg
    type(gmres_report_t) :: rep
    integer(int64) :: t0, t1, rate
    integer :: i

    a = 0.0_dp
    do i = 1, n
        a(i, i) = 6.0_dp
        if (i > 1) a(i - 1, i) = -1.0_dp
        if (i < n) a(i + 1, i) = 0.7_dp
        b(i) = 1.0_dp
    end do
    x = 0.0_dp
    call system_clock(t0, rate)
    call gmres_solve(n, a, b, cfg, x, rep)
    call system_clock(t1)
    if (rep%total_iters <= 0 .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_gmr
