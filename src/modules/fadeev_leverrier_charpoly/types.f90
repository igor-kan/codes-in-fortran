module m_flv_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: charpoly3_t
        real(dp) :: c(0:3) = 0.0_dp
    end type charpoly3_t
end module m_flv_types
