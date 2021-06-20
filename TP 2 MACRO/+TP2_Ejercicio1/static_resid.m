function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = TP2_Ejercicio1.static_resid_tt(T, y, x, params);
end
residual = zeros(9, 1);
lhs = y(1);
rhs = T(2)*T(3);
residual(1) = lhs - rhs;
lhs = T(4)*T(6)*T(7);
rhs = params(5);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = T(4)*params(6)*T(8);
residual(3) = lhs - rhs;
lhs = T(4);
rhs = params(6)*(T(4)+y(9)/y(5));
residual(4) = lhs - rhs;
lhs = T(4);
rhs = (1+y(7))*T(4)*params(6);
residual(5) = lhs - rhs;
lhs = y(3)+y(2)-y(3)*(1-params(2))+(1+y(7))*y(8)-y(8);
rhs = y(3)*T(6)*T(7)+y(4)*y(1)*params(1)/y(3);
residual(6) = lhs - rhs;
lhs = log(y(6));
rhs = log(y(6))*params(3)+x(1);
residual(7) = lhs - rhs;
lhs = log(y(9));
rhs = log(y(9))*params(4)+x(2);
residual(8) = lhs - rhs;
lhs = y(7);
rhs = params(10)+params(8)*(exp(y(8)-params(9))-1);
residual(9) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
