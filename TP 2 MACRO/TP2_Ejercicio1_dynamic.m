function [residual, g1, g2, g3] = TP2_Ejercicio1_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(9, 1);
T12 = y(1)^params(1);
T13 = y(12)*T12;
T16 = y(10)^(1-params(1));
T21 = y(15)/y(8);
T27 = 1+params(7)*y(13)/(1+y(13));
T28 = (1-params(1))/T27;
T30 = y(7)/y(10);
T38 = params(6)*y(18)/y(17);
T45 = 1+params(1)*y(16)/y(9)-params(2);
lhs =y(7);
rhs =T13*T16;
residual(1)= lhs-rhs;
lhs =T21*T28*T30;
rhs =params(5);
residual(2)= lhs-rhs;
lhs =T21;
rhs =T38*T45;
residual(3)= lhs-rhs;
lhs =T21;
rhs =params(6)*(y(18)/y(17)+y(18)/y(11));
residual(4)= lhs-rhs;
lhs =T21;
rhs =(1+y(13))*T38;
residual(5)= lhs-rhs;
lhs =y(11)+y(8)+y(9)-y(1)*(1-params(2))-y(2)+(1+y(4))*y(5)-y(14);
rhs =y(1)*T28*T30+y(10)*params(1)*y(16)/y(9);
residual(6)= lhs-rhs;
lhs =log(y(12));
rhs =params(3)*log(y(3))+x(it_, 1);
residual(7)= lhs-rhs;
lhs =log(y(15));
rhs =params(4)*log(y(6))+x(it_, 2);
residual(8)= lhs-rhs;
lhs =y(13);
rhs =params(10)+params(8)*(exp(y(14)-params(9))-1);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 20);

  %
  % Jacobian matrix
  %

T111 = (-y(15))/(y(8)*y(8));
T117 = params(6)*(-y(18))/(y(17)*y(17));
T164 = (-((1-params(1))*(params(7)*(1+y(13))-params(7)*y(13))/((1+y(13))*(1+y(13)))))/(T27*T27);
T176 = 1/y(8);
  g1(1,7)=1;
  g1(1,1)=(-(T16*y(12)*getPowerDeriv(y(1),params(1),1)));
  g1(1,10)=(-(T13*getPowerDeriv(y(10),1-params(1),1)));
  g1(1,12)=(-(T12*T16));
  g1(2,7)=T21*T28*1/y(10);
  g1(2,8)=T30*T28*T111;
  g1(2,10)=T21*T28*(-y(7))/(y(10)*y(10));
  g1(2,13)=T30*T21*T164;
  g1(2,15)=T30*T28*T176;
  g1(3,16)=(-(T38*params(1)/y(9)));
  g1(3,8)=T111;
  g1(3,17)=(-(T45*T117));
  g1(3,9)=(-(T38*(-(params(1)*y(16)))/(y(9)*y(9))));
  g1(3,15)=T176;
  g1(3,18)=(-(T45*params(6)*1/y(17)));
  g1(4,8)=T111;
  g1(4,17)=(-T117);
  g1(4,11)=(-(params(6)*(-y(18))/(y(11)*y(11))));
  g1(4,15)=T176;
  g1(4,18)=(-(params(6)*(1/y(17)+1/y(11))));
  g1(5,8)=T111;
  g1(5,17)=(-((1+y(13))*T117));
  g1(5,13)=(-T38);
  g1(5,15)=T176;
  g1(5,18)=(-((1+y(13))*params(6)*1/y(17)));
  g1(6,7)=(-(y(1)*T28*1/y(10)));
  g1(6,16)=(-(y(10)*params(1)/y(9)));
  g1(6,8)=1;
  g1(6,1)=(-(1-params(2)))-T28*T30;
  g1(6,9)=1-y(10)*(-(params(1)*y(16)))/(y(9)*y(9));
  g1(6,10)=(-(params(1)*y(16)/y(9)+y(1)*T28*(-y(7))/(y(10)*y(10))));
  g1(6,2)=(-1);
  g1(6,11)=1;
  g1(6,4)=y(5);
  g1(6,13)=(-(y(1)*T30*T164));
  g1(6,5)=1+y(4);
  g1(6,14)=(-1);
  g1(7,3)=(-(params(3)*1/y(3)));
  g1(7,12)=1/y(12);
  g1(7,19)=(-1);
  g1(8,6)=(-(params(4)*1/y(6)));
  g1(8,15)=1/y(15);
  g1(8,20)=(-1);
  g1(9,13)=1;
  g1(9,14)=(-(params(8)*exp(y(14)-params(9))));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,400);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,8000);
end
end
end
end
