module m_bes_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_types
    implicit none
contains
    pure function bessel_i0(x) result(ans)
        real(dp), intent(in) :: x
        real(dp) :: ans, ax, y
        ax = abs(x)
        if (ax < 3.75_dp) then
            y = (x / 3.75_dp) ** 2
            ans = 1.0_dp + y * (3.5156229_dp + y * (3.0899424_dp + y * (1.2067492_dp + &
                y * (0.2659732_dp + y * (0.0360768_dp + y * 0.0045813_dp)))))
        else
            y = 3.75_dp / ax
            ans = (exp(ax) / sqrt(ax)) * (0.39894228_dp + y * (0.01328592_dp + y * (0.00225319_dp + &
                y * (-0.00157565_dp + y * (0.00916281_dp + y * (-0.02057706_dp + &
                y * (0.02635537_dp + y * (-0.01647633_dp + y * 0.00392377_dp))))))))
        end if
    end function bessel_i0

    pure function bessel_i1(x) result(ans)
        real(dp), intent(in) :: x
        real(dp) :: ans, ax, y
        ax = abs(x)
        if (ax < 3.75_dp) then
            y = (x / 3.75_dp) ** 2
            ans = ax * (0.5_dp + y * (0.87890594_dp + y * (0.51498869_dp + y * (0.15084934_dp + &
                y * (0.02658733_dp + y * (0.00301532_dp + y * 0.00032411_dp))))))
        else
            y = 3.75_dp / ax
            ans = (exp(ax) / sqrt(ax)) * (0.39894228_dp + y * (-0.03988024_dp + y * (-0.00362018_dp + &
                y * (0.00163801_dp + y * (-0.01031555_dp + y * (0.02282967_dp + &
                y * (-0.02895312_dp + y * (0.01787654_dp - y * 0.00420059_dp))))))))
        end if
        if (x < 0.0_dp) ans = -ans
    end function bessel_i1

    pure function bessel_k0(x) result(ans)
        real(dp), intent(in) :: x
        real(dp) :: ans, y
        if (x <= 2.0_dp) then
            y = x * x / 4.0_dp
            ans = -log(x / 2.0_dp) * bessel_i0(x) + (-0.57721566_dp + y * (0.42278420_dp + &
                y * (0.23069756_dp + y * (0.03488590_dp + y * (0.00262698_dp + &
                y * (0.00010750_dp + y * 0.00000740_dp))))))
        else
            y = 2.0_dp / x
            ans = (exp(-x) / sqrt(x)) * (1.25331414_dp + y * (-0.07832358_dp + y * (0.02189568_dp + &
                y * (-0.01062446_dp + y * (0.00587872_dp + y * (-0.00251540_dp + y * 0.00053208_dp))))))
        end if
    end function bessel_k0

    pure function bessel_k1(x) result(ans)
        real(dp), intent(in) :: x
        real(dp) :: ans, y
        if (x <= 2.0_dp) then
            y = x * x / 4.0_dp
            ans = log(x / 2.0_dp) * bessel_i1(x) + (1.0_dp / x) * (1.0_dp + y * (0.15443144_dp + &
                y * (-0.67278579_dp + y * (-0.18156897_dp + y * (-0.01919402_dp + &
                y * (-0.00110404_dp - y * 0.00004686_dp))))))
        else
            y = 2.0_dp / x
            ans = (exp(-x) / sqrt(x)) * (1.25331414_dp + y * (0.23498619_dp + y * (-0.03655620_dp + &
                y * (0.01504268_dp + y * (-0.00780353_dp + y * (0.00325614_dp - y * 0.00068245_dp))))))
        end if
    end function bessel_k1
end module m_bes_core
