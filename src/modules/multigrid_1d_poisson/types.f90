module m_mg_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: mg_stats_t
        integer :: vcycles = 0
        real(dp) :: residual_norm = 0.0_dp
    end type mg_stats_t
end module m_mg_types
