module m_flv_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_flv_types
    use m_flv_err
    use m_flv_ifc
    implicit none
contains
pure subroutine faddeev_leverrier_3x3(A, coeffs)
        real(dp), intent(in) :: A(3, 3)
        real(dp), intent(out) :: coeffs(0:3)
        real(dp) :: B(3, 3), I3(3, 3), tr
        integer :: k, j
        I3 = 0.0_dp
        do j = 1, 3
            I3(j, j) = 1.0_dp
        end do
        coeffs(3) = 1.0_dp
        B = 0.0_dp
        do k = 1, 3
            if (k == 1) then
                B = A
            else
                B = matmul(A, B + coeffs(4 - k) * I3)
            end if
            tr = B(1, 1) + B(2, 2) + B(3, 3)
            coeffs(3 - k) = -tr / real(k, dp)
        end do
    end subroutine faddeev_leverrier_3x3
end module m_flv_core
