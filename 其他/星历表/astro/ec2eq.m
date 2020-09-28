function rect=ec2eq(ec,eps,flag)
%transfer between ecliptic and equatorial rectangular coordinates, eps in ", if flag<0, eq to ec
header
if flag<0
   eps=-eps;
end

coseps=cos(eps*STR);
sineps=sin(eps*STR);

V=rot90(ec,-1);
RO=[1,0,0; 0,coseps , -sineps;0,sineps, coseps];
x=RO*V;

rect=rot90(x);