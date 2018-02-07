function [pdot pAngdot omega] = kukaJacobian(q,t,v)
%clear, clc
%kukaManipulator % calculate the DH and the individual tranformations
load('kukaM.mat')

q1 = degtorad(q(1));
q2 = degtorad(q(2));
q3 = degtorad(q(3));
q4 = degtorad(q(4));
q5 = degtorad(q(5));
q6 = degtorad(q(6));

% rotation 
%R00_ = [A00_(1,1) A00_(1,2) A00_(1,3) ; A00_(2,1) A00_(2,2) A00_(2,3) ; A00_(3,1) A00_(3,2) A00_(3,3)];
R01 = [A01(1,1) A01(1,2) A01(1,3) ; A01(2,1) A01(2,2) A01(2,3) ; A01(3,1) A01(3,2) A01(3,3)] ;
R02 = [A02(1,1) A02(1,2) A02(1,3) ; A02(2,1) A02(2,2) A02(2,3) ; A02(3,1) A02(3,2) A02(3,3)] ;
%R03 = [A03(1,1) A03(1,2) A03(1,3) ; A03(2,1) A03(2,2) A03(2,3) ; A03(3,1) A03(3,2) A03(3,3)];
R04 = [A04(1,1) A04(1,2) A04(1,3) ; A04(2,1) A04(2,2) A04(2,3) ; A04(3,1) A04(3,2) A04(3,3)];
%R05 = [A05(1,1) A05(1,2) A05(1,3) ; A05(2,1) A05(2,2) A05(2,3) ; A05(3,1) A05(3,2) A05(3,3)];


b = [0 ; 0 ; 1];
%b0_ = R00_*b;
b1 = R01*b;
b2 = R02*b;
%b3 = R03*b
b4 = R04*b;
%b5 = R05*b

%A0_E = inv(A00_)*A0E;
A1E = inv(A0_1)*inv(A00_)*A0E;
A2E = inv(A12)*inv(A0_1)*inv(A00_)*A0E;
A4E = inv(A34)*inv(A23)*inv(A12)*inv(A0_1)*inv(A00_)*A0E;

%r0_e = [A0_E(1,4) ; A0_E(2,4) ; A0_E(3,4)]
r1e = [A1E(1,4) ; A1E(2,4) ; A1E(3,4)];
r2e = [A2E(1,4) ; A2E(2,4) ; A2E(3,4)];
r4e = [A4E(1,4) ; A4E(2,4) ; A4E(3,4)];

%Jl1 = cross(b0_,r0_e);
Jl2 = cross(b1,r1e);
Jl3 = cross(b2,r2e); 
Jl5 = cross(b4,r4e);

% q2 q3 q5
J = double(subs([0 Jl2 Jl3 0 Jl5 0;
                 0 b1  b2  0 b4  0]));

Jinv = pinv(J);

px_dot = v(1);
py_dot = -v(2);
pz_dot = v(3);

omega = Jinv*[px_dot ; py_dot ; pz_dot ; 0 ;0; 0];

pdot = [px_dot ; py_dot ; pz_dot];

Jang = double(subs([ 0 b1 b2 0 b4 0]));
pAngdot = Jang*omega;







