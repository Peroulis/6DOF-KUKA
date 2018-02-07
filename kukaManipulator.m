l1 = 0.815;
l2 = 0.350;
l3 = 0.850;
l4 = 0.145;
l5 = 0.820;
l6 = 0.170;
le = 0.100;

syms q2 q3 q5 q1
q4 = 0;
q6 = 0;

origins = 8;

DHParameters = [-q1        0            pi()      0;
                 0          -l1         pi()/2    l2;
                 q2-pi()/2  0           0         l3;
                 q3         0           pi()/2    l4;
                 q4         -l5         -pi()/2   0  ;
                 q5         0           pi()/2    0 
                 q6+pi()/2  0           pi()/2    0
                 -pi()/2    0           0         l6+le];

forwardKinematics = eye(4);
for i = 1:origins
    forwardKinematics = forwardKinematics*homogeneous(DHParameters(i,:));
end
forwardKinematics;

A00_ = homogeneous(DHParameters(1,:)); % augmented frame , rotation by q1
A0_1 = homogeneous(DHParameters(2,:));
A12 = homogeneous(DHParameters(3,:));
A23 = homogeneous(DHParameters(4,:));
A34 = homogeneous(DHParameters(5,:));
A45 = homogeneous(DHParameters(6,:));
A56 = homogeneous(DHParameters(7,:));
A6E = homogeneous(DHParameters(8,:)); % augmented frame
% ...
A00_;
A01 = A00_*A0_1;
A02 = A01*A12;
A03 = A02*A23;
A04 = A03*A34;
A05 = A04*A45;
A06 = A05*A56;
A0E = A06*A6E;
