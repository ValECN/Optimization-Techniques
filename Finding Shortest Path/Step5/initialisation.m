%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Initialisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% desired starting and ending points

A = [2,8];
B = [8,2];

% no. of intermediate points
nbpoints = 7;

% initial values of intermediate points determined by user
x0 = [2,8; 2,6 ; 4,8 ; 5,5 ; 8,4 ; 6,2 ; 8,2 ];

% no.of discretization blocks for each line segment
evaliter = 50;

% tolerance value for obstacle radius
tolerance = 0.1;

% no.of obstacle circles
nbcircles = 4;

% circle data
circle(1,:) = [2,5,0.8];
circle(2,:) = [3,7,0.5];
circle(3,:) = [7,3,0.75];
circle(4,:) = [8,5,0.75];

% boundary conditions for intermediate points
Lb = [0,0 ; 0,0 ; 4,4 ; 4,4 ; 6,4 ; 6,0 ; 6,0  ];
Ub = [4,10 ; 4,10 ; 4,6 ; 6,6; 6,6 ; 10,10 ; 10,10];