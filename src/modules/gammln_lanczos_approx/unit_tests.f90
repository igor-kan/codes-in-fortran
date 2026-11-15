program test_gma_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_types
    use m_gma_err
    use m_gma_core
    use m_gma_val
    use m_gma_fast
    use m_gma_inv
    implicit none
    real(dp) :: pi, fact5, binom10_3
    type(beta_eval_t) :: res

    pi = 4.0_dp * atan(1.0_dp)
    if (abs(exp(log_gamma_lanczos(0.5_dp)) - sqrt(pi)) > 1.0e-13_dp) stop 1
    fact5 = exp(log_gamma_lanczos(6.0_dp))
    if (abs(fact5 - 120.0_dp) > 1.0e-11_dp) stop 2
    binom10_3 = exp(log_binomial(10, 3))
    if (abs(binom10_3 - 120.0_dp) > 1.0e-10_dp) stop 3
    if (validate_beta_args(2.5_dp, 3.5_dp, 0.4_dp) /= ERR_OK) stop 4
    res = reg_incomplete_beta(1.0_dp, 1.0_dp, 0.37_dp)
    if (res%status /= ERR_OK .or. abs(res%value - 0.37_dp) > 1.0e-13_dp) stop 5
    if (beta_symmetry_error(2.5_dp, 4.0_dp, 0.3_dp) > 1.0e-13_dp) stop 6
end program test_gma_unit
