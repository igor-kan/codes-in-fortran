module m_ldlt_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: ldlt_inertia_t
        integer :: pos = 0
        integer :: neg = 0
        integer :: status = 0
    end type ldlt_inertia_t
end module m_ldlt_types
