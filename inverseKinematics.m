function q = inverseKinematics(p,f,w)

%kukaManipulator % calculate the DH and the individual transformations
load('kukaM.mat')
% rotation of the end-effector in respect to the space frame Oo 
% ROT = [ cos(q5)*cos(q2+q3) 0 cos(q5)*sin(q2+q3)+sin(q5)*cos(q2+q3); 0 1 0 ; -cos(q5)*sin(q2+q3)-sin(q5)*cos(q2+q3)  0  cos(q5)*cos(q2+q3) - sin(q5)*sin(q2+q3)];
% translation of the end-effector in respect to the space frame Oo 
% T = [ 350 + 850*sin(q2) + 270*cos(q2+q3+q5)+820*cos(q2+q3) + 145*sin(q2+q3) ; 0 ; 850*cos(q2)+145*cos(q2+q3)-820*sin(q2+q3)-270*sin(q2+q3+q5)+815];
% the matrix that calculates the forward kinematics
% forwardKinematics = [ROT T; 0 0 0 1];


%{ 
    ORIENTATION AND TRANSLATION OF THE END EFFECTOR
        input from the user
        f = the oriantation of the end effector in respect to the Oo frame
            0 for a plane parallel to the x0-y0 plane
        p = the position of the end effector in respect to the Oo frame
            p = [l2+l5+l6+le ; 0 ; l1 + l3 + l4] for the zero-position
%}
%{
% Workplace translation and orientation
d = 1.4;
f = 45; % orientation of the end effector in degrees
w = 30;
p = [d*cos(degtorad(30)) ; -d*sin(degtorad(30)) ; d]; % q2 = 0   q3 = 0   q5 = 90
%--------------------------------------------------------------------------
%}
f = degtorad(f); % orientation of the end effector in rads

% CALCULATION OF  q1 REVOLUTE JOINT - It is constant 

N = A56*A6E;
n = N(1:3,3);

pp = double(p - N(1:3,4)*sin(f));
%p04 = double(pp - cos(f)*n*norm(N(1:3,4)));

%q1 = atan2(p04(2),p04(1));
%(q1);

q1 = degtorad(w);

% CALCULATION OF  q3 REVOLUTE JOINT
p04 = double(pp - cos(f)*n*norm(N(1:3,4)));
A01 = double(subs(A01));
p01 = [A01(1,4) A01(2,4) A01(3,4)]';

p14 = p04 - p01;

a = norm(p14);
phi = acos((l3^2 + l4^2 + l5^2 - a^2)/(2*l3*sqrt(l4^2 + l5^2)));
radtodeg(phi);
q3 = pi() - phi - atan2(l5,l4);
radtodeg(q3);


% CALCULATION OF  q2 REVOLUTE JOINT
p01 = subs(A00_(1:3,1:3)*A0_1(1:3,1:3));
p01 = double(p01);

p0_14 = double(p14);
p1_14 = p01' * p0_14;
p1_14 = double(p1_14);

b1 = atan2(-p1_14(2),p1_14(1));
radtodeg(b1);

a = norm(p1_14);

b2 = acos((l3^2 - l5^2 - l4^2 + a^2)/(2*l3*a));
radtodeg(b2);

q2 = pi()/2 - b1 - b2;

% CALCULATION OF  q5  REVOLUTE JOINT
q5 = f - q2 - q3;


% revolution by angle q
q = [ radtodeg(q1) radtodeg(q2) radtodeg(q3) radtodeg(q4) radtodeg(q5) radtodeg(q6)]';
% actual wanted position of the end effector
p;
% orientation and position of the end-effector
round(double(subs(forwardKinematics(:,4))),3);

kukaArm % draw the manipulator in 3-d space
hold on
scatter3(p(1),p(2),p(3),'r') % wanted position of the end effector in workspace
