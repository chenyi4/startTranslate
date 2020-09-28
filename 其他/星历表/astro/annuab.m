function an=annuab(p, TDT)
% correct for light deflection
% correct for annual aberration . In J2000
% input: unit equatorial rectangular vector
% return: corrected 
% based on: spherical astronomy by Ma Wen Zhang
header
% earth velocity
eps=epsiln(J2000);
e1=ec2eq(pol2rec(pearth(TDT)),eps,1);


% correct for light deflection

a=e1/sqrt(e1*e1'); % unit vector
S=p/sqrt(p*p'); %normalize
cosD=-a*S';
sinD=sqrt(1-cosD*cosD);
th=0.00407*(1+cosD)/sinD*STR;
S1=-sin(th)/sinD*a+(cos(th)-sin(th)/sinD*cosD)*S;

an=S1;



% correct for annual aberration . In J2000
t=0.005;
e2=ec2eq(pol2rec(pearth(TDT-t)),eps,1);
e=(e1-e2)/t;
a=e/sqrt(e*e');
S=p/sqrt(p*p'); %normalize
cosD=a*S';
sinD=sqrt(1-cosD*cosD);
K=sqrt(e*e')/1.731446328e2;
sinth=K*sinD-1/2*K*K*sinD*cosD;
costh=sqrt(1-sinth*sinth);
S1=sinth/sinD*a+(costh-sinth/sinD*cosD)*S;

an=S1;