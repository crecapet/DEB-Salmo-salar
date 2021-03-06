function [prdData, info] = predict_Salmo_salar(par, data, auxData)
  


  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%   % customized filters for allowable parameters of the standard DEB model (std)
%   % for other models consult the appropriate filter function.
    
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);



  if info ~= 1 % numerical procedure failed
     fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  
   s_M = l_j / l_b;
    filterChecks = k * v_Hp >= f_tL ^3 * s_M^3  || ...         % constraint required for reaching puberty with f_tL
     E_Hh>=E_Hb || ...
     E_Hb>=E_Hj || ...
      E_Hj>=E_Hp ;
   
   if filterChecks  
     info = 0;
     prdData = {};
     return;
   end  

  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
%  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  
  %TC_tWw = tempcorr(temp.tWw, T_ref, T_A);
  TC_LR = tempcorr(temp.LR, T_ref, T_A);
  TC_tWwp = tempcorr(temp.tWwp, T_ref, T_A);
  TC_tWwps = tempcorr(temp.tWwps, T_ref, T_A);
  
  
  % zero-variate data

  % life cycle
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0=U_E0*p_Am;  % J, initial energy in the egg
  Wd0 = E_0 * w_E/ mu_E ; % g, egg dry weight 
  
  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  Lw_h = aUL(2,3); % cm, strucural length at hatch
  E_h = aUL(2,2) * p_Am; % J, energy in reserves at hatch
  Wdh = (d_V * Lw_h^3 + w_E/ mu_E * E_h); % g, dry weight at hatch
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Wdb = L_b^3 * (1 + f * w)*d_V;       % g, dry weight at birth at f 
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;   % d, age at birth at f and T diveded by correction factor TC_ab
  
  % metamorphosis
 L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, physical length at metam at f
%  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
%  aT_j = t_j / k_M/ TC_aj;          % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
 % Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R);
  RT_i = TC_Ri * R_i;% #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;

  prdData.Wd0 = Wd0;
  prdData.Wdh = Wdh;
  prdData.Wdb = Wdb;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
%   prdData.ah = aT_h;
%   prdData.ab = aT_b;
%   prdData.aj = aT_j;
%   prdData.ap = aT_p;
%   prdData.am = aT_m;
%   prdData.Lh = Lw_h;
%   prdData.Lb = Lw_b;
%   prdData.Lj = Lw_j;
%   prdData.Lp = Lw_p;
%   prdData.Li = Lw_i;
%   prdData.Wwh = Ww_h;
%   prdData.Wwb = Ww_b;
%   prdData.Wwj = Ww_j;
%   prdData.Wwp = Ww_p;
%   prdData.Wwi = Ww_i;
%   prdData.Ri = RT_i;
  
  % uni-variate data
  
  %% parr
   % length-weight
   EWd = (LWd(:,1) * del_M).^3 * (1 + f_tWp * w)*d_V; % g, dry?? weight ?d_V
   
   %% parr - river
   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tWp);
   rT_B_tWwp = TC_tWwp * rho_B * k_M;  % 1/d, von Bert growth rate   
   rT_j = TC_tWwp * rho_j * k_M;  % 1/d, exponential growth rate
   aT_b = t_b/ k_M/ TC_tWwp; aT_j = t_j/ k_M/ TC_tWwp;   
    Lw_b = l_b * L_m/ del_M; 
    Lw_j = l_j * L_m/ del_M; 
    
   if min(tWwp(:,1)) < t_j 
   t_j = aT_j - aT_b; % time since birth at metamorphosis
   t_bj = tWwp(tWwp(:,1) < t_j,1); % select times between birth & metamorphosis  
   Lw_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
   EW_bj = (Lw_bj * del_M).^3 * (1 + f_tWp * w);
   EWwp = [EW_bj]; % catenate lengths
   end
   
   if max(tWwp(:,1))>= t_j
   t_ji = tWwp(tWwp(:,1) >= t_j,1); % selects times after metamorphosis
   Lw_js = Lw_i - (Lw_i - Lw_j) * exp( - rT_B_tWwp * (t_ji-t_j)); % cm, expected length at time
   EW_ji = (Lw_js * del_M).^3 * (1 + f_tWp * w);
   end
   
    if exist('EW_bi')& exist('EW_ji')
     EWwp = [EW_bj; EW_ji]; % catenate lengths   
    elseif exist('EW_bi')
 EWwp = EW_bj; 
    else
  EWwp = EW_ji; 
 end
   
   %% ocean
   % length-reprod
