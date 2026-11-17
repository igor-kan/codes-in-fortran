module m_ab4_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ab4_types
    use m_ab4_ifc
    use m_ab4_core
    implicit none
contains
    subroutine sweep_initial_values(f, cfg, m, y0s, y_finals)
        procedure(ode_rhs) :: f
        type(ab4_cfg_t), intent(in) :: cfg
        integer, intent(in) :: m
        real(dp), intent(in) :: y0s(m)
        real(dp), intent(out) :: y_finals(m)
        real(dp) :: th(0:cfg%steps), yh(0:cfg%steps)
        integer :: i, st
        do i = 1, m
            call integrate_ab4(f, cfg, y0s(i), th, yh, st)
            y_finals(i) = yh(cfg%steps)
        end do
    end subroutine sweep_initial_values
end module m_ab4_conc
