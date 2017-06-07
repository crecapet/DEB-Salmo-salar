function [data, auxData, metaData, txtData, weights] = mydata_Salmo_salar

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_salar'; 
metaData.species_en = 'Atlantic salmon'; 
metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah_T'; 'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Wdh'; 'Wdb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 't-Ww'; 't-L'; 'tWde'; 'tWde_E'; 'T-ah'; 'Ww-JO'; 'WLO'; 'Wie1985'; 'tW150'; 'tW124ini'; 'tW124fin'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Felix Massiot-Granier'};        
metaData.date_subm = [2017 28 05];                           
metaData.email    = {''};                 
metaData.address  = {''}; 

metaData.curator     = {''};
metaData.email_cur   = {''}; 
metaData.date_acc    = []; 

%% set data
% zero-variate data
 % eggs 
 
% data.Drymatter0=0.35 ;  units.Wd0 = ''; label.Wd0 = 'wet egg weight'; bibkey.Wd0 = '';   
% comment.Wd0 = 'dry matter of eggs'; 
 
%     data.Ww0 = 0.1618;  units.Wd0 = 'g'; label.Wd0 = 'wet egg weight'; bibkey.Wd0 = 'Kazanoc, 1981';   
% comment.Ww0 = 'wet weight'; 

    data.Wd0 = 0.1618*0.35;  units.Wd0 = 'g'; label.Wd0 = 'dry egg weight'; bibkey.Wd0 = '';   
comment.Wd0 = 'wet weight multiplied by percent dry matter of large eggs'; 
   
    
  % hatch
 
 data.ah = 97.9;  units.ah = 'd'; label.ah = 'age at hatching at 6 degrees'; bibkey.ah = 'soldberg, 2014';   
temp.ah = C2K(5.7); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  %data.ah_5 = 33 + 34;  units.ah_5 = 'd'; label.ah_5 = 'age at hatching at 5 degrees'; bibkey.ah_5 = 'FromRasm1991';   
%temp.ah_5 = C2K(5); units.temp.ah_5 = 'K'; label.temp.ah_5 = 'temperature';

%    data.Wwh = 0.055;  units.Wwh = 'g'; label.Wwh = 'wet weight at hatch'; bibkey.Wdh = 'Kazakov';   
%comment.Wwh = 'average of different temp wet weight times';
%    data.Drymatterh = 0.29;  units.Drymatterh = ''; label.Drymatterh = 'wet weight at hatch'; bibkey.Drymatterh = 'Kazakov';   
%comment.Drymatterh = 'dry matter of hatchlings';

data.Wdh = 0.0557*0.29;  units.Wdh = 'g'; label.Wdh = 'dry weight at hatch'; bibkey.Wdh = 'Kazakov';comment.Wdh = 'average of different temp dry weight times';

%ne sait pas comment le rajouter
 data.Lh = 1.83;  units.Lh = 'cm'; label.Lh = 'size at hatch'; bibkey.Lh = 'Kazakov';   
comment.Lh = 'average size at different temp ';

