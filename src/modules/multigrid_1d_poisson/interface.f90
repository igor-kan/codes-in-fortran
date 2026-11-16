module m_mg_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function rhs_fn_iface(x) result(f)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: f
        end function rhs_fn_iface
    end interface
end module m_mg_ifc
