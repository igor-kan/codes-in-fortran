program test_fft_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fft_types
    use m_fft_err
    use m_fft_core
    use m_fft_fast
    use m_fft_conc
    implicit none
    integer, parameter :: n = 64
    complex(dp) :: buf(n), mat(n, 2)
    real(dp) :: pwr(n), pi
    type(fft_plan_t) :: pf
    integer :: i, st

    pi = 4.0_dp * atan(1.0_dp)
    do i = 1, n
        buf(i) = cmplx(cos(2.0_dp * pi * 5.0_dp * real(i - 1, dp) / real(n, dp)), 0.0_dp, kind=dp)
    end do
    call init_fft_plan(n, .false., pf, st)
    call fft_execute(pf, buf, st)
    call power_spectrum(n, buf, pwr)
    if (maxloc(pwr(1:n/2), dim=1) /= 6) stop 1
    mat(:, 1) = buf
    mat(:, 2) = buf
    call batch_twiddle_scale(n, 2, 0.5_dp, mat)
    if (abs(abs(mat(6, 2)) - 0.5_dp * abs(buf(6))) > 1.0e-12_dp) stop 2
end program test_fft_prop
