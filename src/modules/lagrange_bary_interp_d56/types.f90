module m_bary_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: interp_meta
        integer :: degree = 2
    end type interp_meta
end module m_bary_types
