%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Initialisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc

Lb = -5;          % minimum bound of x
Ub = 5;           % maximum bound of x
L = Ub - Lb;    % Length of design space
variance = 0.1 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Optimal value of a Single Variable function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

prompt = 'How many iterations would you like? \n';
evaliter = input(prompt);

% prompt1 = 'We have a function ax^2 + bx, what is the value of a ? \n';
% a = input(prompt1);
% 
% prompt2 = 'What is the value of b ? \n';
% b = input(prompt2);



for iter = 1:evaliter
    
    xa = (L-variance)/2 + Lb;
    xb = (L+variance)/2 + Lb;
    
    sva = SingleVarFcn(xa);
    svb = SingleVarFcn(xb);
    
    if(sva>svb)
        Lb = xa;
    else
        Ub = xb;
    end 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Compute results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Xoptimal = (Lb + Ub) / 2;
fprintf('Optimal value of X is %4.2f \n', Xoptimal);
