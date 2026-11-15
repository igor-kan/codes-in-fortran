program test_jacobi_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_jcb_types
    use m_jcb_err
    use m_jcb_core
    use m_jcb_val
    use m_jcb_fast
    use m_jcb_inv
    implicit none
    integer, parameter :: n = 3
    real(dp) :: a(n, n), evals(n), evecs(n, n), tr_a, tr_l
    type(eigen_config_t) :: cfg
    type(eigen_report_t) :: rep

    a = reshape([4.0_dp, 1.0_dp, 0.0_dp, &
                 1.0_dp, 3.0_dp, 1.0_dp, &
                 0.0_dp, 1.0_dp, 2.0_dp], [n, n])
    if (validate_sym_matrix(n, a) /= ERR_OK) stop 1
    call jacobi_eigen_solve(n, a, evals, evecs, cfg, rep)
    if (rep%status /= ERR_OK) stop 2
    call sort_eigenpairs_desc(n, evals, evecs)
    if (eigen_residual(n, a, evals, evecs) > 1.0e-10_dp) stop 3
    if (orthogonality_error(n, evecs) > 1.0e-11_dp) stop 4
    tr_a = a(1, 1) + a(2, 2) + a(3, 3)
    tr_l = sum(evals)
    if (abs(tr_a - tr_l) > 1.0e-11_dp) stop 5
end program test_jacobi_unit
