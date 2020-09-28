function Pr=precess( R, J, direction )

% Precession of the equinox and ecliptic from epoch Julian date J to or from J2000.0
% input: rectangular ecliptic coordinates R, epoch J
% direction =
%      Precess from J to J2000: direction = 1
%      Precess from J2000 to J: direction = -1
% return: rectangular ecliptic coordinates, epoch J or J2000

header;

pAcof=[ -8.66e-10, -4.759e-8, 2.424e-7, 1.3095e-5, 1.7451e-4, -1.8055e-3,   -0.235316, 0.076, 110.5414, 50287.91959,0];

nodecof=[6.6402e-16, -2.69151e-15, -1.547021e-12, 7.521313e-12, 1.9e-10, -3.54e-9, -1.8103e-7,  1.26e-7,  7.436169e-5,-0.04207794833,  3.052115282424];

inclcof=[1.2147e-16, 7.3759e-17, -8.26287e-14, 2.503410e-13, 2.4650839e-11, -5.4000441e-11, 1.32115526e-9, -6.012e-7, -1.62442e-5, 0.00227850649, 0.0 ];

if( J == J2000 )
   return
end

% Each precession angle is specified by a polynomial in T = Julian centuries from J2000.0.
 
T = (J - J2000)/36525.0;
%x=[0;0;0];  % inter colume matrix 
x=rot90(R,-1); % original vector 

%Precession in longitude
T =T/ 10.0; %thousands of years 
   
pA = polyval(pAcof,T)*STR;
     
% Node of the moving ecliptic on the J2000 ecliptic.
 
W =polyval(nodecof,T);

% Rotate about z axis to the node.

   if( direction == 1 )
      z = W + pA;
   else
      z = W;
   end
   
B = cos(z);
A = sin(z);

RO=[B, A ,0;-A ,B ,0;0,0,1];

x=RO*x;

% Rotate about new x axis by the inclination of the moving
% ecliptic on the J2000 ecliptic.
	z =polyval(inclcof,T);
if( direction == 1 )
   z = -z;
end
B = cos(z);
A = sin(z);

RO=[1,0,0; 0,B , A ;0, -A,  B];
x=RO*x;

% Rotate about new z axis back from the node.
 
if( direction == 1 )
	z = -W;
else
   z = -W - pA;
end

B = cos(z);
A = sin(z);

RO=[B, A,0; -A, B,0;0,0,1];
x=RO*x;

Pr=rot90(x,1);



