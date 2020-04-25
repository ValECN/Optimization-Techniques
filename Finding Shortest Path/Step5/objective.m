function objfcn = objective(X)
% calculate cartesian distance between each of the points and store final
% result in objval which is the total sum of all the individual line
% segment lengths
initialisation;

objfcn = sqrt((X(1,1) - A(1))^2 + (X(1,2) - A(2))^2);
for iter = 1:(nbpoints-1)
    objfcn = objfcn + sqrt((X(iter,1) - X(iter+1,1))^2 + (X(iter,2) - X(iter+1,2))^2);
end
objfcn = objfcn + sqrt((X(nbpoints,1) - B(1))^2 + (X(nbpoints,2) - B(2))^2);

end