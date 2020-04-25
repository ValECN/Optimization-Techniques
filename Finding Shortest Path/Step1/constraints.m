function [g1,g2] = constraints(X)
initialisation;

g2 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discretize each line segment into a no.of points specified by evaliter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line1x = linspace(A(1),X(1),evaliter);
line1y = linspace(A(2),X(2),evaliter);

line2x = linspace(B(1),X(1),evaliter);
line2y = linspace(B(2),X(2),evaliter);

  
for i = 1:evaliter
    g1(i) = circle(1,3)*(1+tolerance) - sqrt((line1x(i) - circle(1,1))^2 + (line1y(i) - circle(1,2))^2);
    g1(evaliter + i) = circle(1,3)*(1+tolerance) - sqrt((line2x(i) - circle(1,1))^2 + (line2y(i) - circle(1,2))^2);
end

end