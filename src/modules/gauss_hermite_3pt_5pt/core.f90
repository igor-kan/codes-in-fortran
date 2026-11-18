module m_gh5_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh5_types
    use m_gh5_err
    use m_gh5_ifc
    implicit none
contains
pure function gauss_hermite_5pt_even_pow(power) result(val)
        integer, intent(in) :: power
        real(dp) :: val, x(5), w(5)
        integer :: i
        x = [-2.0201828704560856_dp, -0.9585724646138185_dp, 0.0_dp, &
              0.9585724646138185_dp,  2.0201828704560856_dp]
        w = [0.019953242059045913_dp, 0.39361932315224116_dp, 0.9453087204829419_dp, &
             0.39361932315224116_dp,  0.019953242059045913_dp]
        val = 0.0_dp
        do i = 1, 5
            val = val + w(i) * (x(i) ** power)
        end do
    end function gauss_hermite_5pt_even_pow
end module m_gh5_core
