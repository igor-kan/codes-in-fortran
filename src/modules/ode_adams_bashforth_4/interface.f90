module m_ab4_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function ode_rhs(t, y) result(dydt)
            import :: dp
            real(dp), intent(in) :: t, y
            real(dp) :: dydt
        end function ode_rhs
    end interface
end module m_ab4_ifc
