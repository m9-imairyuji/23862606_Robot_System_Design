function RSD_Piano3D_Sim()
% Simulator for Piano Robot 🄫RYUJI IMAI 2023/5/23
disp('-----------------------------------------------------')
disp('  Press ←or→ to move joint1')
disp('  Press ↑or↓ to tap keyboard')
disp('  if You press "s", Show the Position of End effector')
disp('-----------------------------------------------------')
l1=15; %length of each joint
theta=deg2rad(10);
fig = figure;
axis equal;

x=0;
p0=[x,0,0];
p1=[x,l1*cos(theta),l1*sin(theta)];

scatter3(p0(1,1),p0(1,2),p0(1,3));hold on
scatter3(p1(1,1),p1(1,2),p1(1,3));
plot3([p0(1,1),p1(1,1)],[p0(1,2),p1(1,2)],[p0(1,3),p1(1,3)],'linewidth',2);

xlim([0,150]);ylim([0,20]);zlim([0,20]);
xlabel('x');ylabel('y');zlabel('z');

fig.KeyPressFcn = @callback;
  function callback(src,data)
    if strcmp(data.Key,'leftarrow')
        temp=x;
        x=temp-1;
    elseif strcmp(data.Key,'rightarrow')
        temp=x;
        x=temp+1;
    elseif strcmp(data.Key,'downarrow')
        theta=deg2rad(0);
    elseif strcmp(data.Key,'uparrow')
        temp=theta;
        temp=deg2rad(10);
        theta=temp;
    elseif strcmp(data.Key,'s')
        disp(['x=',num2str(p1(1,1)),',  y=',num2str(p1(1,2)),',  z=',num2str(p1(1,3))])
    end
        p0=[x,0,0];
        p1=[x,l1*cos(theta),l1*sin(theta)];
        hold off
        scatter3(p0(1,1),p0(1,2),p0(1,3));hold on
        scatter3(p1(1,1),p1(1,2),p1(1,3));
        plot3([p0(1,1),p1(1,1)],[p0(1,2),p1(1,2)],[p0(1,3),p1(1,3)],'linewidth',2);
        xlim([0,150]);ylim([0,60]);zlim([0,20]);
        xlabel('x');ylabel('y');zlabel('z');
  end
end