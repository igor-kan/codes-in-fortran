program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    use m_lag_core
    use m_lag_conc
    implicit none
    type(gl_rule_t) :: rule
    real(dp) :: moms(0:4)
    integer :: st
    call build_gauss_laguerre(6, rule, st)
    call batch_moments(rule, 4, moms)
    if (abs(moms(4) - 24.0_dp) > 1.0e-10_dp) error stop '4! moment mismatch'
end program test_props
