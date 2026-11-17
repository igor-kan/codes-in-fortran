module m_s2d_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function fn_2d(x, y) result(v)
            import :: dp
            real(dp), intent(in) :: x, y
            real(dp) :: v
        end function fn_2d
    end interface
end module m_s2d_ifc
