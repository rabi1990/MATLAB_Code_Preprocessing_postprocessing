%function monthwise_stati_st2w_newswtich(st_dt,ed_dt,buoy_name)
%This function is calculating statistics that is
%mean,std,RMSE,SI,bias,correlation coefficient and Skill score(1-(RMSE/std(obs)))
%give input monthwise_stati('15-Jan-2014','30-Jan-2014')
%Output:AD07Janstatistics.txt
clear all;
st_dt='15-Jan-2016';
ed_dt='12-Dec-2016';
b_name='BD11';
close all;
f_name3=strcat(b_name,'_',st_dt(4:6),'-',ed_dt(4:6),'_stat_new.txt');%opening a new file
fid3=fopen(f_name3,'w');
hsmo=[];hsbo=[];hsamo=[];hsabo=[];hsbmo=[];hsbbo=[];tpmo=[];tpbo=[];
tmmo=[];tmbo=[];tmamo=[];tmabo=[];tmbmo=[];tmbbo=[];wsmo=[];wsbo=[];
for i=1:1
[dt hr hs1 hs2 hsa1 hsa2 hsb1 hsb2 tp1 tp2 tm1 tm2 tma1 tma2 tmb1 tmb2 ws1 ws2]=textread([b_name(i,:),'_colloc_gapfill_fcst.txt'],'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
  date1=cell2mat(dt);
 date11=datestr(date1);
 st114=find(datenum(date11)==datenum(st_dt));
 en114=find(datenum(date11)==datenum(ed_dt));
 hsmo=[hsmo;hs1(st114(1):en114(end))];
 hsbo=[hsbo;hs2(st114(1):en114(end))];
 hsamo=[hsamo;hsa1(st114(1):en114(end))];
 hsabo=[hsabo;hsa2(st114(1):en114(end))];
 hsbmo=[hsbmo;hsb1(st114(1):en114(end))];
 hsbbo=[hsbbo;hsb2(st114(1):en114(end))];
 tpmo=[tpmo;tp1(st114(1):en114(end))];
 tpbo=[tpbo;tp2(st114(1):en114(end))];
 tmmo=[tmmo;tm1(st114(1):en114(end))];
 tmbo=[tmbo;tm2(st114(1):en114(end))];
 tmamo=[tmamo;tma1(st114(1):en114(end))];
 tmabo=[tmabo;tma2(st114(1):en114(end))];
 tmbmo=[tmbmo;tmb1(st114(1):en114(end))];
 tmbbo=[tmbbo;tmb2(st114(1):en114(end))];
 wsmo=[wsmo;ws1(st114(1):en114(end))];
 wsbo=[wsbo;ws2(st114(1):en114(end))];
 disp(i)
end
data1=[hsbo hsmo hsabo hsamo]; 
data2=[hsbbo hsbmo tmbo tmmo];
data3=[tmabo tmamo tmbbo tmbmo];
data4=[tpbo tpmo wsbo wsmo];
date1=cell2mat(dt);
h=figure(1)
plot(data1(:,1),'k','linewidth',2)
hold on
plot(data1(:,2),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Significant Wave Height (m)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
%set(h,'PaperOrientation','landscape');
%print -painters -dpng -r600 test.png
figure(2)
plot(data1(:,3),'k','linewidth',2)
hold on
plot(data1(:,4),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Swell Height (m)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
figure(3)
plot(data2(:,1),'k','linewidth',2)
hold on
plot(data2(:,2),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Sea Height(m)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
figure(4)
plot(data2(:,3),'k','linewidth',2)
hold on
plot(data2(:,4),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Mean Period (s)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
figure(5)
plot(data3(:,1),'k','linewidth',2)
hold on
plot(data3(:,2),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Swell Mean Period (s)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
figure(6)
plot(data3(:,3),'k','linewidth',2)
hold on
plot(data3(:,4),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Sea Mean Period (s)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
figure(7)
plot(data4(:,1),'k','linewidth',2)
hold on
plot(data4(:,2),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Peak Period (s)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)
figure(8)
plot(data4(:,3),'k','linewidth',2)
hold on
plot(data4(:,4),'r','linewidth',2)
dd=datestr(date1(st114(1):8:en114(end),6:10),'mmm-dd-yyyy');
set(gca,'xtick',1:8:length(st114(1):en114(end)));
set(gca,'xticklabel',dd(:,1:6),'fontweight','bold','fontsize',18)
ylabel('Wind Speed (m/s)','fontweight','bold','fontsize',18)
legend('Obs','Model','fontweight','bold','fontsize',18)
title(b_name,'fontweight','bold','fontsize',18)

% data1=data1(~any(isnan(data1),2),:);
% data2=data2(~any(isnan(data2),2),:);
% data3=data3(~any(isnan(data3),2),:);
% data4=data4(~any(isnan(data4),2),:);
%  fprintf('calculating bias of.....\n')
% [bias_hs,bias_hsa,bias_hsb,bias_tm,bias_tma,bias_tmb,bias_tp,bias_ws]=calc_bias(data1,data2,data3,data4);
% fprintf(fid3,'%10s\r\n','Bias');
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s %s \r\n','hs','hsa','hsb','tm','tma','tmb','tp','ws');
% fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f %f\r\n',bias_hs,bias_hsa,bias_hsb,bias_tm,bias_tma,bias_tmb,bias_tp,bias_ws);
% fprintf('calculating rmse of.....\n')
% [rmse_hs,rmse_hsa,rmse_hsb,rmse_tm,rmse_tma,rmse_tmb,rmse_tp,rmse_ws]=calc_rmse(data1,data2,data3,data4);
% fprintf(fid3,'%10s\r\n','RMSE');
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s %s\r\n','hs','hsa','hsb','tm','tma','tmb','tp','ws');
% fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f %f\r\n',rmse_hs,rmse_hsa,rmse_hsb,rmse_tm,rmse_tma,rmse_tmb,rmse_tp,rmse_ws);
% fprintf('calculating corref of.....\n')
% fprintf(fid3,'%10s\r\n','CORREF');
% [corr_hs,corr_hsa,corr_hsb,corr_tm,corr_tma,corr_tmb,corr_tp,corr_ws]=calc_corref(data1,data2,data3,data4);
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s %s \r\n','hs','hsa','hsb','tm','tma','tmb','tp','ws');
% fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f %f\r\n',corr_hs,corr_hsa,corr_hsb,corr_tm,corr_tma,corr_tmb,corr_tp,corr_ws);
% fprintf('calculating SI.....\n')
% fprintf(fid3,'%10s\r\n','SI');
% [SI_hs,SI_hsa,SI_hsb,SI_tm,SI,SI_tmb,SI_tp,SI_ws]=calc_SI(data1,data2,data3,data4);
% fprintf(fid3,'%s  %s  %s  %s  %s  %s  %s %s \r\n','hs','hsa','hsb','tm','tma','tmb','tp','ws');
% fprintf(fid3,'%f  %f  %f  %f  %f  %f  %f %f\r\n',SI_hs,SI_hsa,SI_hsb,SI_tm,SI,SI_tmb,SI_tp,SI_ws);

