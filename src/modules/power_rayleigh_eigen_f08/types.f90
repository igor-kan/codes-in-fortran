module m_poweig_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: poweig_t
        real(dp) :: lambda = 0.0_dp
        real(dp) :: vec(3) = 0.0_dp
    end type poweig_t
end module m_poweig_types
