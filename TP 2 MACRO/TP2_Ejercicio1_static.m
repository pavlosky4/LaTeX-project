function [residual, g1, g2, g3] = TP2_Ejercicio1_static(y, x, params)
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

residual = zeros( 9, 1);

%
% Model equations
%

T12 = y(3)^params(1);
T13 = y(6)*T12;
T16 = y(4)^(1-params(1));
T21 = y(9)/y(2);
T27 = 1+params(7)*y(7)/(1+y(7));
T28 = (1-params(1))/T27;
T30 = y(1)/y(4);
T40 = 1+y(1)*params(1)/y(3)-params(2);
lhs =y(1);
rhs =T13*T16;
residual(1)= lhs-rhs;
lhs =T21*T28*T30;
rhs =params(5);
residual(2)= lhs-rhs;
lhs =T21;
rhs =T21*params(6)*T40;
residual(3)= lhs-rhs;
lhs =T21;
rhs =params(6)*(T21+y(9)/y(5));
residual(4)= lhs-rhs;
lhs =T21;
rhs =(1+y(7))*T21*params(6);
residual(5)= lhs-rhs;
lhs =y(5)+y(3)+y(2)-y(3)*(1-params(2))-y(5)+(1+y(7))*y(8)-y(8);
rhs =y(3)*T28*T30+y(4)*y(1)*params(1)/y(3);
residual(6)= lhs-rhs;
lhs =log(y(6));
rhs =log(y(6))*params(3)+x(1);
residual(7)= lhs-rhs;
lhs =log(y(9));
rhs =log(y(9))*params(4)+x(2);
residual(8)= lhs-rhs;
lhs =y(7);
rhs =params(10)+params(8)*(exp(y(8)-params(9))-1);
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

T98 = (-y(9))/(y(2)*y(2));
T147 = (-((1-params(1))*(params(7)*(1+y(7))-params(7)*y(7))/((1+y(7))*(1+y(7)))))/(T27*T27);
T157 = 1/y(2);
  g1(1,1)=1;
  g1(1,3)=(-(T16*y(6)*getPowerDeriv(y(3),params(1),1)));
  g1(1,4)=(-(T13*getPowerDeriv(y(4),1-params(1),1)));
  g1(1,6)=(-(T12*T16));
  g1(2,1)=T21*T28*1/y(4);
  g1(2,2)=T30*T28*T98;
  g1(2,4)=T21*T28*(-y(1))/(y(4)*y(4));
  g1(2,7)=T30*T21*T147;
  g1(2,9)=T30*T28*T157;
  g1(3,1)=(-(T21*params(6)*params(1)/y(3)));
  g1(3,2)=T98-T40*params(6)*T98;
  g1(3,3)=(-(T21*params(6)*(-(y(1)*params(1)))/(y(3)*y(3))));
  g1(3,9)=T157-T40*params(6)*T157;
  g1(4,2)=T98-params(6)*T98;
  g1(4,5)=(-(params(6)*(-y(9))/(y(5)*y(5))));
  g1(4,9)=T157-params(6)*(T157+1/y(5));
  g1(5,2)=T98-(1+y(7))*params(6)*T98;
  g1(5,7)=(-(T21*params(6)));
  g1(5,9)=T157-(1+y(7))*params(6)*T157;
  g1(6,1)=(-(y(3)*T28*1/y(4)+y(4)*params(1)/y(3)));
  g1(6,2)=1;
  g1(6,3)=1-(1-params(2))-(T28*T30+y(4)*(-(y(1)*params(1)))/(y(3)*y(3)));
  g1(6,4)=(-(y(1)*params(1)/y(3)+y(3)*T28*(-y(1))/(y(4)*y(4))));
  g1(6,7)=y(8)-y(3)*T30*T147;
  g1(6,8)=1+y(7)-1;
  g1(7,6)=1/y(6)-params(3)*1/y(6);
  g1(8,9)=1/y(9)-params(4)*1/y(9);
  g1(9,7)=1;
  g1(9,8)=(-(params(8)*exp(y(8)-params(9))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,729);
end
end
end
end
