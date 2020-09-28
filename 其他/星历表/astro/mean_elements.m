%function ans=mean_elements (J)
%Compute mean elements at Julian date J. (TDT)

header

Args(1:18)=0;
  
  T = (J - J2000) / 36525.0; %Time variables.  T is in Julian centuries. 
  
  T2 = T*T;

  % Mean longitudes of planets (Simon et al, 1994) in ", args in radius
  
  base=360*3600;
  
  % Mercury  
  x = mod(538101628.6889819 * T + 908103.213,base );
  x =x+ (6.39e-6 * T	 - 0.0192789) * T2;
  Args(1) = STR * x;

  % Venus  
  x = mod( 210664136.4335482 * T + 655127.236,base );
  x =x+ (-6.27e-6  * T + 0.0059381) * T2;
  Args(2) = STR * x;

  % Earth   
  x = mod( 129597742.283429 * T + 361679.198,base );
  x =x+ (-5.23e-6 * T	 - 2.04411e-2 ) * T2;
  Ea_arcsec = x;
  Args(3) = STR * x;

  % Mars  
  x = mod(  68905077.493988 * T +  1279558.751,base );
  x =x+ (-1.043e-5 * T	 + 0.0094264) * T2;
  Args(4) = STR * x;

  % Jupiter  
  x = mod( 10925660.377991 * T + 123665.420 ,base);
  x =x+ ((((-3.4e-10 * T + 5.91e-8) * T  + 4.667e-6) * T  + 5.706e-5) * T  - 3.060378e-1)*T2;
  Args(5) = STR * x;

   % Saturn  
  x = mod( 4399609.855372 * T + 180278.752 ,base);
  x =x+ (((( 8.3e-10 * T	  - 1.452e-7) * T	  - 1.1484e-5) * T	   - 1.6618e-4) * T	 + 7.561614E-1)*T2;
  Args(6) = STR * x;

  % Uranus  
  x = mod( 1542481.193933 * T + 1130597.971,base )       + (0.00002156*T - 0.0175083)*T2;
  Args(7) = STR * x;

  % Neptune  
  x = mod( 786550.320744 * T + 1095655.149 ,base)       + (-0.00000895*T + 0.0021103)*T2;
  Args(8) = STR * x;

  % Copied from cmoon.c, DE404 version.   
  % Mean elongation of moon = D  
  x = mod( 1.6029616009939659e+09 * T + 1.0722612202445078e+06 ,base);
  x =x+ (((((-3.207663637426e-013 * T + 2.555243317839e-011) * T + 2.560078201452e-009) * T - 3.702060118571e-005) * T   + 6.9492746836058421e-03) * T   - 6.7352202374457519e+00) * T2; 
  Args(10) = STR * x;

  % Mean distance of moon from its ascending node = F  
  x = mod( 1.7395272628437717e+09 * T + 3.3577951412884740e+05 ,base);
  x =x+ ((((( 4.474984866301e-013 * T  + 4.189032191814e-011) * T  - 2.790392351314e-009) * T  - 2.165750777942e-006) * T    - 7.5311878482337989e-04) * T    - 1.3117809789650071e+01) * T2; 
  NF_arcsec = x;
  Args(11) = STR * x;

% Mean anomaly of sun = l' (J. Laskar)  
  x = mod(1.2959658102304320e+08 * T + 1.2871027407441526e+06,base);
  x =x+ (((((((( 1.62e-20 * T    - 1.0390e-17 ) * T	      - 3.83508e-15 ) * T	     + 4.237343e-13 ) * T	    + 8.8555011e-11 ) * T   - 4.77258489e-8 ) * T	  - 1.1297037031e-5 ) * T	 + 8.7473717367324703e-05) * T- 5.5281306421783094e-01) * T2;
  Args(12) = STR * x;

  % Mean anomaly of moon = l  
  x = mod( 1.7179159228846793e+09 * T + 4.8586817465825332e+05 ,base);
  x =x+ (((((-1.755312760154e-012) * T	+ 3.452144225877e-011 * T		- 2.506365935364e-008) * T       - 2.536291235258e-004) * T       + 5.2099641302735818e-02) * T    + 3.1501359071894147e+01) * T2;  
  Args(13) = STR * x;

  % Mean longitude of moon, re mean ecliptic and equinox of date = L   
  x = mod( 1.7325643720442266e+09 * T + 7.8593980921052420e+05,base);
  x =x+ ((((( 7.200592540556e-014 * T	     + 2.235210987108e-010) * T	    - 1.024222633731e-008) * T	   - 6.073960534117e-005) * T	 + 6.9017248528380490e-03) * T  	- 5.6550460027471399e+00) * T2;   
 % x=mod(x,base)
  LP_equinox = x;
  Args(14) = STR * x;

  % Precession of the equinox   
 x = ((((((((( -8.66e-20*T - 4.759e-17)*T       + 2.424e-15)*T           + 1.3095e-12)*T           + 1.7451e-10)*T           - 1.8055e-8)*T           - 0.0000235316)*T           + 0.000076)*T           + 1.105414)*T           + 5028.791959)*T;
 
 % Moon's longitude re fixed J2000 equinox.   
 
   %Args(14) =Args(14)- x;
  
   pA_precession = STR * x;

  % Free librations.   
  % longitudinal libration 2.891725 years  
  x = mod( 4.48175409e7 * T + 8.060457e5 ,base);
  Args(15) = STR * x;
  % libration P, 24.2 years  
  x = mod(  5.36486787e6 * T - 391702.8,base );
  Args(16) = STR * x;

Args(17)=0;
	
% libration W, 74.7 years.  
 x = mod( 1.73573e6 * T,base );
 Args(18)= STR * x;


%ans=Args;