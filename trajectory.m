% TRAJECTORY
% clc, clear
% Figure 3 : Plot of the start-finish points in 3d space and in second 
% time plot the trajectory
figure(3)
clf(3)
title('\fontsize{15}TRAJECTORY 3D SPACE')
hold on
grid

xlabel('x')
ylabel('y')
zlabel('z')

lim = 1.8;
xlim([0 lim])
ylim([-lim 0])
zlim([0.5 lim])

view([3 0.5 0.3])
daspect([1 1 1])

d = 1.4;
d2 = 1.2;

point = [d*cos(degtorad(30)) ; -d*sin(degtorad(30)) ; d];
point2 = [d2*cos(degtorad(30)) ; -d2*sin(degtorad(30)) ; d2];

scatter3(point(1),point(2),point(3))
scatter3(point2(1),point2(2),point2(3),'r')
% END OF THE START-FINISH POINT PLOTTING
%------------------------------------------------------
% CALCULATE THE VELOCITIES - ACCELERATIONS

spaces = 20; %20 % ------ points to the trajectory -------
t = linspace(0,10,spaces);

endoftime = spaces/4; %4
t1 = endoftime;
t2 = 3*endoftime;

acce = 0.002;
acce_x = acce*cos(degtorad(30));
acce_y = acce*sin(degtorad(30));
acce_z = acce;

% --------   acceleration x
for tm = 1:spaces
    accx(tm) = -0.2*acce_x*t(tm) + acce_x;
end
% --------   velocity x
for tm = 1:spaces
    vx(tm) = -0.1*acce_x*t(tm)^2 + acce_x*t(tm);
end

% --------   acceleration y
for tm = 1:spaces
    accy(tm) = -0.2*acce_y*t(tm) + acce_y;
end
% --------   velocity y
for tm = 1:spaces
    vy(tm) = -0.1*acce_y*t(tm)^2 + acce_y*t(tm);
end

% --------   acceleration z
for tm = 1:spaces
    accz(tm) = -0.2*acce_z*t(tm) + acce_z;
end
% --------   velocity z
for tm = 1:spaces
    vz(tm) = -0.1*acce_z*t(tm)^2 + acce_z*t(tm);
end

figure(8)
clf(8)
hold on
title('\fontsize{15}Velocities - Accelerations')
grid
plot(t,accx,'b')
plot(t,accy,'r')
plot(t,accz,'k')
plot(t,vx,'b--')
plot(t,vy,'r--')
plot(t,vz,'k--')
legend('\alpha_{x}','\alpha_{y}','\alpha_{z}','vx','vy','vz')
% END OF THE CALCULATION OF VELOCITIES-ACCELERATIONS
%------------------------------------------------------
% CALCULATE THE INDIVIDUAL TRAJECTORIES
% Calculate x trajectory
p1 = point(1);
p2 = point2(1);

ts = 0;
tf = 10;
quint = inv([   1 ts ts^2   ts^3    ts^4    ts^5 ; 
                0 1  2*ts   3*ts^2  4*ts^3  5*ts^4 ;
                0 0  2      6*ts    12*ts^2 20*ts^3 ;
                1 tf tf^2   tf^3    tf^4    tf^5 ;
                0 1  2*tf   3*tf^2  4*tf^3  5*tf^4 ;
                0 0  2      6*tf    12*tf^2 20*tf^3 ]);
for tm = 1:spaces
    quint2 = [ p1 ; vx(tm) ; accx(tm) ; p2 ; vx(tm) ; accx(tm)];
    alphas = quint*quint2;
    a0 = alphas(1);
    a1 = alphas(2); 
    a2 = alphas(3); 
    a3 = alphas(4); 
    a4 = alphas(5);
    a5 = alphas(6);
    traj(tm,1) = a0 + a1*t(tm) + a2*t(tm)^2 + a3*t(tm)^3 + a4*t(tm)^4 + a5*t(tm)^5;
end
% Calculate y trajectory
p1 = point(2);
p2 = point2(2);
for tm = 1:spaces
    quint2 = [ p1 ; vy(tm) ; accy(tm) ; p2 ; vy(tm) ; accy(tm)];
    alphas = quint*quint2;
    a0 = alphas(1);
    a1 = alphas(2); 
    a2 = alphas(3); 
    a3 = alphas(4); 
    a4 = alphas(5);
    a5 = alphas(6);
    traj(tm,2) = a0 + a1*t(tm) + a2*t(tm)^2 + a3*t(tm)^3 + a4*t(tm)^4 + a5*t(tm)^5;
end
% Calculate z trajectory
p1 = point(3);
p2 = point2(3);
for tm = 1:spaces
    quint2 = [ p1 ; vz(tm) ; accz(tm) ; p2 ; vz(tm) ; accz(tm)];
    alphas = quint*quint2;
    a0 = alphas(1);
    a1 = alphas(2); 
    a2 = alphas(3); 
    a3 = alphas(4); 
    a4 = alphas(5);
    a5 = alphas(6);
    traj(tm,3) = a0 + a1*t(tm) + a2*t(tm)^2 + a3*t(tm)^3 + a4*t(tm)^4 + a5*t(tm)^5;
end
% END OF CALCULATION OF THE INDIVIDUAL TRAJECTORIES
%------------------------------------------------------

% Plot the individual trajectories 
%   x trajectory
%   y trajectory
%   z trajectory

x = traj(:,1);
y = traj(:,2);
z = traj(:,3);
figure(4)
clf(4)
title('\fontsize{15}TRAJECTORIES \fontsize{15} x  y  z 2D SPACE')
hold on
grid
plot(t,traj)
legend('x','y','z')

% Plot the trajectory on the 3d space
figure(3)
s = 0.5;
for i = 1:spaces
    scatter3(traj(i,1),traj(i,2),traj(i,3),s,'k')
end

v = [vx ; vy ; vz];






