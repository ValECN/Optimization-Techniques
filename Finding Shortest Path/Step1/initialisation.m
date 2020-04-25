%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Initialisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% desired starting and ending points

A = [2,8];
B = [8,2];

% initial value of x

x0 = [5,2];

% nb.of discretization blocks for each line segment

evaliter = 50;

% tolerance value for obstacle radius

tolerance = 0.1;

% no.of obstacle circles

ncircles = 1;

% circle data in the format [xcoordinate,ycoordinate,radius] 

circle(1,:) = [4,6,0.9];

% boundary conditions for intermediate point

Lb = [ 0,0 ];
Ub = [ 10,10 ];