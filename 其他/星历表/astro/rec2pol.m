function an=rec2pol(rec)
% transfer from rectangular to polar  coordinates
r=sqrt(dot(rec,rec));
r0=sqrt(rec(1)*rec(1)+rec(2)*rec(2));
PHI=atan2(rec(3),r0);
TH=atan2(rec(2),rec(1));
if TH<0
   TH=TH+2*pi;
end


an=[TH,PHI,r];