close all;
clear all;
clc;
buoy_name='AD06';
bhs=[]; dhs=[];ndhs=[];btp=[]; dtp=[];ndtp=[];
c=1;
for i=0:6:120
    fname=strcat('colloc_da_noda_',num2str(i),'hr',buoy_name,'.txt');
    disp(fname)
    [d1,h1,bhs1,dhs1,ndhs1,btm1,dtm1,ndtm1,btp1,dtp1,ndtp1,bmdir1,dmdir1,nmdir1]=textread(fname,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    bhs(:,c)=bhs1; dhs(:,c)=dhs1; ndhs(:,c)=ndhs1; 
    btp(:,c)=btp1; dtp(:,c)=dtp1; ndtp(:,c)=ndtp1;
    c=c+1;
end
data1=[bhs(:,1) dhs(:,1) ndhs(:,1) btp(:,1) dtp(:,1) ndtp(:,1)];data2=[bhs(:,2) dhs(:,2) ndhs(:,2) btp(:,2) dtp(:,2) ndtp(:,2)];data3=[bhs(:,3) dhs(:,3) ndhs(:,3) btp(:,3) dtp(:,3) ndtp(:,3)];
data4=[bhs(:,4) dhs(:,4) ndhs(:,4) btp(:,4) dtp(:,4) ndtp(:,4)];data5=[bhs(:,5) dhs(:,5) ndhs(:,5) btp(:,5) dtp(:,5) ndtp(:,5)];data6=[bhs(:,6) dhs(:,6) ndhs(:,6) btp(:,6) dtp(:,6) ndtp(:,6)];
data7=[bhs(:,7) dhs(:,7) ndhs(:,7) btp(:,7) dtp(:,7) ndtp(:,7)];data8=[bhs(:,8) dhs(:,8) ndhs(:,8) btp(:,8) dtp(:,8) ndtp(:,8)];data9=[bhs(:,9) dhs(:,9) ndhs(:,9) btp(:,9) dtp(:,9) ndtp(:,9)];
data10=[bhs(:,10) dhs(:,10) ndhs(:,10) btp(:,10) dtp(:,10) ndtp(:,10)];data11=[bhs(:,11) dhs(:,11) ndhs(:,11) btp(:,11) dtp(:,11) ndtp(:,11)];data12=[bhs(:,12) dhs(:,12) ndhs(:,12) btp(:,12) dtp(:,12) ndtp(:,12)];
data13=[bhs(:,13) dhs(:,13) ndhs(:,13) btp(:,13) dtp(:,13) ndtp(:,13)];data14=[bhs(:,14) dhs(:,14) ndhs(:,14) btp(:,14) dtp(:,14) ndtp(:,14)];data15=[bhs(:,15) dhs(:,15) ndhs(:,15) btp(:,15) dtp(:,15) ndtp(:,15)];
data16=[bhs(:,16) dhs(:,16) ndhs(:,16) btp(:,16) dtp(:,16) ndtp(:,16)];data17=[bhs(:,17) dhs(:,17) ndhs(:,17) btp(:,17) dtp(:,17) ndtp(:,17)];data18=[bhs(:,18) dhs(:,18) ndhs(:,18) btp(:,18) dtp(:,18) ndtp(:,18)];
data19=[bhs(:,19) dhs(:,19) ndhs(:,19) btp(:,19) dtp(:,19) ndtp(:,19)];data20=[bhs(:,20) dhs(:,20) ndhs(:,20) btp(:,20) dtp(:,20) ndtp(:,20)];data21=[bhs(:,21) dhs(:,21) ndhs(:,21) btp(:,21) dtp(:,21) ndtp(:,21)];
data1=data1(~any(isnan(data1),2),:);data2=data2(~any(isnan(data2),2),:);data3=data3(~any(isnan(data3),2),:);
data4=data4(~any(isnan(data4),2),:);data5=data5(~any(isnan(data5),2),:);data6=data6(~any(isnan(data6),2),:);
data7=data7(~any(isnan(data7),2),:);data8=data8(~any(isnan(data8),2),:);data9=data9(~any(isnan(data9),2),:);
data10=data10(~any(isnan(data10),2),:);data11=data11(~any(isnan(data11),2),:);data12=data12(~any(isnan(data12),2),:);
data13=data13(~any(isnan(data13),2),:);data14=data14(~any(isnan(data14),2),:);data15=data15(~any(isnan(data15),2),:);
data16=data16(~any(isnan(data16),2),:);data17=data17(~any(isnan(data17),2),:);data18=data18(~any(isnan(data18),2),:);
data19=data19(~any(isnan(data19),2),:);data20=data20(~any(isnan(data20),2),:);data21=data21(~any(isnan(data21),2),:);
fid3=fopen(strcat('statistics_0-120hr_hs_',buoy_name,'_plot.txt'),'w');
fid4=fopen(strcat('statistics_0-120hr_tp_',buoy_name,'_plot.txt'),'w');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 STATISTICS OF SIGNIFICANT HEIGHT                %
%%%%%%%%%%%%%%%%%%%%%%%%%% BIAS HSDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating bias of DA.....\n')
[bias_hs1,bias_hs2,bias_hs3,bias_hs4,bias_hs5,bias_hs6,bias_hs7,bias_hs8,bias_hs9, ...
bias_hs10,bias_hs11,bias_hs12,bias_hs13,bias_hs14,bias_hs15,bias_hs16,bias_hs17,bias_hs18, ...
bias_hs19,bias_hs20,bias_hs21]=calc_bias_hs(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
%fprintf(fid3,'%10s\r\n','Bias_DA');
%fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hs1','hs2','hs3','hs4','hs5','hs6','hs7','hs8','hs9','hs10', ...
%'hs11','hs12','hs13','hs14','hs15','hs16','hs17','hs18','hs19','hs20','hs21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',bias_hs1,bias_hs2,bias_hs3,bias_hs4,bias_hs5,bias_hs6, ...
bias_hs7,bias_hs8,bias_hs9,bias_hs10,bias_hs11,bias_hs12,bias_hs13,bias_hs14,bias_hs15,bias_hs16,bias_hs17,bias_hs18,bias_hs19,bias_hs20,bias_hs21);
%%%%%%%%%%%%%%%%%%%%%%%%%% BIAS HSNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating bias of NODA.....\n')
[bias_hsn1,bias_hsn2,bias_hsn3,bias_hsn4,bias_hsn5,bias_hsn6,bias_hsn7,bias_hsn8,bias_hsn9, ...
bias_hsn10,bias_hsn11,bias_hsn12,bias_hsn13,bias_hsn14,bias_hsn15,bias_hsn16,bias_hsn17,bias_hsn18, ...
bias_hsn19,bias_hsn20,bias_hsn21]=calc_bias_hs_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
%fprintf(fid3,'%10s\r\n','Bias_NODA');
%fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hsn1','hsn2','hsn3','hsn4','hsn5','hsn6','hsn7','hsn8','hsn9','hsn10', ...
%'hsn11','hsn12','hsn13','hsn14','hsn15','hsn16','hsn17','hsn18','hsn19','hsn20','hsn21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',bias_hsn1,bias_hsn2,bias_hsn3,bias_hsn4,bias_hsn5,bias_hsn6, ...
bias_hsn7,bias_hsn8,bias_hsn9,bias_hsn10,bias_hsn11,bias_hsn12,bias_hsn13,bias_hsn14,bias_hsn15,bias_hsn16,bias_hsn17,bias_hsn18,bias_hsn19,bias_hsn20,bias_hsn21); 
%%%%%%%%%%%%%%%%%%%%%%%%% RMSE HSDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating RMSE of DA.....\n')
[rmse_hs1,rmse_hs2,rmse_hs3,rmse_hs4,rmse_hs5,rmse_hs6,rmse_hs7,rmse_hs8,rmse_hs9, ...
rmse_hs10,rmse_hs11,rmse_hs12,rmse_hs13,rmse_hs14,rmse_hs15,rmse_hs16,rmse_hs17,rmse_hs18, ...
rmse_hs19,rmse_hs20,rmse_hs21]=calc_rmse_hs(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
%fprintf(fid3,'%10s\r\n','RMSE_DA');
%fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hs1','hs2','hs3','hs4','hs5','hs6','hs7','hs8','hs9','hs10', ...
%'hs11','hs12','hs13','hs14','hs15','hs16','hs17','hs18','hs19','hs20','hs21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',rmse_hs1,rmse_hs2,rmse_hs3,rmse_hs4,rmse_hs5,rmse_hs6, ...
rmse_hs7,rmse_hs8,rmse_hs9,rmse_hs10,rmse_hs11,rmse_hs12,rmse_hs13,rmse_hs14,rmse_hs15,rmse_hs16,rmse_hs17,rmse_hs18,rmse_hs19,rmse_hs20,rmse_hs21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%% RMSE HSNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating RMSE of NoDA.....\n')
[rmse_hsn1,rmse_hsn2,rmse_hsn3,rmse_hsn4,rmse_hsn5,rmse_hsn6,rmse_hsn7,rmse_hsn8,rmse_hsn9, ...
rmse_hsn10,rmse_hsn11,rmse_hsn12,rmse_hsn13,rmse_hsn14,rmse_hsn15,rmse_hsn16,rmse_hsn17,rmse_hsn18, ...
rmse_hsn19,rmse_hsn20,rmse_hsn21]=calc_rmse_hs_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
%fprintf(fid3,'%10s\r\n','RMSE_NODA');
%fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hsn1','hsn2','hsn3','hsn4','hsn5','hsn6','hsn7','hsn8','hsn9','hsn10', ...
%'hsn11','hsn12','hsn13','hsn14','hsn15','hsn16','hsn17','hsn18','hs19','hs20','hs21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',rmse_hsn1,rmse_hsn2,rmse_hsn3,rmse_hsn4,rmse_hsn5,rmse_hsn6, ...
rmse_hsn7,rmse_hsn8,rmse_hsn9,rmse_hsn10,rmse_hsn11,rmse_hsn12,rmse_hsn13,rmse_hsn14,rmse_hsn15,rmse_hsn16,rmse_hsn17,rmse_hsn18,rmse_hsn19,rmse_hsn20,rmse_hsn21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CORR HSDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating CORR of DA.....\n')
[corr_hs1,corr_hs2,corr_hs3,corr_hs4,corr_hs5,corr_hs6,corr_hs7,corr_hs8,corr_hs9, ...
corr_hs10,corr_hs11,corr_hs12,corr_hs13,corr_hs14,corr_hs15,corr_hs16,corr_hs17,corr_hs18, ...
corr_hs19,corr_hs20,corr_hs21]=calc_corref_hs(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
%fprintf(fid3,'%10s\r\n','CORR_DA');
%fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hs1','hs2','hs3','hs4','hs5','hs6','hs7','hs8','hs9','hs10', ...
%'hs11','hs12','hs13','hs14','hs15','hs16','hs17','hs18','hs19','hs20','hs21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',corr_hs1,corr_hs2,corr_hs3,corr_hs4,corr_hs5,corr_hs6, ...
corr_hs7,corr_hs8,corr_hs9,corr_hs10,corr_hs11,corr_hs12,corr_hs13,corr_hs14,corr_hs15,corr_hs16,corr_hs17,corr_hs18,corr_hs19,corr_hs20,corr_hs21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CORR HSNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating CORR of NoDA.....\n')
[corr_hsn1,corr_hsn2,corr_hsn3,corr_hsn4,corr_hsn5,corr_hsn6,corr_hsn7,corr_hsn8,corr_hsn9, ...
corr_hsn10,corr_hsn11,corr_hsn12,corr_hsn13,corr_hsn14,corr_hsn15,corr_hsn16,corr_hsn17,corr_hsn18, ...
corr_hsn19,corr_hsn20,corr_hsn21]=calc_corref_hs_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid3,'%10s\r\n','CORR_NODA');
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hsn1','hsn2','hsn3','hsn4','hsn5','hsn6','hsn7','hsn8','hsn9','hsn10', ...
% 'hsn11','hsn12','hsn13','hsn14','hsn15','hsn16','hsn17','hsn18','hsn19','hsn20','hsn21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',corr_hsn1,corr_hsn2,corr_hsn3,corr_hsn4,corr_hsn5,corr_hsn6, ...
corr_hsn7,corr_hsn8,corr_hsn9,corr_hsn10,corr_hsn11,corr_hsn12,corr_hsn13,corr_hsn14,corr_hsn15,corr_hsn16,corr_hsn17,corr_hsn18,corr_hsn19,corr_hsn20,corr_hsn21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SI HSDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating SI of DA.....\n')
[SI_hs1,SI_hs2,SI_hs3,SI_hs4,SI_hs5,SI_hs6,SI_hs7,SI_hs8,SI_hs9,SI_hs10,SI_hs11,SI_hs12,SI_hs13,SI_hs14,SI_hs15,SI_hs16,SI_hs17,SI_hs18, ...
SI_hs19,SI_hs20,SI_hs21]=calc_SI_hs(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid3,'%10s\r\n','SI_DA');
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hs1','hs2','hs3','hs4','hs5','hs6','hs7','hs8','hs9','hs10', ...
% 'hs11','hs12','hs13','hs14','hs15','hs16','hs17','hs18','hs19','hs20','hs21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',SI_hs1,SI_hs2,SI_hs3,SI_hs4,SI_hs5,SI_hs6, ...
SI_hs7,SI_hs8,SI_hs9,SI_hs10,SI_hs11,SI_hs12,SI_hs13,SI_hs14,SI_hs15,SI_hs16,SI_hs17,SI_hs18,SI_hs19,SI_hs20,SI_hs21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SI HSNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating SI of NoDA.....\n')
[SI_hsn1,SI_hsn2,SI_hsn3,SI_hsn4,SI_hsn5,SI_hsn6,SI_hsn7,SI_hsn8,SI_hsn9,SI_hsn10,SI_hsn11,SI_hsn12,SI_hsn13,SI_hsn14,SI_hsn15,SI_hsn16,SI_hsn17,SI_hsn18, ...
SI_hsn19,SI_hsn20,SI_hsn21]=calc_SI_hs_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid3,'%10s\r\n','SI_NODA');
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','hsn1','hsn2','hsn3','hsn4','hsn5','hsn6','hsn7','hsn8','hsn9','hsn10', ...
% 'hsn11','hsn12','hsn13','hsn14','hsn15','hsn16','hsn17','hsn18','hsn19','hsn20','hsn21');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',SI_hsn1,SI_hsn2,SI_hsn3,SI_hsn4,SI_hsn5,SI_hsn6, ...
SI_hsn7,SI_hsn8,SI_hsn9,SI_hsn10,SI_hsn11,SI_hsn12,SI_hsn13,SI_hsn14,SI_hsn15,SI_hsn16,SI_hsn17,SI_hsn18,SI_hsn19,SI_hsn20,SI_hsn21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           STATISTICS OF PEAK PERIOD                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% BIAS TPDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating bias of DA.....\n')
[bias_tp1,bias_tp2,bias_tp3,bias_tp4,bias_tp5,bias_tp6,bias_tp7,bias_tp8,bias_tp9, ...
bias_tp10,bias_tp11,bias_tp12,bias_tp13,bias_tp14,bias_tp15,bias_tp16,bias_tp17,bias_tp18, ...
bias_tp19,bias_tp20,bias_tp21]=calc_bias_tp(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','Bias_DA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tp1','tp2','tp3','tp4','tp5','tp6','tp7','tp8','tp9','tp10', ...
% 'tp11','tp12','tp13','tp14','tp15','tp16','tp17','tp18','tp19','tp20','tp21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',bias_tp1,bias_tp2,bias_tp3,bias_tp4,bias_tp5,bias_tp6, ...
bias_tp7,bias_tp8,bias_tp9,bias_tp10,bias_tp11,bias_tp12,bias_tp13,bias_tp14,bias_tp15,bias_tp16,bias_tp17,bias_tp18,bias_tp19,bias_tp20,bias_tp21);
%%%%%%%%%%%%%%%%%%%%%%%%%% BIAS TPNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating bias of NODA.....\n')
[bias_tpn1,bias_tpn2,bias_tpn3,bias_tpn4,bias_tpn5,bias_tpn6,bias_tpn7,bias_tpn8,bias_tpn9, ...
bias_tpn10,bias_tpn11,bias_tpn12,bias_tpn13,bias_tpn14,bias_tpn15,bias_tpn16,bias_tpn17,bias_tpn18, ...
bias_tpn19,bias_tpn20,bias_tpn21]=calc_bias_tp_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','Bias_NODA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tpn1','tpn2','tpn3','tpn4','tpn5','tpn6','tpn7','tpn8','tpn9','tpn10', ...
% 'tpn11','tpn12','tpn13','tpn14','tpn15','tpn16','tpn17','tpn18','tpn19','tpn20','tpn21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',bias_tpn1,bias_tpn2,bias_tpn3,bias_tpn4,bias_tpn5,bias_tpn6, ...
bias_tpn7,bias_tpn8,bias_tpn9,bias_tpn10,bias_tpn11,bias_tpn12,bias_tpn13,bias_tpn14,bias_tpn15,bias_tpn16,bias_tpn17,bias_tpn18,bias_tpn19,bias_tpn20,bias_tpn21); 
%%%%%%%%%%%%%%%%%%%%%%%%% RMSE TPDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating RMSE of DA.....\n')
[rmse_tp1,rmse_tp2,rmse_tp3,rmse_tp4,rmse_tp5,rmse_tp6,rmse_tp7,rmse_tp8,rmse_tp9, ...
rmse_tp10,rmse_tp11,rmse_tp12,rmse_tp13,rmse_tp14,rmse_tp15,rmse_tp16,rmse_tp17,rmse_tp18, ...
rmse_tp19,rmse_tp20,rmse_tp21]=calc_rmse_tp(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','RMSE_DA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tp1','tp2','tp3','tp4','tp5','tp6','tp7','tp8','tp9','tp10', ...
% 'tp11','tp12','tp13','tp14','tp15','tp16','tp17','tp18','tp19','tp20','tp21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',rmse_tp1,rmse_tp2,rmse_tp3,rmse_tp4,rmse_tp5,rmse_tp6, ...
rmse_tp7,rmse_tp8,rmse_tp9,rmse_tp10,rmse_tp11,rmse_tp12,rmse_tp13,rmse_tp14,rmse_tp15,rmse_tp16,rmse_tp17,rmse_tp18,rmse_tp19,rmse_tp20,rmse_tp21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%% RMSE TPNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating RMSE of NoDA.....\n')
[rmse_tpn1,rmse_tpn2,rmse_tpn3,rmse_tpn4,rmse_tpn5,rmse_tpn6,rmse_tpn7,rmse_tpn8,rmse_tpn9, ...
rmse_tpn10,rmse_tpn11,rmse_tpn12,rmse_tpn13,rmse_tpn14,rmse_tpn15,rmse_tpn16,rmse_tpn17,rmse_tpn18, ...
rmse_tpn19,rmse_tpn20,rmse_tpn21]=calc_rmse_tp_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','RMSE_NODA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tpn1','tpn2','tpn3','tpn4','tpn5','tpn6','tpn7','tpn8','tpn9','tpn10', ...
% 'tpn11','tpn12','tpn13','tpn14','tpn15','tpn16','tpn17','tpn18','tp19','tp20','tp21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',rmse_tpn1,rmse_tpn2,rmse_tpn3,rmse_tpn4,rmse_tpn5,rmse_tpn6, ...
rmse_tpn7,rmse_tpn8,rmse_tpn9,rmse_tpn10,rmse_tpn11,rmse_tpn12,rmse_tpn13,rmse_tpn14,rmse_tpn15,rmse_tpn16,rmse_tpn17,rmse_tpn18,rmse_tpn19,rmse_tpn20,rmse_tpn21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CORR TPDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating CORR of DA.....\n')
[corr_tp1,corr_tp2,corr_tp3,corr_tp4,corr_tp5,corr_tp6,corr_tp7,corr_tp8,corr_tp9, ...
corr_tp10,corr_tp11,corr_tp12,corr_tp13,corr_tp14,corr_tp15,corr_tp16,corr_tp17,corr_tp18, ...
corr_tp19,corr_tp20,corr_tp21]=calc_corref_tp(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','CORR_DA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tp1','tp2','tp3','tp4','tp5','tp6','tp7','tp8','tp9','tp10', ...
% 'tp11','tp12','tp13','tp14','tp15','tp16','tp17','tp18','tp19','tp20','tp21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',corr_tp1,corr_tp2,corr_tp3,corr_tp4,corr_tp5,corr_tp6, ...
corr_tp7,corr_tp8,corr_tp9,corr_tp10,corr_tp11,corr_tp12,corr_tp13,corr_tp14,corr_tp15,corr_tp16,corr_tp17,corr_tp18,corr_tp19,corr_tp20,corr_tp21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CORR TPNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating CORR of NoDA.....\n')
[corr_tpn1,corr_tpn2,corr_tpn3,corr_tpn4,corr_tpn5,corr_tpn6,corr_tpn7,corr_tpn8,corr_tpn9, ...
corr_tpn10,corr_tpn11,corr_tpn12,corr_tpn13,corr_tpn14,corr_tpn15,corr_tpn16,corr_tpn17,corr_tpn18, ...
corr_tpn19,corr_tpn20,corr_tpn21]=calc_corref_tp_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','CORR_NODA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tpn1','tpn2','tpn3','tpn4','tpn5','tpn6','tpn7','tpn8','tpn9','tpn10', ...
% 'tpn11','tpn12','tpn13','tpn14','tpn15','tpn16','tpn17','tpn18','tpn19','tpn20','tpn21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',corr_tpn1,corr_tpn2,corr_tpn3,corr_tpn4,corr_tpn5,corr_tpn6, ...
corr_tpn7,corr_tpn8,corr_tpn9,corr_tpn10,corr_tpn11,corr_tpn12,corr_tpn13,corr_tpn14,corr_tpn15,corr_tpn16,corr_tpn17,corr_tpn18,corr_tpn19,corr_tpn20,corr_tpn21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SI TPDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating SI of DA.....\n')
[SI_tp1,SI_tp2,SI_tp3,SI_tp4,SI_tp5,SI_tp6,SI_tp7,SI_tp8,SI_tp9,SI_tp10,SI_tp11,SI_tp12,SI_tp13,SI_tp14,SI_tp15,SI_tp16,SI_tp17,SI_tp18, ...
SI_tp19,SI_tp20,SI_tp21]=calc_SI_tp(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','SI_DA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tp1','tp2','tp3','tp4','tp5','tp6','tp7','tp8','tp9','tp10', ...
% 'tp11','tp12','tp13','tp14','tp15','tp16','tp17','tp18','tp19','tp20','tp21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',SI_tp1,SI_tp2,SI_tp3,SI_tp4,SI_tp5,SI_tp6, ...
SI_tp7,SI_tp8,SI_tp9,SI_tp10,SI_tp11,SI_tp12,SI_tp13,SI_tp14,SI_tp15,SI_tp16,SI_tp17,SI_tp18,SI_tp19,SI_tp20,SI_tp21);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SI TPNODA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('calculating SI of NoDA.....\n')
[SI_tpn1,SI_tpn2,SI_tpn3,SI_tpn4,SI_tpn5,SI_tpn6,SI_tpn7,SI_tpn8,SI_tpn9,SI_tpn10,SI_tpn11,SI_tpn12,SI_tpn13,SI_tpn14,SI_tpn15,SI_tpn16,SI_tpn17,SI_tpn18, ...
SI_tpn19,SI_tpn20,SI_tpn21]=calc_SI_tp_nda(data1,data2,data3,data4,data5,data6,data7,data8,data9, ...
data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21);
% fprintf(fid4,'%10s\r\n','SI_NODA');
% fprintf(fid4,'%s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\r\n','tpn1','tpn2','tpn3','tpn4','tpn5','tpn6','tpn7','tpn8','tpn9','tpn10', ...
% 'tpn11','tpn12','tpn13','tpn14','tpn15','tpn16','tpn17','tpn18','tpn19','tpn20','tpn21');
fprintf(fid4,'%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\r\n',SI_tpn1,SI_tpn2,SI_tpn3,SI_tpn4,SI_tpn5,SI_tpn6, ...
SI_tpn7,SI_tpn8,SI_tpn9,SI_tpn10,SI_tpn11,SI_tpn12,SI_tpn13,SI_tpn14,SI_tpn15,SI_tpn16,SI_tpn17,SI_tpn18,SI_tpn19,SI_tpn20,SI_tpn21);