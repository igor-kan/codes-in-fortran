module m_ms4_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: ms4_stat_t
        real(dp) :: y_end = 0.0_dp
    end type ms4_stat_t
end module m_ms4_types
