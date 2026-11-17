module m_gh_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: gh_rule_t
        integer :: n = 0
        real(dp), allocatable :: x(:)
        real(dp), allocatable :: w(:)
    end type gh_rule_t
end module m_gh_types
