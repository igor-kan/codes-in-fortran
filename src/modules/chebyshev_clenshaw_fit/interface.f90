module m_ch_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function scalar_1d(x) result(y)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: y
        end function scalar_1d
    end interface
end module m_ch_ifc
