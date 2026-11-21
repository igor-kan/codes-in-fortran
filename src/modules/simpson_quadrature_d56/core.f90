module m_simp_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_simp_types
    use m_simp_err
    use m_simp_ifc
    implicit none
contains
pure function simpson_cubics(a, b, n_sub) result(val)
        real(dp), intent(in) :: a, b
        integer, intent(in) :: n_sub
        real(dp) :: val, h, x, fx, w
        integer :: i
        h = (b - a) / real(n_sub, dp)
        val = 0.0_dp
        do i = 0, n_sub
            x = a + real(i, dp) * h
            fx = x*x*x + 2.0_dp*x*x + 1.0_dp
            if (i == 0 .or. i == n_sub) then
                w = 1.0_dp
            else if (mod(i, 2) == 1) then
                w = 4.0_dp
            else
                w = 2.0_dp
            end if
            val = val + w * fx
        end do
        val = val * (h / 3.0_dp)
    end function simpson_cubics
end module m_simp_core
