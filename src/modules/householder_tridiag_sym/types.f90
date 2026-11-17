module m_htd_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: tridiag_rep_t
        integer :: status = 0
        real(dp) :: trace_diff = 0.0_dp
    end type tridiag_rep_t
end module m_htd_types
