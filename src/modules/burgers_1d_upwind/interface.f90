module m_brg_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_brg_types
    implicit none
    abstract interface
        subroutine burgers_step_iface(n, p, u, status)
            import :: dp, burgers_params_t
            integer, intent(in) :: n
            type(burgers_params_t), intent(in) :: p
            real(dp), intent(inout) :: u(n)
            integer, intent(out) :: status
        end subroutine burgers_step_iface
    end interface
end module m_brg_ifc
