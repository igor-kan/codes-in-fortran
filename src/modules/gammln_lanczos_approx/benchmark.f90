program bench_gma
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_gma_types
    use m_gma_core
    implicit none
    integer(int64) :: t0, t1, rate
    real(dp) :: acc
    type(beta_eval_t) :: tmp
    integer :: i

    acc = 0.0_dp
    call system_clock(t0, rate)
    do i = 1, 5000
        tmp = reg_incomplete_beta(2.5_dp, 3.5_dp, 0.0001_dp * real(mod(i, 999) + 1, dp))
        acc = acc + tmp%value
    end do
    call system_clock(t1)
    if (acc <= 0.0_dp .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_gma
