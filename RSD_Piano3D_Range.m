clear;
close all;

l1=15; %length of each joint
theta=deg2rad(10);

x=0;
p0=[x,0,0];
p1=[x,l1*cos(theta),l1*sin(theta)];

%% plot the range of movement
t1=cputime;
f=figure(1);hold on;grid on;
xlim([0,150]);ylim([0,60]);zlim([0,20]);
xlabel('x');ylabel('y');zlabel('z');
for i=0:1:140
    x=i;
    for k=0:2:10
        theta=deg2rad(k);
        % calculate the position of end effector
        p0=[x,0,0];
        p1=[x,l1*cos(theta),l1*sin(theta)];
        % plot the range of movement
        scatter3(p1(1,1),p1(1,2),p1(1,3),3,"MarkerFaceColor",[0,0,0],"MarkerEdgeColor",[0,0,0]);
        drawnow
    end
end
view(3)
t2=cputime;
disp(t2-t1)