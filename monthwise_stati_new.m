%function monthwise_stati(strt_date,end_date)
%This function is calculating statistics that is
%mean,std,RMSE,SI,bias,correlation coefficient and Skill score(1-(RMSE/std(obs)))
%give input monthwise_stati('15-Jan-2014','30-Jan-2014')
%Output:AD07Janstatistics.txt
%clear all;
strt_date='15-Jan-2014';
end_date='31-May-2014';
buoy_name='AD09';
close all;
%buoy_name={'AD07','AD09','BD08','BD11','BD14'};
%for j=1%1:5 %repeat for all the buoys
f_name1=strcat(buoy_name,'_hs_ws_colc2014.txt');% get file name
f_name2=strcat(buoy_name,'_periods_colc2014.txt');
fid1 = fopen(f_name1,'r');% here f_name is made as cell so I have taken f_name{1}
fid2 = fopen(f_name2,'r');
if fid1 < 0
    error('Please check trhe filename')
end
if fid2 < 0
    error('Please check trhe filename')
end
f_name3=strcat(buoy_name,end_date(4:6),'statistics.txt');%opening a new file
fid3=fopen(f_name3,'w');
S1 = textscan(fid1,'%s','Delimiter',',');%scan the file
S2 = textscan(fid2,'%s','Delimiter',',');
S1 = S1{1} ;%cell to matrix
S2 =S2{1};
% 
fclose(fid1) ;
fclose(fid2);
% close the text fie
%
spaces = find(isspace(S1{1})) ;% to know which places are space
%%%%%
%x=[['buoy_hs  ';'buoy_tm  ';'buoy_hsa ';'buoy_tma '],['mode_hs  ';'mode_tm  ';'mode_hsa ';'mode_tma '],['buoy_ws  ';'buoy_tp  ';'buoy_hsb ';'buoy_tmb '],['model_ws  ';'model_tp  ';'model_hsb ';'model_tmb ']];
%%%%%
data1 = zeros(length(S1{1}),4) ;%make zero matrix 
data2 = zeros(length(S2{1}),4) ;
for i = 1:length(S1)
    l1 = S1{i} ;
    l2 = S2{i};
    ss(i)=datenum(l1(1:10));
    data1(i,:) = [str2num(l1(19:23)),str2num(l1(29:33)),str2num(l1(79:83)),str2num(l1(89:93))];
    data2(i,:) = [str2num(l2(19:23)),str2num(l2(29:33)),str2num(l2(39:43)),str2num(l2(49:53))];
    data3(i,:) = [str2num(l1(39:43)),str2num(l1(49:53)),str2num(l1(59:63)),str2num(l1(69:73))];
    data4(i,:) = [str2num(l2(59:63)),str2num(l2(69:73)),str2num(l2(79:83)),str2num(l2(89:93))];
end

 st1=find(ss==datenum(strt_date));%find location(index) of starting date
 en1=find(ss==datenum(end_date));% find location(index) of ending date
 
 % %data1()=data1(st1:en1,:);
 data1=data1(st1:en1,:);%Data only taken from staring and ending date
 data2=data2(st1:en1,:);
 data3=data3(st1:en1,:);
 data4=data4(st1:en1,:);
%Ploting all parameters monthwise
plot(data1(:,1),'r','linewidth',2); hold on; plot(data1(:,2),'g','LineWidth',2);
legend('buoy-hs','expt1-hs')
ylabel('significant wave height')
title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
 set(gca,'XTick',[1:10:length(data1)])
 set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
 %axis equal
 %saveas(gcf,end_date(4:6),'_hs.png')
figure(2)
plot(data1(:,3),'r','LineWidth',2); hold on; plot(data1(:,4),'g','LineWidth',2);
 legend('buoy-ws','expt1-ws')
 ylabel('wind speed') 
 title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
 set(gca,'XTick',[1:10:length(data1)])
  set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
% saveas(gcf,end_date(4:6),'_ws_all.png')
 figure(3)
 plot(data2(:,1),'r','LineWidth',2); hold on; plot(data2(:,2),'g','LineWidth',2);
 legend('buoy-tm','expt1-tm')
 ylabel('mean period')
 title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
 set(gca,'XTick',[1:10:length(data1)])
 set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
 %saveas(gcf,end_date(4:6),'_tm.png')
 figure(4)
 plot(data2(:,3),'r','LineWidth',2); hold on; plot(data2(:,4),'g','LineWidth',2);
 legend('buoy-tp','expt1-tp')
 ylabel('peak period')
 title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
 set(gca,'XTick',[1:10:length(data1)])
 set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
 %saveas(gcf,end_date(4:6),'_tp.png')
 figure(5)
 plot(data3(:,1),'r','LineWidth',2); hold on; plot(data3(:,2),'g','LineWidth',2);
 legend('buoy-hsa','expt1-hsa')
