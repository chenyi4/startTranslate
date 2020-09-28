function an=pmoon(TDT)
% geocentric ecliptic polar coordinates of moon at TDT (J2000)
% input: TDT
% return:geocentric ecliptic polar coordinates of moon (J2000)
header
pm=g2plan(TDT);
s=g1plan(TDT);
pm(2)=s;

ecrm=pol2rec(pm);  % rectangular ecliptic coordinates

ecrm=precess(ecrm,TDT,1); % precess to J2000

pm=rec2pol(ecrm);

an=pm;