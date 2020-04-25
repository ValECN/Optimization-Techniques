function objfcn = objective(X)
% calculate cartesian distance between each of the points and store final
% result in objval which is the total sum of all the individual line
% segment lengths
initialisation;

objfcn = sqrt((X(1) - A(1))^2 + (X(2) - A(2))^2);
objfcn = objfcn + sqrt((X(1) - B(1))^2 + (X(2) - B(2))^2);

end