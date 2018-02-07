% Design of the workplace 
figure(1)
clf(1)
% kukaArm

table_h = 0.2;  % dimensions of the workplace
table_w = 0.2;

height = 1.2; % workplace height
dist = 1.4;  % distance of the workplace in responce to the robot revolute axis q1

ang = degtorad(30); % angle of the workplace in responce to the robot revolute axis q1

lineWidth = 1;
line([(dist-table_w)*cos(ang) (dist)*cos(ang) (dist)*cos(ang)],...
    [-(dist-table_w)*sin(ang) -(dist)*sin(ang) -(dist)*sin(ang)],...
    [height height+table_h height+table_h],'color','k','linewidth',lineWidth) % work table