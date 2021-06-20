function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 9);

T(1) = y(1)^params(1);
T(2) = y(12)*T(1);
T(3) = y(10)^(1-params(1));
T(4) = y(15)/y(8);
T(5) = 1+params(7)*y(13)/(1+y(13));
T(6) = (1-params(1))/T(5);
T(7) = y(7)/y(10);
T(8) = params(6)*y(18)/y(17);
T(9) = 1+params(1)*y(16)/y(9)-params(2);

end
