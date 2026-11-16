module m_bes_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_types
    use m_bes_core
    implicit none
contains
    pure function eval_bessel_quad(x) result(q)
        real(dp), intent(in) :: x
        type(bessel_quad_t) :: q
        q%i0 = bessel_i0(x)
        q%i1 = bessel_i1(x)
        q%k0 = bessel_k0(x)
        q%k1 = bessel_k1(x)
    end function eval_bessel_quad
end module m_bes_fast
