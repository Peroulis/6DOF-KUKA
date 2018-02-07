% start the programm
clear,clc
clf
disp('Loading workspace')
disp('Loading KUKA manipulator in zero - position')
disp('Loading trajectory and plotting in figure 3')
disp(' ')
% load the workspace
workplace
% load the robotic manipulator in the zero-position
kukaManipulator
save('kukaM.mat')
p = [l2+l5+l6+le ; 0 ; l1 + l3 + l4];
inverseKinematics(p,0,0);
% Define the trajectory and plot
trajectory
figure(1)
disp('Push a Button to continue')
disp(' ')
pause
% Place the robotic Manipulator in point P1
p = [traj(1,1) ; traj(1,2) ; traj(1,3)];
inverseKinematics(p,45,30);
disp('Loading KUKA manipulator in workspace placement - P1')
disp(' ')
disp('Push a Button to continue')
disp(' ')
pause
% Place the robotic Manipulator in point P2
%{
p = [traj(20,1) ; traj(20,2) ; traj(20,3)];
inverseKinematics(p,45,30);
disp('Loading KUKA manipulator in workspace placement - P2')
disp(' ')
disp('Push a Button to continue')
disp(' ')
pause
%}
disp('Wait for the calculations...')
disp('Animation is shown in figure 1')
disp('Approximately 12 sec / 16GB RAM / Intel Core i7-6700 @3.4GHz / 64 bit')
disp(' ')
% Place the robotic Manipulator in Point P2 
%{
p = [traj(100,1) ; traj(100,2) ; traj(100,3)];
inverseKinematics(p,45,30)
pause
%}

% Follow the trajectory
space = linspace(0,10,20);

tic
for j = 1:20 % ----- variable: spaces (# of trajectory points - in trajectory.m)
    p = [traj(j,1) ; traj(j,2) ; traj(j,3)];
    revoluteAngle(:,j) = inverseKinematics(p,45,30);
    [ee_l_v(:,j) ee_a_v(:,j) pomega(:,j)] = kukaJacobian(revoluteAngle(:,j),space(j),v(:,j));
    pause(1/60)
end
% Time to complete the calculations - NOT the time to perform the motion
toc % 12 sec / 16GB RAM / Intel Core i7-6700 @3.4GHz / 64 bit

figure(2)
clf(2)
hold on
title('\fontsize{15}Joint angles')
grid
plot(space,revoluteAngle(2,:))
plot(space,revoluteAngle(3,:))
plot(space,revoluteAngle(5,:))
legend('q2','q3','q5')

figure(5)
clf(5)
title('\fontsize{15}Joint Velocities')
hold on
grid
plot(space,pomega(2,:))
plot(space,pomega(3,:))
plot(space,pomega(5,:))
legend('\cdot{q2}','\cdot{q3}','\cdot{q5}')

figure(6)
clf(6)
ylim([-3*10^(-2) 3*10^(-2)])
title('\fontsize{15}End-Effector Linear Velocity')
hold on
grid
plot(space,ee_l_v(1,:),'--')
plot(space,ee_l_v(2,:),'--')
plot(space,ee_l_v(3,:),'*')
legend('\cdot{px}','\cdot{py}','\cdot{pz}')

figure(7)
clf(7)
ylim([-6*10^(-2) 6*10^(-2)])
title('\fontsize{15}End-Effector Angular Velocity')
hold on
grid
plot(space,ee_a_v(1,:))
plot(space,ee_a_v(2,:))
plot(space,ee_a_v(3,:))
legend('{\omega{x}}','{\omega{y}}','{\omega{z}}')




