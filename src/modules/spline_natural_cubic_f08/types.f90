module m_spl_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: cubic_spline_t
        integer :: n = 0
    end type cubic_spline_t
end module m_spl_types
