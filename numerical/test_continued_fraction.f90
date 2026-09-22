program test_continued_fraction
  use continued_fraction_mod
  implicit none
  real(8) :: v, phi
  v = golden_ratio_cf(40)
  phi = (1.0d0 + sqrt(5.0d0)) / 2.0d0
  ! Continued fraction [1;1,1,...] converges to phi; our first term is 0, add 1.
  if (abs((v + 1.0d0) - phi) > 1.0d-10) then
    print *, "FAIL", v + 1.0d0, phi
    stop 1
  end if
  print *, "PASS continued_fraction", v + 1.0d0
end program test_continued_fraction
