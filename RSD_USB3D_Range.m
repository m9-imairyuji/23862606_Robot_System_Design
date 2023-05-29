clear;
close all;

l1=30;l2=30;l3=30; %length of each joint
theta1=deg2rad(60);theta2=deg2rad(90);theta3=deg2rad(0);

p0=[0,0,0];
p1=[0,0,l1];
p2=[p1(1,1)+l2*sin(theta2)*cos(theta1),p1(1,2)+l2*sin(theta2)*sin(theta1),p1(1,3)+l2*cos(theta2)];
p3=[p2(1,1)+l3*sin(theta2+theta3)*cos(theta1),p2(1,2)+l3*sin(theta2+theta3)*sin(theta1),p2(1,3)+l3*cos(theta2+theta3)];

%% plot the range of movement
t1=cputime;
f=figure(1);hold on;grid on;
xlim([-60,60]);ylim([-60,60]);zlim([0,1]);
xlabel('x');ylabel('y');zlabel('z');
for i=-90:30:0
    theta1=deg2rad(i);
    for d=-120:5:120
        theta2=deg2rad(d);
        for k=-120:5:120
            theta3=deg2rad(k);
            % calculate the position of end effector
            p0=[0,0,0];
            p1=[0,0,l1];
            p2=[p1(1,1)+l2*sin(theta2)*cos(theta1),p1(1,2)+l2*sin(theta2)*sin(theta1),p1(1,3)+l2*cos(theta2)];
            p3=[p2(1,1)+l3*sin(theta2+theta3)*cos(theta1),p2(1,2)+l3*sin(theta2+theta3)*sin(theta1),p2(1,3)+l3*cos(theta2+theta3)];
            % plot the range of movement
            scatter3(p3(1,1),p3(1,2),p3(1,3),3,"MarkerFaceColor",[0,0,0],"MarkerEdgeColor",[0,0,0]);
        end
    end
end
view(3)
t2=cputime;
disp(t2-t1)