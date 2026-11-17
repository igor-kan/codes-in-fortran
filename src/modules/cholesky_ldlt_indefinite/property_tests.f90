program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_types
    use m_ldlt_core
    use m_ldlt_conc
    implicit none
    integer, parameter :: n = 3
    real(dp) :: a(n, n), lmat(n, n), dvec(n), bm(n, 2), xm(n, 2)
    type(ldlt_inertia_t) :: inrt
    a = reshape([2.0_dp, -1.0_dp, 0.0_dp, -1.0_dp, -1.0_dp, 1.0_dp, 0.0_dp, 1.0_dp, 3.0_dp], [n, n])
    call ldlt_factor(n, a, lmat, dvec, inrt)
    if (inrt%pos /= 2 .or. inrt%neg /= 1) error stop 'indefinite inertia count wrong'
    bm(:, 1) = [1.0_dp, 0.0_dp, 2.0_dp]; bm(:, 2) = [3.0_dp, 1.0_dp, -1.0_dp]
    call multi_rhs_solve(n, lmat, dvec, 2, bm, xm)
    if (maxval(abs(matmul(a, xm) - bm)) > 1.0e-11_dp) error stop 'multi-RHS residual bad'
end program test_props
