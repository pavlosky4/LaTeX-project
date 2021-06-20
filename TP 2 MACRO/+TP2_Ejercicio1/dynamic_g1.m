function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = TP2_Ejercicio1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(9, 20);
g1(1,7)=1;
g1(1,1)=(-(T(3)*y(12)*getPowerDeriv(y(1),params(1),1)));
g1(1,10)=(-(T(2)*getPowerDeriv(y(10),1-params(1),1)));
g1(1,12)=(-(T(1)*T(3)));
g1(2,7)=T(4)*T(6)*1/y(10);
g1(2,8)=T(7)*T(6)*T(10);
g1(2,10)=T(4)*T(6)*(-y(7))/(y(10)*y(10));
g1(2,13)=T(7)*T(4)*T(12);
g1(2,15)=T(7)*T(6)*T(13);
g1(3,16)=(-(T(8)*params(1)/y(9)));
g1(3,8)=T(10);
g1(3,17)=(-(T(9)*T(11)));
g1(3,9)=(-(T(8)*(-(params(1)*y(16)))/(y(9)*y(9))));
g1(3,15)=T(13);
g1(3,18)=(-(T(9)*params(6)*1/y(17)));
g1(4,8)=T(10);
g1(4,17)=(-T(11));
g1(4,11)=(-(params(6)*(-y(18))/(y(11)*y(11))));
g1(4,15)=T(13);
g1(4,18)=(-(params(6)*(1/y(17)+1/y(11))));
g1(5,8)=T(10);
g1(5,17)=(-((1+y(13))*T(11)));
g1(5,13)=(-T(8));
g1(5,15)=T(13);
g1(5,18)=(-((1+y(13))*params(6)*1/y(17)));
g1(6,7)=(-(y(1)*T(6)*1/y(10)));
g1(6,16)=(-(y(10)*params(1)/y(9)));
g1(6,8)=1;
g1(6,1)=(-(1-params(2)))-T(6)*T(7);
g1(6,9)=1-y(10)*(-(params(1)*y(16)))/(y(9)*y(9));
g1(6,10)=(-(params(1)*y(16)/y(9)+y(1)*T(6)*(-y(7))/(y(10)*y(10))));
g1(6,2)=(-1);
g1(6,11)=1;
g1(6,4)=y(5);
g1(6,13)=(-(y(1)*T(7)*T(12)));
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

end
