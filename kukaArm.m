%kukaArm

figure(1)
clf(1)

workplace % design the workplace

lim = 2.5;
xlim([-lim lim])
ylim([-lim lim])
zlim([0 lim])

view([1 1 0.4])
daspect([1 1 1])

view([0.8 1 0.3])
daspect([1 1 1])

l1 = 0.815;
l2 = 0.350;
l3 = 0.850;
l4 = 0.145;
l5 = 0.820;
l6 = 0.170;
le = 0.100;


lineWidth = 3; 
    line([0 0 0],[0 0 0],[0 0 l1],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % first
    
    % INITIAL ROBOTIC MANIPULATOR POSITION
    %{
    line([0 l2 l2],[0 0 0],[l1 l1 l1],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth)
    line([l2 l2 l2],[0 0 0],[l1 l3+l1 l3+l1],'color','b','linewidth',lineWidth) % third link
    line([l2 l2 l2],[0 0 0],[l3+l1 l3+l1+l4 l3+l1+l4],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % forth link
    line([l2 l5+l2 l5+l2],[0 0 0],[l3+l1+l4 l3+l1+l4 l3+l1+l4],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % fifth link
    line([l5+l2 l2+l5+l6 l2+l5+l6],[0 0 0],[l3+l1+l4 l3+l1+l4 l3+l1+l4],'color','b','linewidth',lineWidth) % sixth link
    line([l2+l5+l6 l2+l5+l6+le l2+l5+l6+le],[0 0 0],[l3+l1+l4 l3+l1+l4 l3+l1+l4],'color','r','linewidth',lineWidth) % end-effector
%}   
    
    grid
    xlabel('x')
    ylabel('y')
    zlabel('z')
 
   q1 = degtorad(q(1));
   q2 = degtorad(q(2));
   q3 = degtorad(q(3));
   q5 = degtorad(q(5));
   
A01 = subs(A01);
A02 = subs(A02);
A03 = subs(A03);
A04 = subs(A04);
A05 = subs(A05);
A06 = subs(A06);
A0E = subs(A0E);

% ROBOTIC MANIPULATOR POSITION
line([0 A01(1,4) A01(1,4)],[0 A01(2,4) A01(2,4)],[A01(3,4) A01(3,4) A01(3,4)],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % second
line([A01(1,4) A02(1,4) A02(1,4)],[A01(2,4) A02(2,4) A02(2,4)],[l1 A02(3,4) A02(3,4)],'color','b','linewidth',lineWidth) % third link
line([A02(1,4) A03(1,4) A03(1,4)],[ A02(2,4) A03(2,4) A03(2,4)],[A02(3,4) A03(3,4) A03(3,4)],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % forth link
line([A03(1,4) A04(1,4) A04(1,4)],[A03(2,4) A04(2,4) A04(2,4)],[A03(3,4) A04(3,4) A04(3,4)],'color',[0.9290, 0.6940, 0.1250],'linewidth',lineWidth) % fifth link
line([A04(1,4) A05(1,4) A05(1,4)],[A04(2,4) A05(2,4) A05(2,4)],[A04(3,4) A05(3,4) A05(3,4)],'color','r','linewidth',lineWidth) % sixth link
line([A05(1,4) A0E(1,4) A0E(1,4)],[A05(2,4) A0E(2,4) A0E(2,4)],[A05(3,4) A0E(3,4) A0E(3,4)],'color','c','linewidth',lineWidth) % end-effector    
