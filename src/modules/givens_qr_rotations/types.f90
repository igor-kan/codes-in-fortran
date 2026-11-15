module m_gqr_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: qr_status_t
        integer :: status = 0
        real(dp) :: min_diag = 0.0_dp
    end type qr_status_t
end module m_gqr_types
