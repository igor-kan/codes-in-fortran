module m_fh_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: fh_interp_t
        integer :: n = 0
        real(dp) :: w(32) = 0.0_dp
    end type fh_interp_t
end module m_fh_types
