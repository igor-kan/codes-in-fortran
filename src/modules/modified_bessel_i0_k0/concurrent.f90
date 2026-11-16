module m_bes_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_core
    implicit none
contains
    pure subroutine batch_bessel_k0(n, xs, k0s)
        integer, intent(in) :: n
        real(dp), intent(in) :: xs(n)
        real(dp), intent(out) :: k0s(n)
        integer :: i
        do concurrent (i = 1:n)
            k0s(i) = bessel_k0(xs(i))
        end do
    end subroutine batch_bessel_k0
end module m_bes_conc
