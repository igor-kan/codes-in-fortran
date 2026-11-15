module m_ccq_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: quad_rule_t
        integer :: order_n = 0
        real(dp) :: a = -1.0_dp
        real(dp) :: b = 1.0_dp
    end type quad_rule_t
end module m_ccq_types