% birth
data.ab = 143.9; units.ab = 'd'; label.ab = 'age at birth at 5.7 degrees'; bibkey.ab = 'soldberg, 2014';temp.ab = C2K(5.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.Lb = 2.54;  units.Lb = 'cm'; label.Lb = 'size at birth'; bibkey.Lb = 'Kazakov';comment.Lb = 'average size at different temp ';

%data.Wwb = 0.134;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wdb = 'Kazakov';   
%comment.Wwb = 'average of different temp wet weight times';
%data.Drymatterb = 0.17;  units.Drymatterb = ''; label.Drymatterh = 'percentage of dry matter'; bibkey.Drymatterh = 'Kazakov';   
%comment.Drymatterb = 'dry matter at birth';

data.Wdb = 0.134*0.17;  units.Wdb = 'g'; label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'Kazakov';comment.Wdb = 'average of different temp dry weight times';

%Smolt Hutching and jones 1998

% Puberty
data.ap =365*(2.91); units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Hutching';temp.ap = C2K(7); units.temp.ap = 'K'; label.temp.ap = 'temperature';
 comment.ap = 'guessing for the temp (2:10)';
data.Lp = 35;      units.Lp = 'cm';   label.Lp = 'forked length at puberty'; bibkey.Lp = 'Hucthings';comment.Lp = 'average size of grilse';
   
%data.Wp = 3.5 * 1e3;   units.Wp = 'g';    label.Wp = 'wet weight at puberty';    bibkey.Wp = 'DaviKenn2014';
%   comment.Wp = 'weigth at 20 montsh post hatch, when rapid egg growth occurred'; 
    
 % ultimate 
data.am = 10*365;  units.am = 'd';    label.am = 'life span'; bibkey.am = {'fishbase'};temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature';
data.Li = 150;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Wwi = 25000;
units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
data.Ri = 16000/2/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'Wiki';temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';



  
 % uni-variate data

 % % time and wet weights were measured in parrs (juveniles) at temp between 8.5 and 13.5 C
 data.tWwp = [... % time since 42d after birth (d)    Wet weight (g)
0.94810928 0.94140011
30.09766053 2.02952265
60.26070546 3.66904481
89.46149177 5.79610066
120.09846108 7.04575598
150.24389395 8.32814482
179.99065395 11.52633380
207.25091209 14.30379037
 ];
 data.tWwp(:,1)=data.tWwp(:,1)+42;
 units.tWwp   = {'d', 'g'};  label.tWwp = {'time since birth', 'wet weight'};  
 temp.tWwp    = C2K(11);  units.temp.tWwp = 'K'; label.temp.tWwp = 'temperature';
 bibkey.tWwp = 'Refste1976';
 
% % uni-variate data at f = 1 (this value should be added in pars_init_my_pet as a parameter f_tL) 
% % time and wet weights were measured in postsmolts at 10C
  data.tWwps = [...	% time since smolting (d),	Ww (g)	
  	0	75	
  	14	83.33	
  	28	109.26	
  	42	143.52	
  	56	187.04	
  	70	235.19	
  	84	262.04	
  ];
  units.tWwps   = {'d', 'g'};  label.tWwps = {'time since smolt', 'wet weight'};  
  temp.tWwps    = C2K(10);  units.temp.tWwps = 'K'; label.temp.tWwps = 'temperature';
  bibkey.tWwps = 'Handeland2008';

% 
data.tLps = [...	% time since smolting (d),	size (cm)	
0 20.00000
6.537095 20.58938
13.031537 21.16005
19.282513 22.02895
27.236020 23.07039
35.557189 24.09839
43.666268 25.24155
52.085427 26.49404
60.764322 27.52114
69.745614 28.47831
78.877065 29.57097
87.475702 30.75899
97.260396 31.94065
104.566281 32.78848
115.035139 33.70987
124.043797 34.80217
133.864344 35.72029
143.722646 36.68727
152.850952 37.48878
163.116564 38.22727
172.490673 38.88095
180.970085 39.58511
191.478337 40.29000
202.094018 41.00034
211.577784 41.61043
222.998761 42.34783
233.959003 43.00422
244.174505 43.75543
254.369425 44.45378
266.683092 45.11236
280.308869 46.04029
290.769763 46.96476
303.672222 47.79153
316.063956 48.72163
331.091327 50.04151
343.579768 51.13381
359.723875 52.28042
374.895826 53.64007
390.347459 54.73927
405.798040 55.79270
419.681857 56.97273
435.044248 58.03143
449.685090 59.21636
466.001869 60.26325
482.742574 61.58676
500.278930 62.98819
518.597779 64.38853
534.254521 65.57781
552.239498 66.79961
569.959586 67.77240
585.824253 68.60915
603.455082 69.43083
619.702446 70.18730
637.328385 70.92198
656.291501 71.71859
670.643515 72.38080
688.462890 73.04210
709.042550 74.00000
 ];

data.tLps(:,1)=data.tLps(:,1)+ 2*365;

 units.tLps   = {'d', 'g'};  label.tLps = {'time since smolt', 'fork length'};  
 
 temp.tLps    = [ .... %%C2K(12); % a changer mettre un vecteur
0	5.199999964
31	6.630500007
61	7.394000006
92	8.560500002
123	8.198000002
153	6.080999994
184	4.863499999
214	3.954499984
245	3.775999999
276	3.497000015
304	3.087999982
335	3.195999962
365	3.645500016
396	4.979500008
426	7.220499921
457	8.046000028
488	6.958999991
518	5.011999989
549	3.757499945
579	3.323500001
610	3.30150001
641	3.371999985
670	3.571500003
701	3.510000038
731	4.17049998
762	5.940499997
792	8.048000002
823	9.003000069
854	8.215000033
884	6.3375
915	4.757499993
945	4.000000024
976	3.966500032
1007	3.660499978
1035	3.536999977
1066	3.235500002
1096	3.06449998
 ];

temp.tLps(:,1)=temp.tLps(:,1)+ 2*365;

units.temp.tLps = 'K'; label.temp.tLps = 'temperature';
bibkey.tLps = 'Handeland2008';

data.LWd = [... % fork length (cm),  dry weight (g) (parrs)
    5.4684    0.4360
    5.6760    0.4327
    5.9713    0.4501
    5.8701    0.4982
    5.9903    0.5141
    5.9897    0.5430
    6.1760    0.4984
    6.1964    0.5223
    6.1744    0.5828
    6.4759    0.4947
    6.3885    0.5064
    6.3882    0.5184
    6.2594    0.5390
    6.3659    0.5562
    6.2792    0.6204
    6.5845    0.5922
    6.5624    0.5830
    6.4954    0.6206
    6.4733    0.6304
    6.3851    0.6977
    6.4938    0.7200
    6.5815    0.7848
    6.7615    0.8356
    6.6945    0.7372
    6.4727    0.6658
    6.5832    0.6711
    6.5391    0.6504
    6.5165    0.6764
    6.5830    0.6817
    6.6735    0.6354
    6.7413    0.6557
    6.6726    0.6925
    6.8791    0.6927
    6.7863    0.7090
    6.7633    0.7090
    7.1893    0.6560
    7.1890    0.6715
    7.4615    0.6876
    7.4867    0.6985
    6.9722    0.7317
    6.9484    0.7491
    7.0430    0.7609
    7.3845    0.7854
    7.6912    0.7555
    7.6650    0.7734
    7.6906    0.7980
    7.6122    0.8428
    7.6639    0.8428
    7.6635    0.8696
    7.6894    0.8765
    7.3092    0.8295
    7.2354    0.8294
    7.2351    0.8491
    7.1863    0.8425
    7.2103    0.8761
    7.2592    0.8761
    7.1616    0.8760
    7.1132    0.8829
    7.0652    0.8760
    6.9937    0.8897
    6.9937    0.8828
    6.9465    0.8827
    6.9704    0.8623
    6.9472    0.8357
    6.9458    0.9397
    7.0643    0.9547
    7.1603    0.9774
    7.1841    1.0164
    7.2083    1.0324
    7.3065    1.0406
    7.2583    0.9474
    7.3567    0.9930
    7.4327    0.9256
    7.4829    0.9476
    7.7406    0.9478
    7.8462    0.9479
    7.8991    0.9781
    7.9524    1.0092
    7.9792    1.0251
    7.8985    1.0250
    7.8451    1.0330
    7.7658    1.0330
    7.6615    1.0168
    7.5584    1.0247
    7.5836    1.0573
    7.5834    1.0740
    7.4812    1.0908
    7.3803    1.1166
    7.4807    1.1343
    7.4800    1.2075
    7.5818    1.2267
    7.8963    1.2175
    7.8703    1.1526
    7.9780    1.1172
    8.0042    1.1987
    8.0317    1.1618
    8.0587    1.1894
    8.1413    1.1619
    8.1418    1.1174
    8.0577    1.2761
    7.8944    1.4125
    7.9736    1.5637
    8.0897    0.8976
    8.0342    0.9630
    8.1441    0.9407
    8.1717    0.9408
    8.2269    0.9631
    8.4807    1.0175
    8.5671    1.0337
    8.3646    1.1804
    8.3642    1.2179
    8.3356    1.2468
    8.3924    1.2275
    8.5652    1.1806
    8.5063    1.2766
    8.6516    1.2767
    8.7405    1.2279
    8.7697    1.2669
    8.1943    1.3801
    8.1657    1.4691
    8.2769    1.4924
    8.3342    1.3802
    8.4476    1.4021
    8.5630    1.3805
    8.4753    1.5044
    8.7080    1.5047
    8.3602    1.6266
    8.3879    1.7048
    8.4729    1.7868
    8.5898    1.6269
    8.6774    1.6398
    8.8560    1.5771
    9.0385    1.5051
    8.9176    1.4359
    9.3190    1.4252
    9.1311    1.4703
    9.2866    1.5172
    9.2236    1.5410
    9.4446    1.5655
    9.5738    1.5294
    9.6732    1.3816
    9.2541    1.6277
    9.0369    1.6792
    9.0061    1.7056
    8.9754    1.7325
    8.8547    1.7323
    8.7652    1.7322
    9.5728    1.6281
    9.5721    1.7063
    9.6368    1.7469
   10.0712    1.6673
    9.3473    1.7741
    9.3466    1.8593
    9.2211    1.8303
    9.1592    1.7878
    8.8836    1.8733
    8.8525    2.0098
    8.9734    1.9943
    9.1872    2.1909
    9.3451    2.0422
    9.5045    2.0747
    9.4720    2.1239
    9.5361    2.1574
    9.5679    2.2260
    9.7648    2.1578
    9.6975    2.3515
    9.5995    2.3513
    9.4700    2.4069
    9.7991    2.0112
    9.7003    1.9798
    9.6680    1.9188
    9.6030    1.8890
    9.7672    1.8599
    9.9000    1.9042
   10.1376    1.8897
   10.3108    1.8752
   10.3462    1.8317
   10.4170    1.7754
   10.4499    2.0438
   11.1830    1.9510
    9.9308    2.2617
   10.0319    2.2975
   10.0326    2.2094
   10.1347    2.2444
   10.0650    2.4268
   10.3414    2.4273
   10.2714    2.4654
   10.3758    2.5241
   10.4463    2.5242
   10.3406    2.5439
   10.2013    2.5838
   10.3050    2.6453
   10.6244    2.5643
   10.5897    2.3900
   10.5545    2.3163
   10.4126    2.2981
   10.4130    2.2448
   10.6984    2.3166
   11.2176    2.3355
   11.1789    2.4476
   11.2927    2.4864
   10.8429    2.5052
   10.9529    2.6053
   11.1395    2.6674
   10.8776    2.8171
   10.7670    2.9292
   10.4782    3.1177
   10.9494    3.1678
   11.0609    3.2180
   11.2492    3.3206
   11.3635    3.4264
   11.0625    2.9527
   11.6806    2.6269
   11.7595    2.6894
   11.7582    2.8855
   11.7174    3.0478
   11.8776    2.9774
   12.2050    2.7973
   12.3702    2.9782
   12.4522    3.2970
   12.8801    3.4562
   12.0373    3.3482
   12.0364    3.5091
   11.9539    3.7354
   11.4775    3.8230
   11.1710    3.7630
   11.1700    3.9748
   12.5730    4.4730
   13.4955    5.3991
   14.3906    5.7953
    5.8729    0.3730];
units.LWd = {'cm', 'g'};     label.LWd = {'fork length', 'dry weights'};  bibkey.LWd = 'Sutton2000';
% 
data.LR = [ ... % fork length (cm), egg number
57.11828777	1610.80492321
54.43132556	3433.87430563
56.50609955	3238.86286897
57.84565951	2645.20204771
59.17933776	2528.35203137
58.72644592	3242.78401046
57.39178739	3439.10249428
58.12847184	3718.54917765
57.53294848	3995.64317612
56.93938569	4113.80023963
56.93546455	4431.67410957
58.86368587	4117.19856225
60.04738046	4159.02407145
60.34783793	3801.93878662
60.64437425	3762.72737175
60.05571289	3483.54209781
59.31314672	3680.90621937
62.27752968	3368.26053807
63.61856007	2655.39701558
65.68745235	2937.19638384
64.34642196	3650.05990633
65.23259993	3810.56529790
66.26582072	4050.80056639
66.86428494	3535.30116545
65.38307374	3612.15553861
62.12068402	4083.21533602
60.04443960	4397.42947391
60.93355844	4319.52946302
61.67073304	4559.24191265
60.63310097	4676.61474785
59.29991286	4753.73053044
60.18560070	4953.97015576
61.51731837	4996.05707439
62.85099662	4879.20705805
64.18908616	4404.74893802
64.03763207	4682.62716480
64.77627709	4803.13691319
63.88519769	5039.97385906
64.03027993	5278.64067095
64.77186581	5160.74501688
62.69071997	5872.30149221
67.59655811	4172.35595251
69.37185492	4254.96133319
69.07090731	4651.78085176
66.85007080	4687.59394401
67.59263697	4490.22982246
67.29119922	4926.78357477
66.25258686	5123.62487746
66.39766910	5362.29168936
65.50904041	5400.45746651
65.95065897	5599.91286352
65.05957957	5836.74980939
65.79822459	5957.25955778
63.56807537	6748.02309117
65.32474676	8340.52935410
67.25884980	7549.24300185
68.29844244	7272.93323167
70.21931162	7554.47119050
70.67171332	6879.77344516
69.78847620	6480.86265113
67.12308027	6555.62574883
67.71762335	6358.00021784
69.05375231	6042.47903279
69.20716698	5605.66387104
70.83297026	5807.21054351
73.79392223	5772.70449842
71.74610609	3782.33307919
73.81989979	3666.79011001
76.78575319	3234.94172748
77.91945322	7329.65907853
77.17933776	7328.35203137
76.57401155	8400.13070472
77.90572922	8442.21762335
78.19638384	8879.81701340
79.37811785	9080.57945758
79.07471953	9676.07014486
83.80949788	9843.37218168
85.73183749	10005.70743928
85.29904150	9091.03583488
84.11338634	9208.14726065
81.60483607	8567.95556040
79.83002941	8445.61594598
79.24283847	8047.22797081
80.28194097	7810.65243438
82.64736957	8053.24038776
83.68353121	8055.07025378
83.08702756	8411.63271975
81.77540573	6740.44221762
85.18679882	6190.17536216
86.68026359	5119.96514541
82.16899031	10833.85252151
82.16751988	10953.05522274
82.16604945	11072.25792397
83.64677050	11035.13778456
83.19289838	11829.03823113
90.76511273	9974.86112624
91.20084958	10651.12732818
89.26821697	11323.21097920
88.08011110	11638.99357368
89.55298987	12237.62117416
90.11714410	14503.51813528];
units.LR   = {'cm', '#'};  label.LR = {'Fork length', 'Number of eggs'};  
bibkey.LR = 'Thorpe1984'; temp.LR = C2K(7);%%% regarder ref
%  
%  data.Ww0.Wwh = [ ... % wet weigh of an egg (g), wet weigh of hatching (g)
%      0.12223  0.05086
%      0.14411  0.05086
%      0.15851  0.058
%      0.18118  0.05808
%      0.20296  0.06068];
%  data.Wd0.Wdh = .35.*data.Ww0.Wwh(:,1);%drymatter from 'Shearer,1994'
%  data.Wd0.Wdh = .28.*data.Ww0.Wwh(:,2);%drymatter from 'Shearer,1994'
%  units.Wd0.Wdh   = {'g', 'g'};  label.Wd0.Wdh = {'', 'Number of eggs'};  
%  bibkey.Wd0.Wdh = {'Kazakov1981','Shearer,1994'};
% % 
%  data.Ww0.Wwb = [ ... % wet weigh of an egg (g), wet weigh of hatching (g)
%      0.12223  0.11951
%      0.14411  0.12092
%      0.15851  0.12354
%      0.18118  0.14592
%      0.20296  0.16346];
%  data.Wd0.Wdb = .35.*data.Ww0.Wwb(:,1);%drymatter from 'Shearer,1994'
%  data.Wd0.Wdb = .17.*data.Ww0.Wwb(:,2);%drymatter from 'Shearer,1994'
%  units.Wd0.Wdb   = {'g', 'g'};  label.Wd0.Wdb = {'', 'Number of eggs'};  
%  bibkey.Wd0.Wdb = {'Kazakov1981','Shearer,1994'};
% %  
  
  
  % %% Grouped plots
% set1 = {'WwJO_1','WwJO_2'}; comment1 = {'O2 uptake SSAF, LSAF'};
% set2 = {'tWw_1','tWw_2'}; comment2 = {'wet weight SSAF, LSAF'};
% set3 = {'tL_1','tL_2'}; comment3 = {'fork length SSAF, LSAF'};
% %set4 = {'LJO5','LJO15'}; comment4 = {'O2 uptake 5 and 15C'};
% metaData.grp.sets = {set1, set2, set3}; metaData.grp.comment = {comment1, comment2, comment3};
% %metaData.grp.sets = {set1, set2, set3, set4}; metaData.grp.comment = {comment1, comment2, comment3, comment4};

%% set weights for all real data
 weights = setweights(data, []);
% 
%weights.tWwp = weights.tWwp * 10; 

weights.tLps = weights.tLps * 10; 
%weights.tWwps = weights.tWwps * 100; 
% weights.tW1 = weights.tW1 * 10; 
% weights.tL1 = weights.tL1 * 10; 
% % growth does something strange after 20 months post hatch, see discussion and paper
% weights.tW2(end-7:end) = weights.tW2(end-7:end) * 0; 
% weights.tL2(end-7:end) = weights.tL2(end-7:end) * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Facts
F1 = 'Many subspecies exist, e.g. O. m. irideus  (coastal rainbow trout), O. m. gairdneri (Columbia River redband trout)';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Best culturing temp 15-16 C';
metaData.bibkey.F2 = 'YaniHisa2002';
F3 = 'Able to spawn several times, each time separated by months';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);
      
