program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_types
    use m_ldlt_core
    use m_ldlt_inv
    implicit none
    integer, parameter :: n = 3
    real(dp) :: a(n, n), lmat(n, n), dvec(n), b(n), x(n)
    type(ldlt_inertia_t) :: inrt
    a = reshape([4.0_dp, 12.0_dp, -16.0_dp, &
                12.0_dp, 37.0_dp, -43.0_dp, &
               -16.0_dp,-43.0_dp,  98.0_dp], [n, n])
    b = [1.0_dp, 2.0_dp, 3.0_dp]
    call ldlt_factor(n, a, lmat, dvec, inrt)
    if (inrt%status /= 0 .or. inrt%pos /= 3) error stop 'inertia wrong'
    call verify_ldlt(n, a, lmat, dvec)
    call ldlt_solve(n, lmat, dvec, b, x)
    if (maxval(abs(matmul(a, x) - b)) > 1.0e-10_dp) error stop 'solve residual bad'
end program test_unit
