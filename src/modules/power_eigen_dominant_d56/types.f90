module m_poweig_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: eigen_spec
        integer :: max_iter = 40
    end type eigen_spec
end module m_poweig_types
