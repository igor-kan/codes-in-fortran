program test_cgf_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_cgf_types
    use m_cgf_err
    use m_cgf_core
    use m_cgf_val
    use m_cgf_inv
    implicit none
    integer, parameter :: n = 4
    real(dp) :: a(n, n), b(n), x(n)
    type(cg_config_t) :: cfg
    type(cg_report_t) :: rep
    integer :: i
    a = 0.0_dp
    do i = 1, n
        a(i, i) = 4.0_dp + 0.5_dp * real(i, dp)
        if (i > 1) a(i, i - 1) = -1.0_dp
        if (i < n) a(i, i + 1) = -1.0_dp
        b(i) = real(i * i, dp)
        x(i) = 0.0_dp
    end do
    if (validate_spd_inputs(n, a, b) /= ERR_OK) stop 1
    call pcg_dense_solve(n, a, b, x, cfg, rep)
    if (rep%status /= ERR_OK) stop 2
    if (.not. check_cg_solution(n, a, x, b, 1.0e-10_dp)) stop 3
end program test_cgf_unit
