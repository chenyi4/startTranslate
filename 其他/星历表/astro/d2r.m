function q=d2r(deg,min,sec)
% degree to radians
% input: degree, minute and second
% return: radians

STR=4.8481368110953599359e-6 ;%radians per arc second */
s=sign1(deg)*sign1(min)*sign1(sec);
deg=abs(deg);
min=abs(min);
sec=abs(sec);
q=s*(deg*3600+min*60+sec)*STR;
