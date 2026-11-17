module m_gh_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    use m_gh_err
    implicit none
contains
    subroutine build_gauss_hermite(n, rule, status)
        integer, intent(in) :: n
        type(gh_rule_t), intent(out) :: rule
        integer, intent(out) :: status
        real(dp), parameter :: pim4 = 0.7511255444649425_dp
        integer :: i, m, its, j
        real(dp) :: z, z1, p1, p2, p3, pp
        if (n < 1) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        rule%n = n
        allocate(rule%x(n), rule%w(n))
        m = (n + 1) / 2
        z = 0.0_dp
        do i = 1, m
            if (i == 1) then
                z = sqrt(real(2*n + 1, dp)) - 1.85575_dp * (real(2*n + 1, dp) ** (-0.16667_dp))
            else if (i == 2) then
                z = z - 1.14_dp * (real(n, dp) ** 0.426_dp) / z
            else if (i == 3) then
                z = 1.86_dp * z - 0.86_dp * rule%x(1)
            else if (i == 4) then
                z = 1.91_dp * z - 0.91_dp * rule%x(2)
            else
                z = 2.0_dp * z - rule%x(i - 2)
            end if
            do its = 1, 25
                p1 = pim4
                p2 = 0.0_dp
                do j = 1, n
                    p3 = p2
                    p2 = p1
                    p1 = z * sqrt(2.0_dp / real(j, dp)) * p2 - sqrt(real(j - 1, dp) / real(j, dp)) * p3
                end do
                pp = sqrt(2.0_dp * real(n, dp)) * p2
                z1 = z
                z = z1 - p1 / pp
                if (abs(z - z1) <= 1.0e-14_dp) exit
            end do
            rule%x(i) = z
            rule%x(n + 1 - i) = -z
            rule%w(i) = 2.0_dp / (pp * pp)
            rule%w(n + 1 - i) = rule%w(i)
        end do
    end subroutine build_gauss_hermite
end module m_gh_core
