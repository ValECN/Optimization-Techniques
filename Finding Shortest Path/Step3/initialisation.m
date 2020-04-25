%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Initialisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% desired starting and ending points

A = [1,9];
B = [9,1];

% no. of intermediate points
nbpoints = 6;

% initial values of intermediate points determined by user
x0 = [2,8; 2,6 ; 5,5; 6,2 ; 7,3 ; 8,2  ];

% no.of discretization blocks for each line segment
evaliter = 50;

% tolerance value for obstacle radius
tolerance = 0.1;

% no.of obstacle circles
nbcircles = 1;

% circle data in the format [xcoordinate,ycoordinate,radius] 
circle(1,:) = [2.8,7,0.7];

% boundary conditions for intermediate points 
Lb = [ 0,0 ; 0,0 ; 0,0 ; 0,0 ; 0,0 ];
Ub = [ 10,10 ; 10,10 ; 10,10 ; 10,10 ; 10,10 ];