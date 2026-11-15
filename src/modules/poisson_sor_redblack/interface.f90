module m_sor_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sor_types
    implicit none
    abstract interface
        subroutine poisson_solver_iface(nx, ny, h, rhs, cfg, u, rep)
            import :: dp, sor_config_t, sor_report_t
            integer, intent(in) :: nx, ny
            real(dp), intent(in) :: h, rhs(nx, ny)
            type(sor_config_t), intent(in) :: cfg
            real(dp), intent(inout) :: u(nx, ny)
            type(sor_report_t), intent(out) :: rep
        end subroutine poisson_solver_iface
    end interface
end module m_sor_ifc
