module m_gmr_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gmr_types
    implicit none
    abstract interface
        subroutine gmres_solve_iface(n, a, b, cfg, x, rep)
            import :: dp, gmres_config_t, gmres_report_t
            integer, intent(in) :: n
            real(dp), intent(in) :: a(n, n), b(n)
            type(gmres_config_t), intent(in) :: cfg
            real(dp), intent(inout) :: x(n)
            type(gmres_report_t), intent(out) :: rep
        end subroutine gmres_solve_iface
    end interface
end module m_gmr_ifc
