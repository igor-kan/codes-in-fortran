module m_gqr_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gqr_types
    implicit none
    abstract interface
        subroutine qr_factor_iface(m, n, a, q, r, st)
            import :: dp, qr_status_t
            integer, intent(in) :: m, n
            real(dp), intent(in) :: a(m, n)
            real(dp), intent(out) :: q(m, m), r(m, n)
            type(qr_status_t), intent(out) :: st
        end subroutine qr_factor_iface
    end interface
end module m_gqr_ifc
