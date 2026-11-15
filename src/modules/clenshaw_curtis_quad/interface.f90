module m_ccq_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function integrand_iface(x) result(fx)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: fx
        end function integrand_iface
    end interface
end module m_ccq_ifc
