module m_spl_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function eval_1d_iface(x) result(y)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: y
        end function eval_1d_iface
    end interface
end module m_spl_ifc
