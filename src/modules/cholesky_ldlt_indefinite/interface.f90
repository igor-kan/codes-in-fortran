module m_ldlt_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        subroutine factor_iface(n, a, d)
            import :: dp
            integer, intent(in) :: n
            real(dp), intent(inout) :: a(n, n)
            real(dp), intent(out) :: d(n)
        end subroutine factor_iface
    end interface
end module m_ldlt_ifc
