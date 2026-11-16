program test_bes_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_conc
    use m_bes_fast
    use m_bes_types
    implicit none
    integer, parameter :: n = 10
    real(dp) :: xs(n), ks(n)
    type(bessel_quad_t) :: q
    integer :: i
    do i = 1, n
        xs(i) = 0.4_dp * real(i, dp)
    end do
    call batch_bessel_k0(n, xs, ks)
    do i = 2, n
        if (ks(i) >= ks(i - 1)) stop 1
    end do
    q = eval_bessel_quad(2.0_dp)
    if (q%i0 <= 1.0_dp .or. q%k0 <= 0.0_dp) stop 2
end program test_bes_prop
