module m_jcb_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_jcb_types
    implicit none
    abstract interface
        subroutine sym_eig_solver_iface(n, a_in, evals, evecs, cfg, rep)
            import :: dp, eigen_config_t, eigen_report_t
            integer, intent(in) :: n
            real(dp), intent(in) :: a_in(n, n)
            real(dp), intent(out) :: evals(n), evecs(n, n)
            type(eigen_config_t), intent(in) :: cfg
            type(eigen_report_t), intent(out) :: rep
        end subroutine sym_eig_solver_iface
    end interface
end module m_jcb_ifc
