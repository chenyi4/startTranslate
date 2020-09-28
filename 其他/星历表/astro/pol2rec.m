function ans=pol2rec(pol)
% transfer from polar to rectangular coordinates
z=pol(3)*sin(pol(2));
x=pol(3)*cos(pol(2))*cos(pol(1));
y=pol(3)*cos(pol(2))*sin(pol(1));

ans=[x,y,z];