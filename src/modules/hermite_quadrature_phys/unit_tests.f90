program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    use m_gh_core
    use m_gh_inv
    use m_gh_fast
    implicit none
    type(gh_rule_t) :: r
    integer :: st
    call build_gauss_hermite(5, r, st)
    if (st /= 0) error stop 'build failed'
    call check_gh_sum(r)
    ! int x^2 exp(-x^2) dx = 0.5 * sqrt(pi)
    if (abs(gh_moment(r, 2) - 0.886226925452758_dp) > 1.0e-12_dp) error stop 'second moment bad'
end program test_unit
