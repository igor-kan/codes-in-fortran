module m_hhqr_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: reflector_stats
        real(dp) :: norm_val = 0.0_dp
    end type reflector_stats
end module m_hhqr_types
