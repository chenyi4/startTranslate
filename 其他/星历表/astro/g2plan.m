function ans=g2plan (J)
% Generic program to accumulate sum of trigonometric series in two variables
% use to calculate geocentric ecliptic polar coordinates of moon
% use for moon longitude and distance calculation
% input: TDT Julian date
% return: moon latitude (mean ecliptic and equinox of date)

plan=moonlr;

header

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
  pr = plan.rad_tbl;
ipr=1; % array index
  sl = 0.0;
  sr = 0.0;

  while 1==1
  
   % argument of sine and cosine  
   % Number of periodic arguments.  
      np = p(ip);
      ip=ip+1;
      
      
      if (np < 0)
         break;
      end
      
      if np == 0 % It is a polynomial term.   
         nt = p(ip);
         ip=ip+1;
         
   % "Longitude" polynomial (phi).  
   	  	cu = pl(ipl);
     		ipl=ipl+1;
     
     	  	for i = 1:nt
	   	   cu = cu * T + pl(ipl);
     	  		ipl=ipl+1;
     		end
            sl =sl+ cu;
            
    % Radius polynomial (psi).  
     		cu = pr(ipr);
     		ipr=ipr+1;
     
     		for i=1:nt
         	cu = cu * T + pr(ipr);
          	ipr=ipr+1;
	      end
	  		sr =sr+ cu;
	
		else % end if np>0

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
		%set first angle  
		  		sv = su;
		  		cv = cu;
				k1 = 1;
		      else
		%combine angles  	
			  	t = su * cv + cu * sv;
			  	cv = cu * cv - su * sv;
		  		sv = t;
				end %if
   		end
   	end % for
      
   % Highest power of T.   
   	nt =p(ip);
   	ip=ip+1;
      
   % Longitude.  
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
      
   %Radius.  
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
            end
   end % end while
   
  t = plan.trunclvl;
  sl=t * sl+LP_equinox;
  sl=mod(sl,base);
  pobj(1) = sl*STR;
  pobj(3) = plan.distance * (1.0+ STR * t * sr);
  pobj(2)=0;
ans=pobj;