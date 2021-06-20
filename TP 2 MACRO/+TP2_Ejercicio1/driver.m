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
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'TP2_Ejercicio1';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('TP2_Ejercicio1.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'e1'};
M_.exo_names_tex(1) = {'e1'};
M_.exo_names_long(1) = {'e1'};
M_.exo_names(2) = {'e2'};
M_.exo_names_tex(2) = {'e2'};
M_.exo_names_long(2) = {'e2'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'k'};
M_.endo_names(4) = {'n'};
M_.endo_names_tex(4) = {'n'};
M_.endo_names_long(4) = {'n'};
M_.endo_names(5) = {'q'};
M_.endo_names_tex(5) = {'q'};
M_.endo_names_long(5) = {'q'};
M_.endo_names(6) = {'omega'};
M_.endo_names_tex(6) = {'omega'};
M_.endo_names_long(6) = {'omega'};
M_.endo_names(7) = {'r'};
M_.endo_names_tex(7) = {'r'};
M_.endo_names_long(7) = {'r'};
M_.endo_names(8) = {'d'};
M_.endo_names_tex(8) = {'d'};
M_.endo_names_long(8) = {'d'};
M_.endo_names(9) = {'z'};
M_.endo_names_tex(9) = {'z'};
M_.endo_names_long(9) = {'z'};
M_.endo_partitions = struct();
M_.param_names = cell(12,1);
M_.param_names_tex = cell(12,1);
M_.param_names_long = cell(12,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'delta'};
M_.param_names_long(2) = {'delta'};
M_.param_names(3) = {'rho1'};
M_.param_names_tex(3) = {'rho1'};
M_.param_names_long(3) = {'rho1'};
M_.param_names(4) = {'rho2'};
M_.param_names_tex(4) = {'rho2'};
M_.param_names_long(4) = {'rho2'};
M_.param_names(5) = {'eta'};
M_.param_names_tex(5) = {'eta'};
M_.param_names_long(5) = {'eta'};
M_.param_names(6) = {'beta'};
M_.param_names_tex(6) = {'beta'};
M_.param_names_long(6) = {'beta'};
M_.param_names(7) = {'phi'};
M_.param_names_tex(7) = {'phi'};
M_.param_names_long(7) = {'phi'};
M_.param_names(8) = {'psi'};
M_.param_names_tex(8) = {'psi'};
M_.param_names_long(8) = {'psi'};
M_.param_names(9) = {'dbar'};
M_.param_names_tex(9) = {'dbar'};
M_.param_names_long(9) = {'dbar'};
M_.param_names(10) = {'rstar'};
M_.param_names_tex(10) = {'rstar'};
M_.param_names_long(10) = {'rstar'};
M_.param_names(11) = {'sigma1'};
M_.param_names_tex(11) = {'sigma1'};
M_.param_names_long(11) = {'sigma1'};
M_.param_names(12) = {'sigma2'};
M_.param_names_tex(12) = {'sigma2'};
M_.param_names_long(12) = {'sigma2'};
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
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
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
M_.dynamic_tmp_nbr = [9; 4; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'y' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'r' ;
};
M_.mapping.y.eqidx = [1 2 3 6 ];
M_.mapping.c.eqidx = [2 3 4 5 6 ];
M_.mapping.k.eqidx = [1 3 6 ];
M_.mapping.n.eqidx = [1 2 6 ];
M_.mapping.q.eqidx = [4 6 ];
M_.mapping.omega.eqidx = [1 7 ];
M_.mapping.r.eqidx = [2 5 6 9 ];
M_.mapping.d.eqidx = [6 9 ];
M_.mapping.z.eqidx = [2 3 4 5 8 ];
M_.mapping.e1.eqidx = [7 ];
M_.mapping.e2.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 5 6 7 8 9 ];
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
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [45; -1; -1; ];
M_.static_tmp_nbr = [8; 3; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.32;
alpha = M_.params(1);
M_.params(2) = .025;
delta = M_.params(2);
M_.params(3) = 0.4;
rho1 = M_.params(3);
M_.params(4) = 0.2;
rho2 = M_.params(4);
M_.params(5) = 1.5;
eta = M_.params(5);
M_.params(10) = 0.01010101010100994;
rstar = M_.params(10);
M_.params(6) = 0.99;
beta = M_.params(6);
M_.params(7) = .1;
phi = M_.params(7);
M_.params(9) = 0.01;
dbar = M_.params(9);
M_.params(8) = 0.0001;
psi = M_.params(8);
M_.params(11) = 0.005;
sigma1 = M_.params(11);
M_.params(12) = 0.001;
sigma2 = M_.params(12);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(3) = 8.25;
oo_.steady_state(2) = 0.48;
oo_.steady_state(4) = 0.32;
oo_.steady_state(8) = 0.01;
oo_.steady_state(6) = 1;
oo_.exo_steady_state(1) = 0;
oo_.exo_steady_state(2) = 0;
oo_.steady_state(5) = 26.7;
oo_.steady_state(7) = M_.params(10);
oo_.steady_state(9) = 1;
oo_.steady_state(1) = 0.9;
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
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
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
