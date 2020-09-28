%display sun's position

[J,TDT]=getdate;
% display
format  long g
date=julian2cal(J);
h=r2h(date(4)*2*pi);
fprintf(1,'\n\nSun''s position\n \nUT:   %4.0f  %2.0f   %2.0f   %2.0fh  %2.0fm  %6.3fs', date(1:3),h(2:4)); 
date=julian2cal(TDT);
h=r2h(date(4)*2*pi);
fprintf(1,'\nTDT:  %4.0f  %2.0f   %2.0f   %2.0fh  %2.0fm  %6.3fs\n', date(1:3),h(2:4)); 
%-----------
header

% ecliptic polar coordinates of earth (J2000)

ecr2000_sun=-pol2rec(pearth(TDT)); %ecliptic rectangular coordinates of sun (J2000)

ecrJ_sun=precess(ecr2000_sun,TDT,-1); % precess to epoch J

ecpJ_sun=rec2pol(ecrJ_sun); %ecliptic polar coordinates of sun (J)


%display 
fprintf(1,'\necliptic polar coordinates of sun(epoch J)\n')
fprintf(1,'\nlongitude: %2.0f %3.0fd %2.0fm %8.5fs',r2d(ecpJ_sun(1)));
fprintf(1,'\nlatitude : %2.0f %3.0fd %2.0fm %6.3fs',r2d(ecpJ_sun(2)));
fprintf(1,'\nradius   : %12.9f AU',ecpJ_sun(3));
%-----------
r=ecpJ_sun(3);
for i=1:3  % light time correction
   t=r/173.1446327;
   pea=pearth(TDT-t); % ecliptic polar coordinates of earth (J2000)
   r=pea(3);
end

ecr2000t_sun=-pol2rec(pea); %ecliptic rectangular coordinates of sun at TDT-t

t=r/173.1446327;

%display
fprintf(1,'\n\nlight time:  %10.6f minutes',t*1440);
%------------

eps=epsiln(J2000);  % difference in RA, Dec (J2000) by aberration

eqp2000=rec2pol(ec2eq(ecr2000_sun,eps,1));
eqp2000t=rec2pol(ec2eq(ecr2000t_sun,eps,1));

dRA=eqp2000(1)-eqp2000t(1);

dDec=eqp2000(2)-eqp2000t(2);

%display
fprintf(1,'\n\nAberration correction (J2000):');
fprintf(1,'\ndRA : %1.0f %2.0fh %2.0fm %6.3fs',r2h(dRA));
fprintf(1,'\ndDec: %1.0f %3.0fd %2.0fm %6.3fs',r2d(dDec));
%------------

% precess to equinox of date J
ecrJ_sun=precess(ecr2000t_sun,TDT,-1);
ecpJ=rec2pol(ecrJ_sun);

nut=nutate(TDT);

ecpJ(1)=ecpJ(1)+nut(1);

rect=pol2rec(ecpJ);

eqrJ=ec2eq(rect,nut(2),1);

eqpJ=rec2pol(eqrJ);

fprintf(1,'\nApparent position:');
fprintf(1,'\nRA : %1.0f %2.0fh %2.0fm %6.3fs',r2h(eqpJ(1)));
fprintf(1,'\nDec: %1.0f %3.0fd %2.0fm %6.3fs',r2d(eqpJ(2)));
fprintf(1,'\necliptic longitude: %10.5f %3.0fd %2.0fm %6.3fs',ecpJ(1)*RTD);
