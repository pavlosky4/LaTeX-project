function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = TP2_Ejercicio1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(9, 1);
lhs = y(7);
rhs = T(2)*T(3);
residual(1) = lhs - rhs;
lhs = T(4)*T(6)*T(7);
rhs = params(5);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = T(8)*T(9);
residual(3) = lhs - rhs;
lhs = T(4);
rhs = params(6)*(y(18)/y(17)+y(18)/y(11));
residual(4) = lhs - rhs;
lhs = T(4);
rhs = (1+y(13))*T(8);
residual(5) = lhs - rhs;
lhs = y(11)+y(8)+y(9)-y(1)*(1-params(2))-y(2)+(1+y(4))*y(5)-y(14);
rhs = y(1)*T(6)*T(7)+y(10)*params(1)*y(16)/y(9);
residual(6) = lhs - rhs;
lhs = log(y(12));
rhs = params(3)*log(y(3))+x(it_, 1);
residual(7) = lhs - rhs;
lhs = log(y(15));
rhs = params(4)*log(y(6))+x(it_, 2);
residual(8) = lhs - rhs;
lhs = y(13);
rhs = params(10)+params(8)*(exp(y(14)-params(9))-1);
residual(9) = lhs - rhs;

end
