function RSD_USB3D_Sim()
% Simulator for USB Robot 🄫RYUJI IMAI 2023/5/23
disp('-----------------------------------------------------')
disp('  Press ←or→ to rotate joint1')
disp('  Press ↑or↓ to rotate joint2')
disp('  Press  1or2 to rotate joint3')
disp('  if You press "s", Show the Position of End effector')
disp('-----------------------------------------------------')
l1=30;l2=30;l3=30; %length of each joint
theta1=deg2rad(0);theta2=deg2rad(90);theta3=deg2rad(0);
fig = figure;
axis equal;

p0=[0,0,0];
p1=[0,0,l1];
p2=[p1(1,1)+l2*sin(theta2)*cos(theta1),p1(1,2)+l2*sin(theta2)*sin(theta1),p1(1,3)+l2*cos(theta2)];
p3=[p2(1,1)+l3*sin(theta2+theta3)*cos(theta1),p2(1,2)+l3*sin(theta2+theta3)*sin(theta1),p2(1,3)+l3*cos(theta2+theta3)];

scatter3(p0(1,1),p0(1,2),p0(1,3));hold on
scatter3(p1(1,1),p1(1,2),p1(1,3));
scatter3(p2(1,1),p2(1,2),p2(1,3));
scatter3(p3(1,1),p3(1,2),p3(1,3));
plot3([p0(1,1),p1(1,1)],[p0(1,2),p1(1,2)],[p0(1,3),p1(1,3)],'linewidth',2);
plot3([p1(1,1),p2(1,1)],[p1(1,2),p2(1,2)],[p1(1,3),p2(1,3)],'linewidth',2);
plot3([p2(1,1),p3(1,1)],[p2(1,2),p3(1,2)],[p2(1,3),p3(1,3)],'linewidth',2);
xlim([-60,60]);ylim([-60,60]);zlim([0,60]);
xlabel('x');ylabel('y');zlabel('z');

fig.KeyPressFcn = @callback;
  function callback(src,data)
    if strcmp(data.Key,'leftarrow')
        temp=theta1;
        theta1=temp+deg2rad(3);
    elseif strcmp(data.Key,'rightarrow')
        temp=theta1;
        theta1=temp-deg2rad(3);
    elseif strcmp(data.Key,'downarrow')
        temp=theta2;
        theta2=temp+deg2rad(3);
    elseif strcmp(data.Key,'uparrow')
        temp=theta2;
        theta2=temp-deg2rad(3);
    elseif strcmp(data.Key,'1')
        temp=theta3;
        theta3=temp+deg2rad(3);
    elseif strcmp(data.Key,'2')
        temp=theta3;
        theta3=temp-deg2rad(3);
    elseif strcmp(data.Key,'s')
        disp(['x=',num2str(p3(1,1)),',  y=',num2str(p3(1,2)),',  z=',num2str(p3(1,3))])
    end
        p0=[0,0,0];
        p1=[0,0,l1];
        p2=[p1(1,1)+l2*sin(theta2)*cos(theta1),p1(1,2)+l2*sin(theta2)*sin(theta1),p1(1,3)+l2*cos(theta2)];
        p3=[p2(1,1)+l3*sin(theta2+theta3)*cos(theta1),p2(1,2)+l3*sin(theta2+theta3)*sin(theta1),p2(1,3)+l3*cos(theta2+theta3)];
        hold off
        scatter3(p0(1,1),p0(1,2),p0(1,3));hold on
        scatter3(p1(1,1),p1(1,2),p1(1,3));
        scatter3(p2(1,1),p2(1,2),p2(1,3));
        scatter3(p3(1,1),p3(1,2),p3(1,3));
        plot3([p0(1,1),p1(1,1)],[p0(1,2),p1(1,2)],[p0(1,3),p1(1,3)],'linewidth',2);
        plot3([p1(1,1),p2(1,1)],[p1(1,2),p2(1,2)],[p1(1,3),p2(1,3)],'linewidth',2);
        plot3([p2(1,1),p3(1,1)],[p2(1,2),p3(1,2)],[p2(1,3),p3(1,3)],'linewidth',2);
        xlim([-60,60]);ylim([-60,60]);zlim([0,60]);
        xlabel('x');ylabel('y');zlabel('z');
  end
end