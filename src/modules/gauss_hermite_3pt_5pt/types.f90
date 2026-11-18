module m_gh5_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: gh_rule_t
        real(dp) :: nodes(5)
        real(dp) :: weights(5)
    end type gh_rule_t
end module m_gh5_types
