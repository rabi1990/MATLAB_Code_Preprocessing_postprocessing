close all;
clear all;
clc;
files=dir('*.spt');% Take all the spt files
count=0;
 t=1:1488;
for i= 1:length(files)
    fid=fopen(files(i,:).name); % Read the file name 
    H=fscanf(fid,'%13f',6); % 6th row contain energy multiplicant for actual energy
    fnm_Apr{i}=files(i,:).name;% file name will be saved
    [f(:,i) sf(:,i) d(:,i) p(:,i) q(:,i) r(:,i) ] = textread(files(i).name,'','delimiter',',','headerlines',12);% take first 12 lines as header
    for j=1:64          
    if(sf(j,i)==1)
        E(j,i)=sf(j,i);
else
    E(j,i)=H(4)*sf(j,i);
    end
    end    
end
E_Apr_Digha=E;
fnm_Apr=fnm_Apr';
fnm_Apr=cell2mat(fnm_Apr);
save('Apr_Digha.mat','E_Apr_Digha','fnm_Apr')
% for i=1:64
%   for j=1:1488
%       E_new(i,j)=E(i,j);
%     %  sf_new(i,j)=sf(i,j);
%   end
% end
% for i=1:length(files)
%     A=files(i).name;
% end
% for i=1:length(files)
%     A(i,:)=files(i).name;
% end
% contourf(t,f(:,1),E_new)
% set(gca,'XTick',[1:48:1488])
% % 
% % set(gca,'XTickLabel',A(1:48:1488,6:13),'XTickLabelRotation',45)
% % %set(ax(1),'YTick',[0.0400 0.0500    0.1000    0.1500    0.2000    0.2500    0.3000    0.3500    0.4000])
% %  XTickLabelRotation=45
% % xlabel('Time')
% % ylabel('Frequency')
% % colorbar 
% caxis([0.025 1])
