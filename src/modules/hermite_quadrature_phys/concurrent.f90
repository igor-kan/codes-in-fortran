module m_gh_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    use m_gh_fast
    implicit none
contains
    subroutine batch_even_moments(rule, max_k, res)
        type(gh_rule_t), intent(in) :: rule
        integer, intent(in) :: max_k
        real(dp), intent(out) :: res(max_k)
        integer :: k
        do concurrent (k = 1:max_k)
            res(k) = gh_moment(rule, 2 * k)
        end do
    end subroutine batch_even_moments
end module m_gh_conc
