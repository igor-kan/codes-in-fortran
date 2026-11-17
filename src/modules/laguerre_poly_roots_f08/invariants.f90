module m_lag_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    implicit none
contains
    subroutine check_weight_sum(rule)
        type(gl_rule_t), intent(in) :: rule
        if (abs(sum(rule%w) - 1.0_dp) > 1.0e-12_dp) error stop 'weight sum /= 1'
    end subroutine check_weight_sum
end module m_lag_inv
