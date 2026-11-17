module m_lag_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    use m_lag_fast
    implicit none
contains
    subroutine batch_moments(rule, max_deg, out_vals)
        type(gl_rule_t), intent(in) :: rule
        integer, intent(in) :: max_deg
        real(dp), intent(out) :: out_vals(0:max_deg)
        integer :: d
        do concurrent (d = 0:max_deg)
            out_vals(d) = integrate_lag_poly(rule, d)
        end do
    end subroutine batch_moments
end module m_lag_conc
