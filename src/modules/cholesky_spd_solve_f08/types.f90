module m_chol_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: chol_cfg_t
        integer :: n = 0
        integer :: status = 0
    end type chol_cfg_t
end module m_chol_types
