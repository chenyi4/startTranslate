%display planet's position

[J,TDT]=getdate;

name=char('Mercury','Venus','Mars','Jupiter',' Saturn',' Uranus','Neptune','Pluto');

pointer=['plan=mer404;';'plan=ven404;';'plan=mar404;';'plan=jup404;';'plan=sat404;';'plan=ura404;';'plan=nep404;';'plan=plu404;'];

num=menu('Choose the planet','Mercury','Venus','Mars','Jupiter',' Saturn',' Uranus','Neptune','Pluto');%input('select planet (1-9):');

% display
fprintf(1,'\n %s''s position\n', deblank(name(num,:))); 
format  long g
date=julian2cal(J);
h=r2h(date(4)*2*pi);
fprintf(1,'\n\nUT:   %4.0f  %2.0f   %2.0f   %2.0fh  %2.0fm  %6.3fs', date(1:3),h(2:4)); 
date=julian2cal(TDT);
h=r2h(date(4)*2*pi);
fprintf(1,'\nTDT:  %4.0f  %2.0f   %2.0f   %2.0fh  %2.0fm  %6.3fs\n', date(1:3),h(2:4)); 
%-----------
header

eval(pointer(num,:));


% heliocetric ecliptic polar coordinates of planet (J2000)

ecp2000p=gplan(TDT,plan); %ecliptic polar coordinates of planet (J2000)
ecp2000e=pearth(TDT); %ecliptic polar coordinates of earth (J2000)
ecrp=pol2rec(ecp2000p);
ecrJp=precess(ecrp,TDT,-1); % precess to epoch J

ecpJp=rec2pol(ecrJp); %ecliptic polar coordinates  (J)


%display 
fprintf(1,'\nHeliocentric ecliptic polar coordinates (epoch J)\n')
fprintf(1,'\nlongitude: %2.0f %3.0fd %2.0fm %6.3fs',r2d(ecpJp(1)));
fprintf(1,'\nlatitude : %2.0f %3.0fd %2.0fm %6.3fs',r2d(ecpJp(2)));
fprintf(1,'\nradius   : %12.9f AU',ecpJp(3));
%-----------

% light time correction including gravitational retardation due to the Sun.

E =ecp2000e(3);
ecre=pol2rec(ecp2000e);
ecpp=ecp2000p;
for k=1:3
   ecrp=pol2rec(ecpp);
   p=ecrp-ecre;
   temp=rec2pol(ecrp);
   Q=temp(3);
   temp=rec2pol(p);
   P=temp(3);
   t = (P + 1.97e-8 * log( (E+P+Q)/(E-P+Q) ) )/173.1446327;
   ecpp=gplan(TDT-t,plan);
end

%display
fprintf(1,'\n\nlight time:  %10.6f minutes',t*1440);
%------------

eps=epsiln(J2000);  % difference in RA, Dec (J2000) by aberration

eqp2000=hel2geo(ecp2000p,ecp2000e,eps);
eqp2000t=hel2geo(ecpp,ecp2000e,eps);

dRA=eqp2000t(1)-eqp2000(1);

dDec=eqp2000t(2)-eqp2000(2);

%display
fprintf(1,'\n\nAberration correction (J2000):');
fprintf(1,'\ndRA : %1.0f %2.0fh %2.0fm %6.3fs',r2h(dRA));
fprintf(1,'\ndDec: %1.0f %3.0fd %2.0fm %6.3fs',r2d(dDec));
fprintf(1,'\n\nTrue geocentric distance: %.7fau',eqp2000(3));
%------------

%display Astrometrc J2000.0

fprintf(1,'\n\nAstrometrc J2000.0:');
fprintf(1,'\nRA : %1.0f %2.0fh %2.0fm %6.3fs',r2h(eqp2000t(1)));
fprintf(1,'\nDec: %1.0f %3.0fd %2.0fm %6.3fs',r2d(eqp2000t(2)));
%------------

% precess to equinox of B1950
ecr2000t=ec2eq(pol2rec(eqp2000t),eps,-1);
ecr1950=precess(ecr2000t,B1950,-1);
eps=epsiln(B1950);
eqp1950=rec2pol(ec2eq(ecr1950,eps,1));

%display Astrometrc B1950
fprintf(1,'\n\nAstrometrc B1950:');
fprintf(1,'\nRA : %1.0f %2.0fh %2.0fm %6.3fs',r2h(eqp1950(1)));
fprintf(1,'\nDec: %1.0f %3.0fd %2.0fm %6.3fs',r2d(eqp1950(2)));
%------------

% correctrion for annual aberration
p=pol2rec(eqp2000t);
p=rec2pol(annuab(p,TDT));
fprintf(1,'\n\nAnnual Aberration:');
fprintf(1,'\nRA : %1.0f %2.0fh %2.0fm %8.5fs',r2h(p(1)-eqp2000t(1)));
fprintf(1,'\nDec: %1.0f %3.0fd %2.0fm %8.5fs',r2d(p(2)-eqp2000t(2)));

eps=epsiln(J2000);
ecr=ec2eq(pol2rec(p),eps,-1);

% precess to equinox of date J
ecrJ=precess(ecr,TDT,-1);

ecpJ=rec2pol(ecrJ);

nut=nutate(TDT);

ecpJ(1)=ecpJ(1)+nut(1);

rect=pol2rec(ecpJ);

eqrJ=ec2eq(rect,nut(2),1);

eqpJ=rec2pol(eqrJ);
eps=epsiln(TDT);

ecpJ=rec2pol(ec2eq(eqrJ,eps,-1)); % note this

fprintf(1,'\nApparent position:');
fprintf(1,'\nRA : %1.0f %2.0fh %2.0fm %6.3fs',r2h(eqpJ(1)));
fprintf(1,'\nDec: %1.0f %3.0fd %2.0fm %6.3fs',r2d(eqpJ(2)));
fprintf(1,'\necliptic longitude: %1.0f %3.0fd %2.0fm %6.3fs',r2d(ecpJ(1)));
fprintf(1,'\necliptic latitude: %1.0f %3.0fd %2.0fm %6.3fs',r2d(ecpJ(2)));


%--------- enf of file