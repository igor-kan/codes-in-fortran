module m_s2d_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function weight_1d(idx, n) result(w)
        integer, intent(in) :: idx, n
        real(dp) :: w
        w = merge(1.0_dp, merge(2.0_dp, 4.0_dp, mod(idx, 2) == 0), idx == 0 .or. idx == n)
    end function weight_1d
end module m_s2d_fast
