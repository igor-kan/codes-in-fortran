module m_lag_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function fn_1d(x) result(y)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: y
        end function fn_1d
    end interface
end module m_lag_ifc
