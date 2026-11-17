module m_gh_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    implicit none
contains
    pure function gh_moment(rule, p) result(acc)
        type(gh_rule_t), intent(in) :: rule
        integer, intent(in) :: p
        real(dp) :: acc
        acc = sum(rule%w * (rule%x ** p))
    end function gh_moment
end module m_gh_fast
