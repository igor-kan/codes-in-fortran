program test_fft_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fft_types
    use m_fft_err
    use m_fft_core
    use m_fft_val
    use m_fft_inv
    implicit none
    integer, parameter :: n = 8
    complex(dp) :: orig(n), buf(n)
    type(fft_plan_t) :: pf, pi_plan
    real(dp) :: e_time, e_freq
    integer :: i, st

    do i = 1, n
        orig(i) = cmplx(cos(0.5_dp * real(i, dp)), sin(0.25_dp * real(i, dp)), kind=dp)
    end do
    buf = orig
    if (validate_fft_input(n, buf) /= ERR_OK) stop 1
    call init_fft_plan(n, .false., pf, st)
    if (st /= ERR_OK) stop 2
    call init_fft_plan(n, .true., pi_plan, st)
    e_time = signal_energy(n, orig)
    call fft_execute(pf, buf, st)
    e_freq = signal_energy(n, buf) / real(n, dp)
    if (abs(e_time - e_freq) > 1.0e-11_dp) stop 3
    call fft_execute(pi_plan, buf, st)
    if (maxval(abs(buf - orig)) > 1.0e-12_dp) stop 4
end program test_fft_unit
