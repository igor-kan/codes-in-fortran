module m_rk4_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function scalar_fn(x) result(y)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: y
        end function scalar_fn
    end interface
end module m_rk4_ifc
