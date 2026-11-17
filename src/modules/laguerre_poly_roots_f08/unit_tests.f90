program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    use m_lag_core
    use m_lag_inv
    use m_lag_fast
    implicit none
    type(gl_rule_t) :: rule
    integer :: st
    call build_gauss_laguerre(5, rule, st)
    if (st /= 0) error stop 'build failed'
    call check_weight_sum(rule)
    ! int_0^inf x^3 exp(-x) dx = 3! = 6
    if (abs(integrate_lag_poly(rule, 3) - 6.0_dp) > 1.0e-11_dp) error stop 'moment 3 bad'
end program test_unit
