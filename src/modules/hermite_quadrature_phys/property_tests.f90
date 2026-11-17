program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    use m_gh_core
    use m_gh_conc
    implicit none
    type(gh_rule_t) :: r
    real(dp) :: evens(2)
    integer :: st
    call build_gauss_hermite(6, r, st)
    call batch_even_moments(r, 2, evens)
    if (abs(evens(2) - 0.75_dp * 1.7724538509055160273_dp) > 1.0e-11_dp) error stop '4th moment bad'
end program test_props
