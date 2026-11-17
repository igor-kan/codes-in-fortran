program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_htd_conc
    implicit none
    real(dp) :: mats(4, 4, 2), tr(2)
    integer :: i
    mats = 0.0_dp
    do i = 1, 4
        mats(i, i, 1) = real(i, dp)
        mats(i, i, 2) = 2.0_dp * real(i, dp)
    end do
    call batch_tridiag(2, 4, mats, tr)
    if (abs(tr(1) - 10.0_dp) > 1.0e-11_dp) error stop 'trace 1 bad'
    if (abs(tr(2) - 20.0_dp) > 1.0e-11_dp) error stop 'trace 2 bad'
end program test_props
