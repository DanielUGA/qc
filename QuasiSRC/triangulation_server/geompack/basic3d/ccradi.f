      double precision function ccradi(a,b,c,d)
      implicit logical (a-z)
      double precision a(3),b(3),c(3),d(3)
c
c     written and copyright by:
c        barry joe, dept. of computing science, univ. of alberta
c        edmonton, alberta, canada  t6g 2h1
c        phone: (403) 492-5757      email: barry@cs.ualberta.ca
c
c     purpose: compute circumradius of tetrahedron [actually
c        1/(4*circumradius)**2 is computed].
c
c     input parameters:
c        a(1:3),b(1:3),c(1:3),d(1:3) - 4 vertices of tetrahedron
c
c     returned function value:
c        ccradi - 1/(4*circumradius)**2
c
      integer i
      double precision ab(3),ac(3),ad(3),bc(3),bd(3),cd(3)
      double precision denom,lab,lac,lad,lbc,lbd,lcd,pb,pc,pd,t1,t2,vol
c
      do 10 i = 1,3
	 ab(i) = b(i) - a(i)
	 ac(i) = c(i) - a(i)
	 ad(i) = d(i) - a(i)
	 bc(i) = c(i) - b(i)
	 bd(i) = d(i) - b(i)
	 cd(i) = d(i) - c(i)
   10 continue
      lab = ab(1)**2 + ab(2)**2 + ab(3)**2
      lac = ac(1)**2 + ac(2)**2 + ac(3)**2
      lad = ad(1)**2 + ad(2)**2 + ad(3)**2
      lbc = bc(1)**2 + bc(2)**2 + bc(3)**2
      lbd = bd(1)**2 + bd(2)**2 + bd(3)**2
      lcd = cd(1)**2 + cd(2)**2 + cd(3)**2
      pb = sqrt(lab*lcd)
      pc = sqrt(lac*lbd)
      pd = sqrt(lad*lbc)
      t1 = pb + pc
      t2 = pb - pc
      denom = (t1+pd)*(t1-pd)*(pd+t2)*(pd-t2)
      if (denom .le. 0.0d0) then
	 ccradi = 0.0d0
      else
         vol = ab(1)*(ac(2)*ad(3) - ac(3)*ad(2)) + ab(2)*(ac(3)*ad(1)
     $      - ac(1)*ad(3)) + ab(3)*(ac(1)*ad(2) - ac(2)*ad(1))
         ccradi = vol**2/denom
      endif
      end
