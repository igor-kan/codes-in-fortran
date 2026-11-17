module m_gh_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    implicit none
contains
    subroutine check_gh_sum(rule)
        type(gh_rule_t), intent(in) :: rule
        real(dp), parameter :: sqpi = 1.7724538509055160273_dp
        if (abs(sum(rule%w) - sqpi) > 1.0e-12_dp) error stop 'GH weights /= sqrt(pi)'
    end subroutine check_gh_sum
end module m_gh_inv
