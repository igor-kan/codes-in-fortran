module m_lag_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: gl_rule_t
        integer :: order = 0
        real(dp), allocatable :: x(:)
        real(dp), allocatable :: w(:)
    end type gl_rule_t
end module m_lag_types