%     ER  = reprod_rate(LR(:,1) * del_M/ 10, f, pars_R) .* TC_LR;    % #/ d, temperature corrected reproduction rate
   ER = TC_LR * reprod_rate_j(LR(:,1) * del_M, f_tL, pars_R);  %per day
   ER = ER * 2 *365; % in life
      
   
  %% ocean
  % time-length 
   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
   rT_B = TC_tWwps * rho_B * k_M;  % 1/d, von Bert growth rate   
%    rT_j = TC_tLps * rho_j * k_M;  % 1/d, exponential growth rate
%    aT_b = t_b/ k_M/ TC_tLps; aT_j = t_j/ k_M/ TC_tLps;   
  % t_j = aT_j - aT_b; % time since birth at metamorphosis
  % t_bj = tLps(tLps(:,1) < t_j,1); % select times between birth & metamorphosis   
   %Lw_b = l_b * L_m/ del_M; 
  % Lw_j = l_j * L_m/ del_M; 
   Lw_i = l_i * L_m/ del_M;
  % EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
   %t_ji = tLps(tLps(:,1) >= t_j,1); % selects times after metamorphosis
%    t_ji = tLps(:,1)
  % Lw_s= 20;%data.tLps(1,2);
%    tLps(:,1)=data.tLps(:,1)- 2*365;
   %EL_ps = Lw_i - (Lw_i - Lw_s) .* exp( - rT_B .* (tLps(:,1) - tLps(1,1))); % cm, expected length at time
  % ELw = [EL_bj; EL_ji]; % catenate lengths

  %% ocean
    Lw_0= (75./(1 + f_tL * w)).^(1/3) / del_M;
    Lw = Lw_i - (Lw_i - Lw_0) .* exp( - rT_B .* tWwps(:,1)); % cm, expected length at time
   EWwps = (del_M * Lw).^3 * (1 + f_tL * w);
   
 
%    % tLps bis no bertalanffy
        %%% bine choisir son etat initial: prendre smolt si on peut le
        %%% definir
  
        % L0 = 20* del_M; % Condition initiale
  % E0 = L0^3 * p_Am/ v; H0 = E_Hj;

   %L0 = Lw_j* del_M; % Condition initiale
   L0=Lj;
   E0 = L0^3 * p_Am/ v; H0 = E_Hj;
  
  %    f1 = f_ShelClar1995; f0 = 0.6 * f_ShelClar1995; f2 = 0.8 * f_ShelClar1995;  % -, set food levels

   ELHR_0 = [f_tL * E0; L0; H0;0];
    
   temp.tLps(:,1)=temp.tLps(:,1)-aT_j;
    [a ELHR] = ode45(@dget_ELHR, [0; tLps(:,1)-aT_j], ELHR_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f_tL, E_Hb, E_Hj, E_Hp, temp.tLps, T_A, T_ref);
   
    
    ELHR(1,:) = []; E = ELHR(:,1); L = ELHR(:,2); ELps = L/ del_M;  %EWw_ShelClar1995_1 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight warning pas R (seulement juv)
%EWw_ShelClar1995_1 = L.^3 + (E+R) * w_E/ mu_E/ d_E;
%ELps = ELHR(:,2);


   % pack to output
  prdData.LR = ER;
  prdData.LWd = EWd;
  prdData.tLps = ELps;
 % prdData.tLps = ELp;
  prdData.tWwps = EWwps;
  prdData.tWwp = EWwp;
end 
  
  
%% sub subfuctions

function dELHR = dget_ELHR(t, ELHR, Lb, Lj, Lm, p_Am, v, g, kJ, kap, f, Hb, Hj, Hp, tT, T_A, T_ref)
  %  change in state variables during juvenile stage (smolt)
  %  dELH = dget_ELH_p_pj(t, ELH)
  %  ELH: 4-vector
  %   E: reserve E
  %   L: structural length
  %   H: maturity E_H
  %   R: Repro
  %  dELH: change in reserve, length, scaled maturity
  
 
  %  unpack variables
  E = ELHR(1); L = ELHR(2); H = ELHR(3); R = ELHR(4);
  
  TC = tempcorr(C2K(spline1(t, tT)), T_ref, T_A); %% spline1 interpol lineaire a test ou a faire en amont (fit transfo de fourier)
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dE = (L > Lb) * s * pT_Am * f * L^2 - pT_C;
  dL = rT * L/3;
  
  if H < Hp
  dH = (1 - kap) * pT_C - kT_J * H; dR = 0;
  else
  dR = (1 - kap) * pT_C - kT_J * H; dH = 0;
  end
  
  % pack derivatives
  dELHR = [dE; dL; dH; dR];
end

 



