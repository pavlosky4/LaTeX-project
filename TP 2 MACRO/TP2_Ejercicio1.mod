% TP2 - Ejercicio 1 
% 
% Pablo Herrera - Tomás Mendoza - Pablo Ramírez
% 2021
%----------------------------------------------------------------
% 1. Definiendo variables y parametros
%----------------------------------------------------------------

var y c k n q omega r d z;
varexo e1 e2;
parameters alpha delta rho1 rho2 eta beta phi psi dbar rstar  sigma1 sigma2;

%----------------------------------------------------------------
% 2. Calibracion
%----------------------------------------------------------------

alpha  = 0.32;
delta  = .025;
rho1 = 0.4;
rho2 = 0.2;
eta  = 1.5; 
rstar = 1/0.99-1;
beta   = 0.99;
phi = .1;
dbar = 0.01;
psi = 0.0001;
sigma1 = 0.005;
sigma2 = 0.001;


%----------------------------------------------------------------
% 3. Modelo
%----------------------------------------------------------------

model;
y = omega*(k(-1)^alpha)*(n^(1-alpha)); %8'
  (z/c)*((1-alpha)/(1+phi*r/(1+r)))*(y/n)=eta;  %1'

 z/c = beta*(z(1)/c(1))*(alpha*y(1)/k + 1 - delta); %2'

z/c = beta*(z(1)/q + z(1)/c(1)) ; %3'
 
 z/c = beta*(z(1)/c(1))*(1+r); %4'

 c+k-(1-delta)*k(-1)+q-q(-1)+(1+r(-1))*d(-1)-d = ((1-alpha)/(1+phi*r/(1+r)))*(y/n)*k(-1)+(alpha*y(1)/k)*n; %5'
 
  log(omega) = rho1*log(omega(-1))+e1; %6'
  
  log(z) = rho2*log(z(-1))+e2; %7'
  
  r = (rstar+psi*(exp(d-dbar)-1)); %9'

 %tb = y-c-i-(phi/2)*(k-k(-1))^2;
%i= -k +(1-delta)*k(-1)
 %ca = tb-(rstar+psi*(exp(d(-1)-dbar)-1))*d(-1);
end;

%----------------------------------------------------------------
% 4. Computacion
%----------------------------------------------------------------

initval;
  k = 8.25;
  c = 0.48;
  n = 0.32;
  d = 0.01;
  omega = 1; 
  e1 = 0;
  e2=0;
  q=26.7;
  r=rstar;
  z=1;
  y=0.9;
end;

shocks;
var e1 = sigma1^2;
var e2 = sigma2^2;
end;

%resid

steady;

%check;

stoch_simul(order = 1, irf=10);

%----------------------------------------------------------------
% 5. Resultados
%----------------------------------------------------------------

statistic1 = 100*sqrt(diag(oo_.var(1:6,1:6)))./oo_.mean(1:6);
dyntable(options_,'Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),M_.endo_names(1:6,:),statistic1,10,8,4);
sigmac_sigmay = statistic1(2)/statistic1(1)
