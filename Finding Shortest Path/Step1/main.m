clear all;
close all;
initialisation;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Getting the optimal path coordinates from the objective and constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic;                    % start of timer
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
Xoptimal = fmincon('objective',x0,[], [], [], [], Lb, Ub, 'constraints',options);
toc;                    % end of timer
figure
grid on
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Display all obstacles as circle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
viscircles([circle(1,1),circle(1,2)],circle(1,3));  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Non-optimal path (using initial positions of intermediate points)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
line([A(1),x0(1)],[A(2),x0(2)],'LineStyle','--');
line([B(1),x0(1)],[B(2),x0(2)],'LineStyle','--');

axis([0 10 0 10]);
nonoptimaldist = objective(x0);

fprintf(" Initial path length was %4.2f",nonoptimaldist);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot points of interest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(x0(1),x0(2),'r*');
plot(A(1),A(2),'g*');
plot(B(1),B(2),'g*');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Optimal path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line([A(1),Xoptimal(1)],[A(2),Xoptimal(2)],'Color','green','LineWidth',1);
line([B(1),Xoptimal(1)],[B(2),Xoptimal(2)],'Color','green','LineWidth',1);

optimaldist = objective(Xoptimal);
fprintf(" and Final path length is %4.2f ",optimaldist);