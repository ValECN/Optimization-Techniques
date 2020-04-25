function [g1,g2] = constraints(X)
initialisation;

g2 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discretize each line segment into a no.of points specified by evaliter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line1x = linspace(A(1),X(1,1),evaliter);
line1y = linspace(A(2),X(1,2),evaliter);
for iter= 1 : (nbpoints-1)
    linex(iter,:) = linspace(X(iter,1),X(iter+1,1),evaliter);
    liney(iter,:) = linspace(X(iter,2),X(iter+1,2),evaliter);
end
line7x = linspace(B(1),X(nbpoints,1),evaliter);
line7y = linspace(B(2),X(nbpoints,2),evaliter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Constraint for each circle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for circ = 1:nbcircles
    
    for iter = 1:evaliter
        g1((circ-1)*((nbpoints+1)*evaliter) + iter) = circle(circ,3)*(1+tolerance) - sqrt((line1x(iter) - circle(circ,1))^2 + (line1y(iter) - circle(circ,2))^2);
        g1((circ-1)*((nbpoints+1)*evaliter) + (nbpoints*evaliter)+iter) = circle(circ,3)*(1+tolerance) - sqrt((line7x(iter) - circle(circ,1))^2 + (line7y(iter) - circle(circ,2))^2);
    end

    for pt = 1:(nbpoints-1)
        for iter = 1:evaliter
           g1((circ-1)*((nbpoints+1)*evaliter) + pt*evaliter + iter) = circle(circ,3)*(1+tolerance) - sqrt((linex(pt,iter) - circle(circ,1))^2 + (liney(pt,iter) - circle(circ,2))^2);
        end
    end
end