program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_htd_types
    use m_htd_core
    use m_htd_inv
    implicit none
    integer, parameter :: n = 4
    real(dp) :: a(n, n), d(n), e(n - 1)
    type(tridiag_rep_t) :: rep
    a = reshape([4.0_dp, 1.0_dp, -2.0_dp, 2.0_dp, &
                 1.0_dp, 2.0_dp, 0.0_dp, 1.0_dp, &
                -2.0_dp, 0.0_dp, 3.0_dp, -2.0_dp, &
                 2.0_dp, 1.0_dp, -2.0_dp, -1.0_dp], [n, n])
    call tridiag_householder(n, a, d, e, rep)
    call check_trace_conserved(rep%trace_diff)
    if (abs(a(3, 1)) > 1.0e-11_dp .or. abs(a(4, 1)) > 1.0e-11_dp) error stop 'off-tridiag non-zero'
end program test_unit
