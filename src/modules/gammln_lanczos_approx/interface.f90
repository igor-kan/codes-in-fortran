module m_gma_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_types
    implicit none
    abstract interface
        pure function scalar_special_fn_iface(z) result(res)
            import :: dp
            real(dp), intent(in) :: z
            real(dp) :: res
        end function scalar_special_fn_iface
    end interface
end module m_gma_ifc
