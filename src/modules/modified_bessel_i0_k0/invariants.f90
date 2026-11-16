module m_bes_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_core
    implicit none
contains
    pure function wronskian_error(x) result(err)
        real(dp), intent(in) :: x
        real(dp) :: err, lhs
        lhs = bessel_i0(x) * bessel_k1(x) + bessel_i1(x) * bessel_k0(x)
        err = abs(lhs - 1.0_dp / x)
    end function wronskian_error
end module m_bes_inv
