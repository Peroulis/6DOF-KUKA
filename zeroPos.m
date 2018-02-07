% Roboti Manipulator in the Zero-Position


figure(1)
%clf(1)
title('\fontsize{20}KUKA manipulator')
grid
xlabel('x')
ylabel('y')
zlabel('z')
lim = 2.5;
xlim([-lim lim])
ylim([-lim lim])
zlim([0 lim])

view([1 1 0.4])
daspect([1 1 1])

l1 = 0.815;
l2 = 0.350;
l3 = 0.850;
l4 = 0.145;
l5 = 0.820;
l6 = 0.170;
le = 0.100;

lineWidth = 3; 
    
    
% INITIAL ROBOTIC MANIPULATOR POSITION
    line([0 0 0],[0 0 0],[0 0 l1],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % first
    line([0 l2 l2],[0 0 0],[l1 l1 l1],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth)
    line([l2 l2 l2],[0 0 0],[l1 l3+l1 l3+l1],'color','b','linewidth',lineWidth) % third link
    line([l2 l2 l2],[0 0 0],[l3+l1 l3+l1+l4 l3+l1+l4],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % forth link
    line([l2 l5+l2 l5+l2],[0 0 0],[l3+l1+l4 l3+l1+l4 l3+l1+l4],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % fifth link
    line([l5+l2 l2+l5+l6 l2+l5+l6],[0 0 0],[l3+l1+l4 l3+l1+l4 l3+l1+l4],'color','b','linewidth',lineWidth) % sixth link
    line([l2+l5+l6 l2+l5+l6+le l2+l5+l6+le],[0 0 0],[l3+l1+l4 l3+l1+l4 l3+l1+l4],'color','r','linewidth',lineWidth) % end-effector
 