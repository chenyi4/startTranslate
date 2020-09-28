function e=epsiln(J)

%Obliquity of the ecliptic at Julian date J in "
%DE403 values

T = (J - 2451545.0)/365250;
e = polyval([2.45e-10,5.79e-9,2.787e-7,7.12e-7, -3.905e-5,-2.4967e-3,-5.138e-3,1.9989,- 0.0175,- 468.33960,+ 84381.406173],T);


