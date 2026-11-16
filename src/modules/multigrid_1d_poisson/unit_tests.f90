program test_mg_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_mg_err
    use m_mg_core
    use m_mg_val
    use m_mg_conc
    use m_mg_inv
    implicit none
    integer, parameter :: n = 64
    real(dp), parameter :: pi = acos(-1.0_dp)
    real(dp) :: u(0:n), f(0:n), h
    integer :: cyc
    if (validate_dyadic_grid(n) /= ERR_OK) stop 1
    h = 1.0_dp / real(n, dp)
    u = 0.0_dp
    call compute_manufactured_rhs(n, h, pi, f)
    do cyc = 1, 15
        call vcycle_1d(n, h, u, f)
    end do
    if (.not. verify_mg_accuracy(n, h, pi, u, f)) stop 2
end program test_mg_unit
