function [J,TDT]=getdate
% get julian day and TDT from input
% return: Julian and TDT

y=input('input year	(2000):  ');
if isempty(y)
   y=2000;
end
m=input('input month (1)	:  ');
if isempty(m)
   m=1;
end
d=input('input day	(1)	:  ');
if isempty(d)
   d=1;
end

%Julian day
J=cal2julian(y,m,d);
%TDT
TDT=J+deltat(J)/86400.;

