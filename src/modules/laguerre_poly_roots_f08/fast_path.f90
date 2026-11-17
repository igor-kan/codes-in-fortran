module m_lag_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    implicit none
contains
    pure function integrate_lag_poly(rule, deg) result(val)
        type(gl_rule_t), intent(in) :: rule
        integer, intent(in) :: deg
        real(dp) :: val
        val = sum(rule%w * (rule%x ** deg))
    end function integrate_lag_poly
end module m_lag_fast
