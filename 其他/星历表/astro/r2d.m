function d=r2d(R) 
%radians to degree; return in r2d 
STR=4.8481368110953599359e-6 ;%radians per arc second */
s=sign1(R);
r=abs(R)/STR;
deg=floor(r/3600);
r=r-deg*3600;
min=floor(r/60);
sec=r-min*60;
d=[s,deg,min,sec];
