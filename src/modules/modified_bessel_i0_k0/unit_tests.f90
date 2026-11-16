program test_bes_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_core
    use m_bes_err
    use m_bes_val
    use m_bes_inv
    implicit none
    real(dp) :: xs(6), x
    integer :: i
    if (abs(bessel_i0(0.0_dp) - 1.0_dp) > 1.0e-12_dp) stop 1
    xs = [0.2_dp, 0.8_dp, 1.9_dp, 2.5_dp, 4.0_dp, 10.0_dp]
    do i = 1, 6
        x = xs(i)
        if (validate_pos_arg(x) /= ERR_OK) stop 2
        if (wronskian_error(x) > 1.0e-5_dp) stop 3
    end do
end program test_bes_unit
