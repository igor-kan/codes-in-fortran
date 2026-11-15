module m_gma_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_types
    use m_gma_core
    implicit none
contains
    pure function beta_symmetry_error(a, b, x) result(err)
        real(dp), intent(in) :: a, b, x
        real(dp) :: err
        type(beta_eval_t) :: r1, r2
        r1 = reg_incomplete_beta(a, b, x)
        r2 = reg_incomplete_beta(b, a, 1.0_dp - x)
        err = abs(r1%value + r2%value - 1.0_dp)
    end function beta_symmetry_error
end module m_gma_inv
