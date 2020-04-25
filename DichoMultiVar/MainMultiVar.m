%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Initialisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

descentiter = 5;                                                           % max. no.of allowed iterations for descent loops
evaliter = 20;                                                             % max. no.of allowed iterations for dichotomous search of alpha

Lbalpha = 0;                                                               % boundary values of alpha
Ubalpha = 10;
L = Ubalpha - Lbalpha;                                                     % Length of design space

variance = 0.1 ;                                                           % Epsilon value

x10 = 0;                                                                   % initial values of x1 and x2
x20 = 0;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Optimal value of a Multiple Variable function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:descentiter

    grad1 = MultiVarGrad1(x10,x20);                                        % finding gradients at current point
    grad2 = MultiVarGrad2(x10,x20);
    grad = [grad1,grad2];
    descent = -grad;                                                       % finding descent direction 
    
    for j = 1:evaliter                                                     % actual Dichotomous search loop
        
        xa = (L-variance)/2 + Lbalpha;
        xb = (L+variance)/2 + Lbalpha;
        
        mva = MultiVarFcn( x10 + xa*descent(1) , x20 + xa*descent(2) );
        mvb = MultiVarFcn( x10 + xb*descent(1) , x20 + xb*descent(2) );

        if(mva>mvb)
            
            Lbalpha = xa;
            
        else
            
            Ubalpha = xb;
            
        end
        
        L = Ubalpha - Lbalpha;
        
    end
    
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Values of L, alpha x10 and x20 after the descent
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    alpha = (Lbalpha + Ubalpha) / 2;
    x10 = x10 + alpha*descent(1);
    x20 = x20 + alpha*descent(2);

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Display results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Optimal X1 is %4.2f  and Optimal X2 is %4.2f \n',x10,x20);









