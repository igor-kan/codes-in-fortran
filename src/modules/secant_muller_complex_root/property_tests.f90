module m_sec_prop_fns
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function g_cos(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = cos(x)
    end function g_cos
    pure function f_cos(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = cos(x) - x
    end function f_cos
end module m_sec_prop_fns
program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_fast
    use m_sec_conc
    use m_sec_prop_fns
    implicit none
    real(dp) :: x0s(2) = [0.2_dp, 1.0_dp], x1s(2) = [0.4_dp, 1.2_dp], rs(2), s
    call solve_guesses(f_cos, 2, x0s, x1s, rs)
    if (abs(rs(1) - rs(2)) > 1.0e-11_dp) error stop 'secant guesses diverged'
    s = steffensen_step(g_cos, 0.7_dp)
    if (abs(s - rs(1)) > 0.05_dp) error stop 'steffensen step inaccurate'
end program test_props
