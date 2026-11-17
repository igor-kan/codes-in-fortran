module m_s2d_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: box2d_t
        real(dp) :: ax, bx, ay, by
        integer :: nx, ny
    end type box2d_t
end module m_s2d_types
