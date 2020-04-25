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
            
viscircles([circle(1,1),circle(1,2)],circle(1,3));  % display all obstacles as circles
viscircles([circle(2,1),circle(2,2)],circle(2,3));
viscircles([circle(3,1),circle(3,2)],circle(3,3));
viscircles([circle(4,1),circle(4,2)],circle(4,3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Non-optimal path (using initial positions of intermediate points)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line([A(1),x0(1,1)],[A(2),x0(1,2)],'LineStyle','--');
line([B(1),x0(nbpoints,1)],[B(2),x0(nbpoints,2)],'LineStyle','--');

for iter = 1:(nbpoints-1)
    line([x0(iter,1),x0(iter+1,1)],[x0(iter,2),x0(iter+1,2)],'LineStyle','--');
    plot(x0(iter,1),x0(iter,2),'r*');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Plot points of interest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(A(1),A(2),'g*');
plot(B(1),B(2),'g*');
plot(x0(nbpoints,1),x0(nbpoints,2),'r*');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Optimal path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line([A(1),Xoptimal(1,1)],[A(2),Xoptimal(1,2)],'Color','green','LineWidth',1);

colorarray = ["yellow","green","yellow","green","yellow","green","yellow","green"];
for iter = 1:(nbpoints-1)
    line([Xoptimal(iter,1),Xoptimal(iter+1,1)],[Xoptimal(iter,2),Xoptimal(iter+1,2)],'Color',colorarray(iter),'LineWidth',1);
end
line([B(1),Xoptimal(nbpoints,1)],[B(2),Xoptimal(nbpoints,2)],'Color','green','LineWidth',1);

axis([0 10 0 10]);
nonoptimaldist = objective(x0);
fprintf(" Initial path length was %4.2f",nonoptimaldist);

optimaldist = objective(Xoptimal);
fprintf(" and Final path length is %4.2f ",optimaldist);