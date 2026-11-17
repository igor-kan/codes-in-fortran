module m_sec_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function fn_scalar(x) result(y)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: y
        end function fn_scalar
    end interface
end module m_sec_ifc
