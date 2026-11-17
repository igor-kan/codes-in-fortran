module m_gh_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function gh_fn(x) result(v)
            import :: dp
            real(dp), intent(in) :: x
            real(dp) :: v
        end function gh_fn
    end interface
end module m_gh_ifc
