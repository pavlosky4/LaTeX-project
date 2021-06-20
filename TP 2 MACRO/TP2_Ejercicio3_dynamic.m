function [residual, g1, g2, g3] = TP2_Ejercicio3_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(10, 1);
T21 = y(6)-y(9)^params(5)/params(5);
T24 = T21^(-params(11));
T30 = y(16)-y(18)^params(5)/params(5);
T32 = params(6)*T30^(-params(11));
T44 = 1+params(1)*y(15)/y(7)-params(2)+params(7)*(y(17)-y(7));
T45 = T32*T44;
T68 = params(7)/2*(y(7)-y(1))^2;
T83 = y(1)^params(1);
T84 = y(10)*T83;
T85 = y(9)^(1-params(1));
lhs =y(9)^(params(5)-1);
rhs =(1-params(1))*y(5)/y(9);
residual(1)= lhs-rhs;
lhs =T24;
rhs =T45/(1+params(7)*(y(7)-y(1)));
residual(2)= lhs-rhs;
lhs =T24;
rhs =T32*(1+params(10)+params(8)*(exp(y(11)-params(9))-1));
residual(3)= lhs-rhs;
lhs =y(6)+y(8)+T68+y(3)*(1+params(10)+params(8)*(exp(y(3)-params(9))-1))+y(14);
rhs =y(5)+y(11);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =T84*T85;
residual(5)= lhs-rhs;
lhs =y(7);
rhs =y(8)+y(1)*(1-params(2));
residual(6)= lhs-rhs;
lhs =log(y(10));
rhs =params(3)*log(y(2))+x(it_, 1);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =params(4)*y(4)+x(it_, 2);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =y(5)-y(6)-y(8)-T68-y(14);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(12)-y(3)*(params(10)+params(8)*(exp(y(3)-params(9))-1));
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 20);

  %
  % Jacobian matrix
  %

T125 = getPowerDeriv(T21,(-params(11)),1);
T126 = getPowerDeriv(T30,(-params(11)),1);
T173 = T125*(-(getPowerDeriv(y(9),params(5),1)/params(5)));
T181 = params(6)*T126*(-(getPowerDeriv(y(18),params(5),1)/params(5)));
  g1(1,5)=(-((1-params(1))*1/y(9)));
  g1(1,9)=getPowerDeriv(y(9),params(5)-1,1)-(1-params(1))*(-y(5))/(y(9)*y(9));
  g1(2,15)=(-(T32*params(1)*1/y(7)/(1+params(7)*(y(7)-y(1)))));
  g1(2,6)=T125;
  g1(2,16)=(-(T44*params(6)*T126/(1+params(7)*(y(7)-y(1)))));
  g1(2,1)=(-((-(T45*(-params(7))))/((1+params(7)*(y(7)-y(1)))*(1+params(7)*(y(7)-y(1))))));
  g1(2,7)=(-(((1+params(7)*(y(7)-y(1)))*T32*(params(1)*(-y(15))/(y(7)*y(7))-params(7))-params(7)*T45)/((1+params(7)*(y(7)-y(1)))*(1+params(7)*(y(7)-y(1))))));
  g1(2,17)=(-(T32*params(7)/(1+params(7)*(y(7)-y(1)))));
  g1(2,9)=T173;
  g1(2,18)=(-(T44*T181/(1+params(7)*(y(7)-y(1)))));
  g1(3,6)=T125;
  g1(3,16)=(-((1+params(10)+params(8)*(exp(y(11)-params(9))-1))*params(6)*T126));
  g1(3,9)=T173;
  g1(3,18)=(-((1+params(10)+params(8)*(exp(y(11)-params(9))-1))*T181));
  g1(3,11)=(-(T32*params(8)*exp(y(11)-params(9))));
  g1(4,5)=(-1);
  g1(4,6)=1;
  g1(4,1)=params(7)/2*(-(2*(y(7)-y(1))));
  g1(4,7)=params(7)/2*2*(y(7)-y(1));
  g1(4,8)=1;
  g1(4,3)=1+params(10)+params(8)*(exp(y(3)-params(9))-1)+y(3)*params(8)*exp(y(3)-params(9));
  g1(4,11)=(-1);
  g1(4,14)=1;
  g1(5,5)=1;
  g1(5,1)=(-(T85*y(10)*getPowerDeriv(y(1),params(1),1)));
  g1(5,9)=(-(T84*getPowerDeriv(y(9),1-params(1),1)));
  g1(5,10)=(-(T83*T85));
  g1(6,1)=(-(1-params(2)));
  g1(6,7)=1;
  g1(6,8)=(-1);
  g1(7,2)=(-(params(3)*1/y(2)));
  g1(7,10)=1/y(10);
  g1(7,19)=(-1);
  g1(8,4)=(-params(4));
  g1(8,14)=1;
  g1(8,20)=(-1);
  g1(9,5)=(-1);
  g1(9,6)=1;
  g1(9,1)=params(7)/2*(-(2*(y(7)-y(1))));
  g1(9,7)=params(7)/2*2*(y(7)-y(1));
  g1(9,8)=1;
  g1(9,12)=1;
  g1(9,14)=1;
  g1(10,3)=params(10)+params(8)*(exp(y(3)-params(9))-1)+y(3)*params(8)*exp(y(3)-params(9));
  g1(10,12)=(-1);
  g1(10,13)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,400);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,8000);
end
end
end
end
