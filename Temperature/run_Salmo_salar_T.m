clear all; close all; clc

global pets

pets = {'Salmo_salar_T'};
check_my_pet(pets)
estim_options('default'); % runs estimation, uses nmregr method and filter
estim_options('max_step_number',500);  % set options for parameter estimation
estim_options('max_fun_evals',5e4);    % set options for parameter estimation

estim_options('pars_init_method', 2);
estim_options('results_output', 2);
estim_options('method', 'nm');
estim_pars;          % run estimation
%return

 estim_options('pars_init_method', 1);
 estim_options('results_output', 2);
 estim_pars; 
 
 for i = 1:10
     estim_pars;          % run estimation
 end
% 
% load results_Salmo_salar
% prt_report_my_pet(metaData,metaPar,par)