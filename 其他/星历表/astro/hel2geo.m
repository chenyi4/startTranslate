  function an=hel2geo(p,e,eps)
  % reduce heliocentric to geocentric coordinates
  % input: ecliptic polar
  % return : equatorial polar
  
  ecre=pol2rec(e);
  ecrp=pol2rec(p);
  v=ecrp-ecre;
     
  eqr=ec2eq(v,eps,1);
  
  an=rec2pol(eqr);
