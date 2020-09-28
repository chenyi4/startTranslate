function d=deltat(J)
%return DeltaT = Ephemeris Time - Universal Time in second
 % input: Julian day of UT
 %The tabulated values of deltaT, in hundredths of a second,
 %The tabulated range is 1620.0 through 2004.0.  Bessel's interpolation
 %formula is implemented to obtain fourth order interpolated values at
 %intermediate times.
 %Updated deltaT predictions can be obtained from this network archive:
 %   ftp://maia.usno.navy.mil/ser7/deltat.preds
 %   ftp://maia.usno.navy.mil/ser7/deltat.data
 %For dates earlier than the tabulated range, the program
 %calculates approximate formulae of Stephenson and Morrison
 %or K. M. Borkowski.  These approximations have an estimated
 %error of 15 minutes at 1500 B.C.  
 %A quadratic extrapolation formula, that agrees in value and slope with
 %current data, predicts future values of deltaT.
 
 
Y = 2000.0 + (J - 2451545.0)/365.25; %Julian epoch expressed in Julian years.
 
dt= [
...% 1620.0 thru 1659.0 */
12400, 11900, 11500, 11000, 10600, 10200, 9800, 9500, 9100, 8800,8500, 8200, 7900, 7700, 7400, 7200, 7000, 6700, 6500, 6300,...
6200, 6000, 5800, 5700, 5500, 5400, 5300, 5100, 5000, 4900,4800, 4700, 4600, 4500, 4400, 4300, 4200, 4100, 4000, 3800,...
...% 1660.0 thru 1699.0 */
3700, 3600, 3500, 3400, 3300, 3200, 3100, 3000, 2800, 2700,2600, 2500, 2400, 2300, 2200, 2100, 2000, 1900, 1800, 1700,...
1600, 1500, 1400, 1400, 1300, 1200, 1200, 1100, 1100, 1000,1000, 1000, 900, 900, 900, 900, 900, 900, 900, 900,...
...% 1700.0 thru 1739.0 */
900, 900, 900, 900, 900, 900, 900, 900, 1000, 1000,...
1000, 1000, 1000, 1000, 1000, 1000, 1000, 1100, 1100, 1100,...
1100, 1100, 1100, 1100, 1100, 1100, 1100, 1100, 1100, 1100,...
1100, 1100, 1100, 1100, 1200, 1200, 1200, 1200, 1200, 1200,...
...% 1740.0 thru 1779.0 */
1200, 1200, 1200, 1200, 1300, 1300, 1300, 1300, 1300, 1300,1300, 1400, 1400, 1400, 1400, 1400, 1400, 1400, 1500, 1500,...
1500, 1500, 1500, 1500, 1500, 1600, 1600, 1600, 1600, 1600,1600, 1600, 1600, 1600, 1600, 1700, 1700, 1700, 1700, 1700,...
...% 1780.0 thru 1799.0 */
1700, 1700, 1700, 1700, 1700, 1700, 1700, 1700, 1700, 1700,1700, 1700, 1600, 1600, 1600, 1600, 1500, 1500, 1400, 1400,...
...% 1800.0 thru 1819.0 */
1370, 1340, 1310, 1290, 1270, 1260, 1250, 1250, 1250, 1250,1250, 1250, 1250, 1250, 1250, 1250, 1250, 1240, 1230, 1220,...
...% 1820.0 thru 1859.0 */
1200, 1170, 1140, 1110, 1060, 1020, 960, 910, 860, 800,750, 700, 660, 630, 600, 580, 570, 560, 560, 560,...
570, 580, 590, 610, 620, 630, 650, 660, 680, 690,710, 720, 730, 740, 750, 760, 770, 770, 780, 780,...
...% 1860.0 thru 1899.0 */
788, 782, 754, 697, 640, 602, 541, 410, 292, 182,161, 10, -102, -128, -269, -324, -364, -454, -471, -511,...
-540, -542, -520, -546, -546, -579, -563, -564, -580, -566,-587, -601, -619, -664, -644, -647, -609, -576, -466, -374,...
...% 1900.0 thru 1939.0 */
-272, -154, -2, 124, 264, 386, 537, 614, 775, 913,1046, 1153, 1336, 1465, 1601, 1720, 1824, 1906, 2025, 2095,...
2116, 2225, 2241, 2303, 2349, 2362, 2386, 2449, 2434, 2408,2402, 2400, 2387, 2395, 2386, 2393, 2373, 2392, 2396, 2402,...
...% 1940.0 thru 1979.0 */
 2433, 2483, 2530, 2570, 2624, 2677, 2728, 2778, 2825, 2871, 2915, 2957, 2997, 3036, 3072, 3107, 3135, 3168, 3218, 3268,...
 3315, 3359, 3400, 3447, 3503, 3573, 3654, 3743, 3829, 3920, 4018, 4117, 4223, 4337, 4449, 4548, 4646, 4752, 4853, 4959,...
...% 1980.0 thru 2000.0 */
 5054, 5138, 5217, 5296, 5379, 5434, 5487, 5532, 5582, 5630, 5686, 5757, 5831, 5912, 5998, 6078, 6163, 6230, 6297, 6347, 6383,...
...% Extrapolated values (USNO) */
 6414, 6550, 6640, 6700, 6800, 6900, 7000, 7100, 7200,7300, 7400, 7500, 7700];


TABSTART= 1620;
TABEND =2013;
TABSIZ= (TABEND - TABSTART + 1);


if( Y > TABEND )
	B = Y - TABEND;
	p = dt(TABSIZ) - dt(TABSIZ-1);
	d= (dt(TABSIZ - 100) - (dt(TABSIZ) - 100.0 * p)) * 1e-4;
   d = 0.01 * (dt(TABSIZ) + p * B + d * B * B);
   ['extrapolated deltaT']
   return
 end
	

if( Y < TABSTART )
	
	if( Y >= 948.0 )
		B = 0.01*(Y - 2000.0);
		d = (23.58 * B + 100.3)*B + 101.6;
		
	else
		B = 0.01*(Y - 2000.0)  +  3.75;
		d = 35.0 * B * B  +  40.;
		
   end 
   return
end
	
%Besselian interpolation from tabulated values.

% Zeroth order estimate is value at start of year
iy = floor(Y) - TABSTART+1;

%The fraction of tabulation interval
p = Y - floor(Y);

%First order interpolated value
d=dt(iy)+ p*(dt(iy+1) - dt(iy));

if ((iy-2)>0 & (iy+3)<=TABSIZ)
d1=[0,0,0,0,0];
d2=d1;
d3=d1;
d4=d1;

for i=1:5	%Make table of first differences
   d1(i)=dt(iy-2+i)-dt(iy-3+i);
end

for i=1:4	%Compute second differences
   d2(i)=d1(i+1)-d1(i);
end
B = 0.25*p*(p-1.0);
d=d+ B*(d2(2) + d2(3));

for i=1:3	%Compute third differences
   d3(i)=d2(i+1)-d2(i);
end
B = 2.0*B/3.0;
d=d+ (p-0.5)*B*d3(2);

for i=1:2	%Compute fourth differences
   d4(i)=d3(i+1)-d3(i);
end
B = 0.125*B*(p+1.0)*(p-2.0);
d=d+ B*(d4(1) + d4(2));

end

d=d* 0.01;

if( Y < 1955.0 )  % Entries after 1955 are referred to atomic time standards
	B = (Y - 1955.0);
	d=d -0.000091 * (-25.8 + 26.0) * B * B;
end
return

