module m_chol_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: spd_dim
        integer :: order = 3
    end type spd_dim
end module m_chol_types
