program bench_gqr
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_gqr_types
    use m_gqr_core
    implicit none
    integer, parameter :: m = 48, n = 16
    real(dp) :: a(m, n), q(m, m), r(m, n)
    type(qr_status_t) :: st
    integer(int64) :: t0, t1, rate
    integer :: i, j

    do j = 1, n
        do i = 1, m
            a(i, j) = sin(real(i * j, dp) * 0.1_dp)
        end do
        a(j, j) = a(j, j) + 5.0_dp
    end do
    call system_clock(t0, rate)
    call givens_qr_factor(m, n, a, q, r, st)
    call system_clock(t1)
    if (st%min_diag < 0.0_dp .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_gqr
