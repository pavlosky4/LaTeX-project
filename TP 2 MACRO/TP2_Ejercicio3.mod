% TP2 - Ejercicio 3 
% 
% Pablo Herrera - Tomás Mendoza - Pablo Ramírez
% 2021

%----------------------------------------------------------------
% 1. Definiendo variables y parametros
%----------------------------------------------------------------

var y c k i h A d tb ca g;
varexo e1 e2;
parameters alpha delta rho1 rho2 omega beta phi psi dbar rstar sigma eta;

%----------------------------------------------------------------
% 2. Calibracion
%----------------------------------------------------------------

alpha  = 0.32;
delta  = .1;
rho1  = 0.42;
rho2 = 0.2;
sigma = 2;
eta  = 0.0129; 
rstar = .04;
beta   = 1/(1+rstar);
omega = 1.455;
phi = .028;
dbar = 0.7442;
psi = 0.000742;


%----------------------------------------------------------------
% 3. Modelo
%----------------------------------------------------------------

model;
  h^(omega-1) = (1-alpha)*(y/h);  %(2)

  (c-(h^omega)/omega)^(-sigma) = beta*((c(1)-(h(1)^omega)/omega)^(-sigma))*(alpha*(y(+1)/k)+1-delta+phi*(k(1)-k))/(1+phi*(k-k(-1))); %(4)

(c-(h^omega)/omega)^(-sigma) = beta*((c(1)-(h(1)^omega)/omega)^(-sigma))*
(1+rstar+psi*(exp(d-dbar)-1)); %(3)
 
 c+i+(phi/2)*(k-k(-1))^2+(1+rstar+psi*(exp(d(-1)-dbar)-1))*d(-1) + g = y+d; %(5)

  y = A*(k(-1)^alpha)*(h^(1-alpha));

  k = i+(1-delta)*k(-1);
  

  log(A) = rho1*log(A(-1))+e1;
  
  g = rho2*g(-1)+e2;

 tb = y-c-i-(phi/2)*(k-k(-1))^2 - g;

 ca = tb-(rstar+psi*(exp(d(-1)-dbar)-1))*d(-1);
end;

%----------------------------------------------------------------
% 4. Computacion
%----------------------------------------------------------------

initval;
  k = 5;
  c = 1.12;
  h = 1.0074;
  d = 0.7442;
  A = 1; 
  e1 = 0;
  e2 = 0;
  g = 1;
end;

shocks;
var e1 = eta^2;
var e2 = eta^2 ; 
end;

%resid

steady;

%check;

stoch_simul(order = 1, irf=40);

%----------------------------------------------------------------
% 5. Resultados
%----------------------------------------------------------------

statistic1 = 100*sqrt(diag(oo_.var(1:6,1:6)))./oo_.mean(1:6);
dyntable(options_,'Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),M_.endo_names(1:6,:),statistic1,10,8,4);
sigmac_sigmay = statistic1(2)/statistic1(1)