%% Discussion
D1 = 'fish base says that females mature after 3 years and males after 2. However there is no reference to back this up. DaviKlemm2014 observed that rapid egg growth occured after 20 months post hatch, so we assume that this coincided with puberty';
D2 = 'we did a lot of empirical adjustments to the weights which needs further study.';
D3 = 'In mod_3, I removed del_M2 and extra filters; put extra weight on psd.k_J (because the used value was 0.1 * the standard one) and included psd.f_tWL = 1 to prevent that it becomes too high';
D4 = 'previous versions included weight and respiration as function of time for two extreme phenotypic families (large and small size and maturity respectively), from McKenPed2007. These families have different parameters and so should be used to make specific entries for those families. ';
metaData.discussion = struct('D1',D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_mykiss}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YaniHisa2002'; type = 'Article'; bib = [ ...  
'author = {T. Yanik and S. A. Hisar and C. Bölükbas}, ' ...
'year = {2002}, ' ...
'title = {EARLY DEVELOPMENT AND GROWTH OF ARCTIC CHARR (SALVELINUS ALPINUS) AND RAINBOW TROUT (ONCORHYNCHUS MYKISS) AT A LOW WATER TEMPERATURE.}, ' ... 
'journal = {The Israeli Journal of Aquaculture – Bamidgeh}, ' ...
'volume = {54(2)}, '...
'pages = {73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/239}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ChenSnow2015'; type = 'Misc'; bib = [...
'author = {Chen, Z. and Snow, M. and Lawrence, C. S. and Church, A. R. and Narum, S. R. and Devlin R. H. and Farrell, A.P.}, ' ...
'year = {2015}, ' ...
'title = {Selection for upper thermal tolerance in rainbow trout (Oncorhynchus mykiss Walbaum)}, ' ... 
'journal = {The Journal of Experimental Biology}, ' ...
'volume = {218}, '...
'pages = {803--812}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 %   
bibkey = 'BudyThie2002'; type = 'Report'; bib = [...
'author = {Budy, P. and Thiede, G. P. and Haddix, T.}, ' ...
'year = {2002}, ' ...
'title = {Rainbow trout growth and survival in Flaming Gorge Reservoir}, ' ...
'institution = {Project XIV Sport Fisheries Research (USU) Annual Report}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'StraStut1997'; type = 'Misc'; bib = [...
'author = {Straus, D. L. and Stuthridge, T. R. and Anderson, S. M. and Gifford, J. S.}, ' ...
'year = {1997}, ' ...
'title = {Acute toxicity of dehydroabietic acid to rainbow trout: Manipulation of biotransformation}, ' ... 
'journal = {Australasian Journal of Ecotoxicology}, ' ...
'volume = {3}, '...
'pages = {131--139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'WeatGill1981'; type = 'Misc'; bib = [...
'author = {Weatherly, A. H. and Gill, H. S.}, ' ...
'year = {1981}, ' ...
'title = {Recovery growth following periods of restricted rations and starvation in rainbow trout Salmo gairdneri Richardson}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {18}, '...
'pages = {195--208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'FromRasm1991'; type = 'Misc'; bib = [...
'author = {From, J. and Rasmussen, G.}, ' ...
'year = {1991}, ' ...
'title = {Growth of rainbow trout, Oncorhynchus mykiss (Walbaum, 1792) related to egg size and temperature}, ' ... 
'journal = {Dana}, ' ...
'volume = {9}, '...
'pages = {31--38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vels1987'; type = 'Report'; bib = [ ...  
'author = {F. P. J. Velsen}, ' ...
'year = {1987}, ' ...
'title = {Temperature and Incubation in Pacific Salmon and Rainbow Trout: Compilation of Data on Median Hatching Time, Mortality and Embryonic Staging}, ' ...
'institution = {Canadian Data Report of Fisheries and Aquatic Science}', ...
'number = {626}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DaviKenn2014'; type = 'Article'; bib = [ ...  
'author = {J. W. Davidson and P. B. Kenney and M. Manor and C. M. Good and G. M. Weber and A. Aussanasuwannakul and P. J. Turk and C. Welsh and S. T. Summerfelt}, ' ...
'year = {2014}, ' ...
'title = {Growth performance, fillet quality, and reproductive maturity of Rainbow Trout (Oncorhynchus mykiss) cultured to 5 kilograms within freshwater recirculating systems}, ' ... 
'journal = {Journal of Aquaculture Research and Development}, ' ...
'volume = {5}, '...
'number = {4},' ...
'doi = {10.4172/2155-9546.1000238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NinnStev2006'; type = 'Article'; bib = [ ...  
'author = {Ninness, M. M. and  Stevens, E. D. and Wright, P. A.}, ' ...
'year = {2006}, ' ...
'title = {Removal of the chorion before hatching results in increased movement and accelerated growth in rainbow trout (Oncorhynchus mykiss) embryos}, ' ... 
'journal = {Journal of Experimental Biology}, ' ...
'volume = {209}, '...
'number = {10},' ...
'pages = {1874--1882}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KieAls1998'; type = 'Article'; bib = [ ...  
'author = {Kieffer, J. D. and Alsop, D. and  Wood, C. M.}, ' ...
'year = {1998}, ' ...
'title = {A respirometric analysis of fuel use during aerobic swimming at different temperatures in rainbow trout (Oncorhynchus mykiss)}, ' ... 
'journal = {Journal of Experimental Biology}, ' ...
'volume = {201}, '...
'number = {22},' ...
'pages = {3123--3133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wie1985'; type = 'Article'; bib = [ ...  
'author = {Wieser, W.}, ' ...
'year = {1985}, ' ...
'title = {Developmental and metabolic constraints of the scope for activity in young rainbow trout (Salmo Gairdneri)}, ' ... 
'journal = {Journal of Experimental Biology}, ' ...
'volume = {118}, '...
'number = {1},' ...
'pages = {133--142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
