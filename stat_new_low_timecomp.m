close all;
clear all;
clc;
buoy_name='BD14';
for r=1:3
if (r==1); p='hs';
elseif (r==2);p='ws';
else p='tp';
end
fid3=fopen(strcat('statistics_0-120hr_',p,'_',buoy_name,'_plot.txt'),'w');
fprintf(fid3,'%2s \t %6s \t %6s \t %6s \t %6s \t %6s \t %6s \t %6s \t %6s\r\n','Hr','bias_d','bias_n','rmse_d','rmse_n','corr_d','corr_n','SI_d','SI_n');
for i=0:6:120
    fname=strcat('colloc_da_noda_',num2str(i),'hr',buoy_name,'.txt');
    disp(fname)
    [d1,h1,bhs1,dhs1,ndhs1,bws1,dws1,ndws1,btm1,dtm1,ndtm1,btp1,dtp1,ndtp1,bmdir1,dmdir1,nmdir1]=textread(fname,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    data=[bhs1,dhs1,ndhs1,bws1,dws1,ndws1,btp1,dtp1,ndtp1];
    data=data(~any(isnan(data),2),:);
if (r==1);data1=data(:,1:3);
elseif (r==2);data1=data(:,4:6);
else data1=data(:,7:9);
end
% fprintf('calculating bias.....\n')
% bias_d=mean(data1(:,2)-data1(:,1));
% bias_n=mean(data1(:,3)-data1(:,1));
% fprintf('calculating rmse.....\n')
% rmse_d=sqrt(mean((data1(:,2)-data1(:,1)).^2));
% rmse_n=sqrt(mean((data1(:,3)-data1(:,1)).^2));
% fprintf('calculating correlation.....\n')
% corr_d=1/(length(data1)-1)*sum((data1(:,2)-mean(data1(:,2))).*(data1(:,1)-mean(data1(:,1)))/(std(data1(:,1))*std(data1(:,2))));
% corr_n=1/(length(data1)-1)*sum((data1(:,3)-mean(data1(:,3))).*(data1(:,1)-mean(data1(:,1)))/(std(data1(:,1))*std(data1(:,3))));
% fprintf('calculating SI.....\n')
% SI_d=(1/mean(data1(:,1))*sqrt(mean(((data1(:,2)-mean(data1(:,2)))-(data1(:,1)-mean(data1(:,1)))).^2)));
% SI_n=(1/mean(data1(:,1))*sqrt(mean(((data1(:,3)-mean(data1(:,3)))-(data1(:,1)-mean(data1(:,1)))).^2)));
% fprintf(fid3,'%d  %f  %f  %f  %f  %f  %f  %f  %f\r\n',i,bias_d,bias_n,rmse_d,rmse_n,corr_d,corr_n,SI_d,SI_n);
end
end