function [residual, g1, g2, g3] = TP2_Ejercicio3_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 10, 1);

%
% Model equations
%

T21 = y(2)-y(5)^params(5)/params(5);
T24 = T21^(-params(11));
T32 = 1+params(1)*y(1)/y(3)-params(2);
T58 = y(3)^params(1);
T59 = y(6)*T58;
T60 = y(5)^(1-params(1));
lhs =y(5)^(params(5)-1);
rhs =(1-params(1))*y(1)/y(5);
residual(1)= lhs-rhs;
lhs =T24;
rhs =T24*params(6)*T32;
residual(2)= lhs-rhs;
lhs =T24;
rhs =T24*params(6)*(1+params(10)+params(8)*(exp(y(7)-params(9))-1));
residual(3)= lhs-rhs;
lhs =y(2)+y(4)+y(7)*(1+params(10)+params(8)*(exp(y(7)-params(9))-1))+y(10);
rhs =y(1)+y(7);
residual(4)= lhs-rhs;
lhs =y(1);
rhs =T59*T60;
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(4)+y(3)*(1-params(2));
residual(6)= lhs-rhs;
lhs =log(y(6));
rhs =log(y(6))*params(3)+x(1);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(4)+x(2);
residual(8)= lhs-rhs;
lhs =y(8);
rhs =y(1)-y(2)-y(4)-y(10);
residual(9)= lhs-rhs;
lhs =y(9);
rhs =y(8)-y(7)*(params(10)+params(8)*(exp(y(7)-params(9))-1));
residual(10)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

T95 = getPowerDeriv(T21,(-params(11)),1);
T120 = T95*(-(getPowerDeriv(y(5),params(5),1)/params(5)));
  g1(1,1)=(-((1-params(1))*1/y(5)));
  g1(1,5)=getPowerDeriv(y(5),params(5)-1,1)-(1-params(1))*(-y(1))/(y(5)*y(5));
  g1(2,1)=(-(T24*params(6)*params(1)*1/y(3)));
  g1(2,2)=T95-T32*params(6)*T95;
  g1(2,3)=(-(T24*params(6)*params(1)*(-y(1))/(y(3)*y(3))));
  g1(2,5)=T120-T32*params(6)*T120;
  g1(3,2)=T95-(1+params(10)+params(8)*(exp(y(7)-params(9))-1))*params(6)*T95;
  g1(3,5)=T120-(1+params(10)+params(8)*(exp(y(7)-params(9))-1))*params(6)*T120;
  g1(3,7)=(-(T24*params(6)*params(8)*exp(y(7)-params(9))));
  g1(4,1)=(-1);
  g1(4,2)=1;
  g1(4,4)=1;
  g1(4,7)=1+params(10)+params(8)*(exp(y(7)-params(9))-1)+y(7)*params(8)*exp(y(7)-params(9))-1;
  g1(4,10)=1;
  g1(5,1)=1;
  g1(5,3)=(-(T60*y(6)*getPowerDeriv(y(3),params(1),1)));
  g1(5,5)=(-(T59*getPowerDeriv(y(5),1-params(1),1)));
  g1(5,6)=(-(T58*T60));
  g1(6,3)=1-(1-params(2));
  g1(6,4)=(-1);
  g1(7,6)=1/y(6)-params(3)*1/y(6);
  g1(8,10)=1-params(4);
  g1(9,1)=(-1);
  g1(9,2)=1;
  g1(9,4)=1;
  g1(9,8)=1;
  g1(9,10)=1;
  g1(10,7)=params(10)+params(8)*(exp(y(7)-params(9))-1)+y(7)*params(8)*exp(y(7)-params(9));
  g1(10,8)=(-1);
  g1(10,9)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,1000);
end
end
end
end
