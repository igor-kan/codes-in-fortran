module dormand_prince_mod
  implicit none
  private
  public :: dormand_prince_step, ode_rhs
contains
  subroutine ode_rhs(t, y, dydt)
    real(8), intent(in) :: t, y
    real(8), intent(out) :: dydt
    dydt = -2.0d0 * y + sin(t)
  end subroutine ode_rhs

  subroutine dormand_prince_step(t, y, h, ynew)
    real(8), intent(in) :: t, y, h
    real(8), intent(out) :: ynew
    real(8) :: k1, k2, k3, k4, k5, k6, k7
    call ode_rhs(t, y, k1)
    call ode_rhs(t + h / 5.0d0, y + h * k1 / 5.0d0, k2)
    call ode_rhs(t + 3.0d0 * h / 10.0d0, y + h * (3.0d0 * k1 / 40.0d0 + 9.0d0 * k2 / 40.0d0), k3)
    call ode_rhs(t + 4.0d0 * h / 5.0d0, &
                 y + h * (44.0d0 * k1 / 45.0d0 - 56.0d0 * k2 / 15.0d0 + 32.0d0 * k3 / 9.0d0), k4)
    call ode_rhs(t + 8.0d0 * h / 9.0d0, &
                 y + h * (19372.0d0 * k1 / 6561.0d0 - 25360.0d0 * k2 / 2187.0d0 + &
                          64448.0d0 * k3 / 6561.0d0 - 212.0d0 * k4 / 729.0d0), k5)
    call ode_rhs(t + h, &
                 y + h * (9017.0d0 * k1 / 3168.0d0 - 355.0d0 * k2 / 33.0d0 + &
                          46732.0d0 * k3 / 5247.0d0 + 49.0d0 * k4 / 176.0d0 - 5103.0d0 * k5 / 18656.0d0), k6)
    call ode_rhs(t + h, &
                 y + h * (35.0d0 * k1 / 384.0d0 + 500.0d0 * k3 / 1113.0d0 + &
                          125.0d0 * k4 / 192.0d0 - 2187.0d0 * k5 / 6784.0d0 + 11.0d0 * k6 / 84.0d0), k7)
    ynew = y + h * (35.0d0 * k1 / 384.0d0 + 500.0d0 * k3 / 1113.0d0 + &
                    125.0d0 * k4 / 192.0d0 - 2187.0d0 * k5 / 6784.0d0 + 11.0d0 * k6 / 84.0d0)
  end subroutine dormand_prince_step
end module dormand_prince_mod
