module exercise1
   implicit none

contains
   subroutine stable_case(r_in,x_in)
      real, intent(in) :: r_in
      real, intent(in) :: x_in
      integer :: i
      real :: x 
      character(len=50) :: filename
      integer :: iostat_val, unit
      character(len=100) :: iostat_msg

      x = x_in 
      filename = 'data'//'_'//r_in//'_'//x//'.csv'
      print *, filename
      open (newunit=unit, file=filename, status='replace', action='write', iostat=iostat_val, iomsg=iostat_msg)
      if (iostat_val /= 0) then
         print *, 'Error opening file', iostat_msg, ",", iostat_val
         return
       else 
         write (unit, '(A,",",A)') "n", "x"
      end if

      do i = 1, 100
         x = r_in*x*(1 - x)
         write (unit, '(G0.5,",",G0.5)') i, x
      end do

      close (unit)
   end subroutine stable_case
end module
