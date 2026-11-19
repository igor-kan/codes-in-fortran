module m_bary_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: bary_grid_t
        integer :: n = 0
        real(dp) :: x(4) = 0.0_dp
    end type bary_grid_t
end module m_bary_types
