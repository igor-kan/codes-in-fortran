program bench_fft
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_fft_types
    use m_fft_core
    implicit none
    integer, parameter :: n = 1024
    complex(dp) :: buf(n)
    type(fft_plan_t) :: pf
    integer(int64) :: t0, t1, rate
    integer :: i, st

    do i = 1, n
        buf(i) = cmplx(real(i, dp) * 0.01_dp, 0.0_dp, kind=dp)
    end do
    call init_fft_plan(n, .false., pf, st)
    call system_clock(t0, rate)
    call fft_execute(pf, buf, st)
    call system_clock(t1)
    if (st /= 0 .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_fft
