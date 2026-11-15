program test_gma_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_core
    use m_gma_conc
    use m_gma_inv
    implicit none
    integer, parameter :: m = 9
    real(dp) :: xs(m), ys(m)
    integer :: i
    do i = 1, m
        xs(i) = real(i, dp) * 0.1_dp
        if (beta_symmetry_error(3.0_dp, 5.0_dp, xs(i)) > 1.0e-12_dp) stop 1
    end do
    call batch_beta_cdf(m, 2.0_dp, 3.0_dp, xs, ys)
    do i = 2, m
        if (ys(i) <= ys(i - 1)) stop 2
    end do
end program test_gma_prop
