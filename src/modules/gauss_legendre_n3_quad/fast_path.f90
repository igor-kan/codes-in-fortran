module m_gl3_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function fast_l2_sq(v) result(s)
        real(dp), intent(in) :: v(:)
        real(dp) :: s
        s = sum(v * v)
    end function fast_l2_sq
end module m_gl3_fast