ylabel('swell significant height')
 title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
 set(gca,'XTick',[1:10:length(data1)])
 set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
 %saveas(gcf,end_date(4:6),'_hsa.png')
 figure(6)
 plot(data3(:,3),'r','LineWidth',2); hold on; plot(data3(:,4),'g','LineWidth',2);
 legend('buoy-hsb','expt1-hsb')
  ylabel('sea significant height')
  title('AD09')
  ss1=datestr(ss(st1:10:en1)); 
  set(gca,'XTick',[1:10:length(data1)])
  set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
 %saveas(gcf,end_date(4:6),'_hsb.png')
 figure(7)
 plot(data4(:,1),'r','LineWidth',2); hold on; plot(data4(:,2),'g','LineWidth',2);
 legend('buoy-tma','expt1-tma')
 ylabel('swell mean period')
 title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
 set(gca,'XTick',[1:10:length(data1)])
 set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
 %saveas(gcf,end_date(4:6),'_tma.png')
 figure(8)
 plot(data4(:,3),'r','LineWidth',2); hold on; plot(data4(:,4),'g','LineWidth',2);
 legend('buoy-tmb','expt1-tmb')
 ylabel('sea mean period') 
 title('AD09')
 ss1=datestr(ss(st1:10:en1)); 
  set(gca,'XTick',[1:10:length(data1)])
  set(gca,'XTickLabel',ss1(:,1:6))%,'XTickLabelRotation',45)
%saveas(gcf,end_date(4:6),'_tmb.png')
% Writing all the statistics into one file
fprintf('calculating bias of.....\n')
[bias_hs,bias_ws,bias_tm,bias_tp,bias_hsa,bias_hsb,bias_tma,bias_tmb]=calc_bias(data1,data2,data3,data4);
fprintf(fid3,'%10s\r\n','Bias');
fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s \r\n','hs','ws','tm','tp','hsa','hsb','tma','tmb');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f\r\n',bias_hs,bias_ws,bias_tm,bias_tp,bias_hsa,bias_hsb,bias_tma,bias_tmb);
fprintf('calculating rmse of.....\n')
[rmse_hs,rmse_ws,rmse_tm,rmse_tp,rmse_hsa,rmse_hsb,rmse_tma,rmse_tmb]=calc_rmse(data1,data2,data3,data4);
fprintf(fid3,'%10s\r\n','RMSE');
fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s\r\n','hs','ws','tm','tp','hsa','hsb','tma','tmb');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f\r\n',rmse_hs,rmse_ws,rmse_tm,rmse_tp,rmse_hsa,rmse_hsb,rmse_tma,rmse_tmb);
fprintf('calculating corref of.....\n')
fprintf(fid3,'%10s\r\n','CORREF');
[corr_hs,corr_ws,corr_tm,corr_tp,corr_hsa,corr_hsb,corr_tma,corr_tmb]=calc_corref(data1,data2,data3,data4);
fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s\r\n','hs','ws','tm','tp','hsa','hsb','tma','tmb');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f\r\n',corr_hs,corr_ws,corr_tm,corr_tp,corr_hsa,corr_hsb,corr_tma,corr_tmb);
fprintf('calculating SI.....\n')
fprintf(fid3,'%10s\r\n','SI');
[SI_hs,SI_ws,SI_tm,SI_tp,SI_hsa,SI_hsb,SI_tma,SI_tmb]=calc_SI(data1,data2,data3,data4);
fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s\r\n','hs','ws','tm','tp','hsa','hsb','tma','tmb');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f\r\n',SI_hs,SI_ws,SI_tm,SI_tp,SI_hsa,SI_hsb,SI_tma,SI_tmb);
fprintf('calculating SS.....\n')
fprintf(fid3,'%12s\r\n','Skil Score');
[SS_hs,SS_ws,SS_tm,SS_tp,SS_hsa,SS_hsb,SS_tma,SS_tmb]=calc_SS(data1,data2,data3,data4);
fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s  %s\r\n','hs','ws','tm','tp','hsa','hsb','tma','tmb');
fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f  %f\r\n',SS_hs,SS_ws,SS_tm,SS_tp,SS_hsa,SS_hsb,SS_tma,SS_tmb);
%end
%end