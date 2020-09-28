function J=cal2julian( year, month, day )
% Calculate Julian day from Gregorian and Julian calendar date
% input : year,month, day(and fraction)
% return: julian day

y = year + 4800; %4801 B.C. is a century year and also a leap year.  

if( year < 0 )
	y =y+ 1; 	% Please note that there is no year 0 A.D.
end

m = month;
if( m <= 2 )	%January and February come after December.
	m = m+12; 
	y = y - 1;
end

e =floor(30.6 * (m+1));

a =floor(y/100);	%number of centuries

if( year <1582 )|(year==1582&month<10)|(year==1582& month==10 &day<15)
   % 10days missing between Gregorian (start from 1582,10,15)and Julian Calendar (end at 1582,10,4)
	b = -38;
else
	b = floor((a/4) - a); %number of century years that are not leap years
end

c =floor(365.25* y); %Julian calendar years and leap years 

J = b + c + e + day - 32167.5;

