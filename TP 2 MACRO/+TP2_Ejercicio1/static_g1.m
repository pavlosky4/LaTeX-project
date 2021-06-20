function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = TP2_Ejercicio1.static_g1_tt(T, y, x, params);
end
g1 = zeros(9, 9);
g1(1,1)=1;
g1(1,3)=(-(T(3)*y(6)*getPowerDeriv(y(3),params(1),1)));
g1(1,4)=(-(T(2)*getPowerDeriv(y(4),1-params(1),1)));
g1(1,6)=(-(T(1)*T(3)));
g1(2,1)=T(4)*T(6)*1/y(4);
g1(2,2)=T(7)*T(6)*T(9);
g1(2,4)=T(4)*T(6)*(-y(1))/(y(4)*y(4));
g1(2,7)=T(7)*T(4)*T(10);
g1(2,9)=T(7)*T(6)*T(11);
g1(3,1)=(-(T(4)*params(6)*params(1)/y(3)));
g1(3,2)=T(9)-T(8)*params(6)*T(9);
g1(3,3)=(-(T(4)*params(6)*(-(y(1)*params(1)))/(y(3)*y(3))));
g1(3,9)=T(11)-T(8)*params(6)*T(11);
g1(4,2)=T(9)-params(6)*T(9);
g1(4,5)=(-(params(6)*(-y(9))/(y(5)*y(5))));
g1(4,9)=T(11)-params(6)*(T(11)+1/y(5));
g1(5,2)=T(9)-(1+y(7))*params(6)*T(9);
g1(5,7)=(-(T(4)*params(6)));
g1(5,9)=T(11)-(1+y(7))*params(6)*T(11);
g1(6,1)=(-(y(3)*T(6)*1/y(4)+y(4)*params(1)/y(3)));
g1(6,2)=1;
g1(6,3)=1-(1-params(2))-(T(6)*T(7)+y(4)*(-(y(1)*params(1)))/(y(3)*y(3)));
g1(6,4)=(-(y(1)*params(1)/y(3)+y(3)*T(6)*(-y(1))/(y(4)*y(4))));
g1(6,7)=y(8)-y(3)*T(7)*T(10);
g1(6,8)=y(7);
g1(7,6)=1/y(6)-params(3)*1/y(6);
g1(8,9)=1/y(9)-params(4)*1/y(9);
g1(9,7)=1;
g1(9,8)=(-(params(8)*exp(y(8)-params(9))));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
