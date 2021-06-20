%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'TP2_Ejercicio1';
M_.dynare_version = '4.5.1';
oo_.dynare_version = '4.5.1';
options_.dynare_version = '4.5.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('TP2_Ejercicio1.log');
M_.exo_names = 'e1';
M_.exo_names_tex = 'e1';
M_.exo_names_long = 'e1';
M_.exo_names = char(M_.exo_names, 'e2');
M_.exo_names_tex = char(M_.exo_names_tex, 'e2');
M_.exo_names_long = char(M_.exo_names_long, 'e2');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'omega');
M_.endo_names_tex = char(M_.endo_names_tex, 'omega');
M_.endo_names_long = char(M_.endo_names_long, 'omega');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_partitions = struct();
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho1');
M_.param_names_tex = char(M_.param_names_tex, 'rho1');
M_.param_names_long = char(M_.param_names_long, 'rho1');
M_.param_names = char(M_.param_names, 'rho2');
M_.param_names_tex = char(M_.param_names_tex, 'rho2');
M_.param_names_long = char(M_.param_names_long, 'rho2');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'dbar');
M_.param_names_tex = char(M_.param_names_tex, 'dbar');
M_.param_names_long = char(M_.param_names_long, 'dbar');
M_.param_names = char(M_.param_names, 'rstar');
M_.param_names_tex = char(M_.param_names_tex, 'rstar');
M_.param_names_long = char(M_.param_names_long, 'rstar');
M_.param_names = char(M_.param_names, 'sigma1');
M_.param_names_tex = char(M_.param_names_tex, 'sigma1');
M_.param_names_long = char(M_.param_names_long, 'sigma1');
M_.param_names = char(M_.param_names, 'sigma2');
M_.param_names_tex = char(M_.param_names_tex, 'sigma2');
M_.param_names_long = char(M_.param_names_long, 'sigma2');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 9;
M_.param_nbr = 12;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('TP2_Ejercicio1_static');
erase_compiled_function('TP2_Ejercicio1_dynamic');
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 7 16;
 0 8 17;
 1 9 0;
 0 10 0;
 2 11 0;
 3 12 0;
 4 13 0;
 5 14 0;
 6 15 18;]';
M_.nstatic = 1;
M_.nfwrd   = 2;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 6;
M_.ndynamic   = 8;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(12, 1);
M_.NNZDerivatives = [45; -1; -1];
M_.params( 1 ) = 0.32;
alpha = M_.params( 1 );
M_.params( 2 ) = .025;
delta = M_.params( 2 );
M_.params( 3 ) = 0.4;
rho1 = M_.params( 3 );
M_.params( 4 ) = 0.2;
rho2 = M_.params( 4 );
M_.params( 5 ) = 1.5;
eta = M_.params( 5 );
M_.params( 10 ) = 0.01010101010100994;
rstar = M_.params( 10 );
M_.params( 6 ) = 0.99;
beta = M_.params( 6 );
M_.params( 7 ) = .1;
phi = M_.params( 7 );
M_.params( 9 ) = 0.01;
dbar = M_.params( 9 );
M_.params( 8 ) = 0.0001;
psi = M_.params( 8 );
M_.params( 11 ) = 0.005;
sigma1 = M_.params( 11 );
M_.params( 12 ) = 0.001;
sigma2 = M_.params( 12 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 3 ) = 8.25;
oo_.steady_state( 2 ) = 0.48;
oo_.steady_state( 4 ) = 0.32;
oo_.steady_state( 8 ) = 0.01;
oo_.steady_state( 6 ) = 1;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 2 ) = 0;
oo_.steady_state( 5 ) = 26.7;
oo_.steady_state( 7 ) = M_.params(10);
oo_.steady_state( 9 ) = 1;
oo_.steady_state( 1 ) = 0.9;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(11)^2;
M_.Sigma_e(2, 2) = M_.params(12)^2;
steady;
options_.irf = 10;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
statistic1 = 100*sqrt(diag(oo_.var(1:6,1:6)))./oo_.mean(1:6);
dyntable(options_,'Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),M_.endo_names(1:6,:),statistic1,10,8,4);
sigmac_sigmay = statistic1(2)/statistic1(1)
save('TP2_Ejercicio1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('TP2_Ejercicio1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('TP2_Ejercicio1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('TP2_Ejercicio1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('TP2_Ejercicio1_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('TP2_Ejercicio1_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('TP2_Ejercicio1_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
