module m_cgf_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        subroutine matvec_iface(n, x, y)
            import :: dp
            integer, intent(in) :: n
            real(dp), intent(in) :: x(n)
            real(dp), intent(out) :: y(n)
        end subroutine matvec_iface
    end interface
end module m_cgf_ifc
