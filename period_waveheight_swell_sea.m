%function period_waveheight_swell_sea(buoy_name)
%filename='AD06_hs_ws_colc2014.txt';
%clear all;
%close all;
buoy_name='SW03';
f_name1=[buoy_name,'_hs_ws_topo1.txt'];
%f_name2=[buoy_name,'_periods_colc2014.txt'];
fid1 = fopen(f_name1,'r');
%fid2 = fopen(f_name2,'r');
if fid1 < 0
    error('Please check trhe filename')
end
%if fid2 < 0
%    error('Please check trhe filename')
%end
%
S1 = textscan(fid1,'%s','Delimiter',',');
%S2 = textscan(fid2,'%s','Delimiter',',');
S1 = S1{1} ;
%S2 =S2{1};
% 
fclose(fid1) ;
%fclose(fid2);
% close the text fie
%
spaces = find(isspace(S1{1})) ;
%%%%%

%%%%%
data1 = zeros(length(S1{1}),8) ;
%data2 = zeros(length(S2{1}),4) ;
for i = 1:length(S1)
    l1 = S1{i} ;
    %l2 = S2{i};
%    ss(i)=str2num(l1(9:10));
    data1(i,:) = [str2num(l1(19:23)),str2num(l1(29:33)),str2num(l1(39:43)),str2num(l1(49:53)),str2num(l1(59:63)),str2num(l1(69:73)),str2num(l1( 79:83)),str2num(l1(89:93))];
    %data2(i,:) = [str2num(l2(20:23)),str2num(l2(30:33)),str2num(l2(39:43)),str2num(l2(49:53))];
end
% subplot(4,1,1)
% plot(1:length(S1),data1(:,3),'k.','MarkerSize',12)
% hold on
% plot(1:length(S1),data1(:,4),'r.','MarkerSize',12)
% legend('buoy-ws','ww3-ws')
% %legend('buoy-tm0','ww3-tm0')
% %title([filename(1:4),'-HS-comparison'])
% title([f_name1(1:4),'-WS-comparison'])
% %xlabel('Year(2014-3hrly)')
% ylabel('Wind Speed')
% subplot(4,1,2)
% plot(data1(:,1),'k.','MarkerSize',12)
% hold on
% plot(data1(:,2),'r.','MarkerSize',12)
% legend('buoy-hs','ww3-hs')
% %legend('buoy-tm0','ww3-tm0')
% title([f_name1(1:4),'-HS-comparison'])
% %xlabel('Year(2014-3hrly)')
% ylabel('SWH')
% subplot(4,1,3)
% plot(1:length(S2),data2(:,1),'k.','MarkerSize',12)
% hold on
% plot(1:length(S2),data2(:,2),'r.','MarkerSize',12)
% legend('buoy-tm','ww3-tm')
% %legend('buoy-tm0','ww3-tm0')
% %title([filename(1:4),'-HS-comparison'])
% title([f_name1(1:4),'-TM-comparison'])
% %xlabel('Year(2014-3hrly)')
% ylabel('Mean Wave period')
% subplot(4,1,4)
% plot(1:length(S2),data2(:,3),'k.','MarkerSize',12)
% hold on
% plot(1:length(S2),data2(:,4),'r.','MarkerSize',12)
% legend('buoy-tp','ww3-tp')
% %legend('buoy-tm0','ww3-tm0')
% %title([filename(1:4),'-HS-comparison'])
% title([f_name1(1:4),'-TP-comparison'])
% %xlabel('Year(2014-3hrly)')
% ylabel('Peak Wave period')
% %ylabel('significant-wave height')
% %ylabel('Mean Wave periods')
% % ss1=ss(1:40:length(ss)); 
% % set(gca,'XTick',[1:40:length(ss)])
% % set(gca,'XTickLabel',ss1)
% %saveas(gcf,[filename(1:4),'SWH-compare.png'])
% saveas(gcf,[f_name1(1:4),'four_parameter-compare.png'])
% close all;
%end
