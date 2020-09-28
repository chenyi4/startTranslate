function ans=g3plan (J)
% Generic program to accumulate sum of trigonometric series for 3 variables
% Use to calculate heliocentric ecliptic polar coordinates of earth-moon barycenter (J2000)
% input: TDT Julian date
% return : heliocentric ecliptic polar coordinates of earth-moon barycenter(J2000)

plan=ear404;
objnum=3;

header ; % common constant

mean_elements ;


T = (J - J2000) / plan.timescale;
n = plan.maxargs;

% Calculate sin( i*MM ),cos(i*MM), etc. for needed multiple angles. 
  
for i =1:n
	if plan.max_harmonic(i)>0
      for j =1: plan.max_harmonic(i)
			ss(i,j)=sin(j*Args(i));
			cc(i,j)=cos(j*Args(i));
      end
   end
end




% Point to start of table of arguments. 
p = plan.arg_tbl; 
ip=1; % array index

%Point to tabulated cosine and sine amplitudes.   
  pl = plan.lon_tbl;
ipl=1; % array index
  pb = plan.lat_tbl;
ipb=1; % array index
  pr = plan.rad_tbl;
ipr=1; % array index
  sl = 0.0;
  sb = 0.0;
  sr = 0.0;

while 1==1
  
% argument of sine and cosine  
% Number of periodic arguments.  

	np = p(ip);
   ip=ip+1;
      
   if (np < 0)
   	break;
   end
         
   if np == 0 	% It is a polynomial term.   
      nt = p(ip);
      ip=ip+1;
      
      %"Longitude" polynomial (phi).  
   	cu = pl(ipl);
     	ipl=ipl+1;
     
     	for i = 1:nt
	  	   cu = cu * T + pl(ipl);
     		ipl=ipl+1;
      end
         sl =sl+ cu;
         
      % "Latitude" polynomial (theta).  
     	cu = pb(ipb);
     	ipb=ipb+1;
     
     	for i =1:nt
      	cu = cu * T + pb(ipb);
      	ipb=ipb+1;
     	end
   		sb =sb+ cu;
         
      % Radius polynomial (psi).  
  		cu = pr(ipr);
  		ipr=ipr+1;
     
  		for i=1:nt
        	cu = cu * T + pr(ipr);
        	ipr=ipr+1;
      end
	  		sr =sr+ cu;
	
else    

      k1 = 0;
      cv = 0.0;
      sv = 0.0;
      
      for i=1:np
	  % What harmonic.   
     		j = p(ip);
     		ip=ip+1;
	  % Which planet.   
     		m = p(ip) - 1;
     		ip=ip+1;
     
     		if (j~=0)
	    		k = abs (j)-1 ;
		      su = ss(m+1,k+1);	% sin(k*angle)  
            if (j < 0)
            su = -su;
            end 
		      cu = cc(m+1,k+1);
	   	   if (k1 == 0)
		% set first angle  
		  		sv = su;
		  		cv = cu;
				k1 = 1;
		      else
		% combine angles  	
			  	t = su * cv + cu * sv;
			  	cv = cu * cv - su * sv;
		  		sv = t;
				end %if
   		end
   	end % end of for
      
      %	Highest power of T.   
   	nt =p(ip);
   	ip=ip+1;
      
      %	Longitude.  
     	cu = pl(ipl);
     	ipl=ipl+1;
     	su = pl(ipl);
     	ipl=ipl+1;
     
      for i= 1:nt
			cu = cu * T + pl(ipl);
   		ipl=ipl+1;
   		su = su * T + pl(ipl);
	   	ipl=ipl+1;
  		end
      sl =sl+ cu * cv + su * sv;
      
      %	Latitiude.  
   	cu = pb(ipb);
     	ipb=ipb+1;
      su = pb(ipb);
     	ipb=ipb+1;
   
      for i= 1:nt
	      cu = cu * T + pb(ipb);
         ipb=ipb+1;
			su = su * T + pb(ipb);
	     ipb=ipb+1;
		end
		sb =sb+ cu * cv + su * sv;
      
      %	Radius.  
	   cu = pr(ipr);
   	ipr=ipr+1;
	   su = pr(ipr);
   	ipr=ipr+1;
   
      for i= 1:nt
		  	cu = cu * T + pr(ipr);
			ipr=ipr+1;
   		su = su * T + pr(ipr);
			ipr=ipr+1;
   	end
      sr =sr+ cu * cv + su * sv;
   end	% end if np>0

   
   end 	% end while
   
  t = plan.trunclvl;
  pobj(1) = Args(objnum) + STR * t * sl;
  pobj(2) = STR * t * sb;
  pobj(3) = plan.distance * (1.0+ STR * t * sr);

ans=pobj;