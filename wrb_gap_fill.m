% To read a .spt file and plot the data
% Assuming that frequencies in the spt files are in ascending order
clc ; close all;
clear;
%Create date and the spectral file names
st=datenum('2014-01-01');
en=datenum('2014-12-31');
d1=datestr(st:en,'yyyy-mm-dd');
f1='Gopalpur}';
s1={'00','03','06','09','12','15','18','21'};
c=0;
for i=1:length(d1)
for j=1:length(s1)
    c=c+1;
    f_new(c,:)=strcat(f1,d1(i,:),'T',s1{j},'h','00Z.spt');
end
end
fnames = dir('*.spt') ;
numfile = numel(fnames);

% fidw = fopen('KOZIKODE_2014.txt','w') ;% Change the name of the file for each run
% fprintf(fidw,'filename                Hs         HS-Wind Sea     HS-Swell       TM       TMA    TMB        TP      MDIR   MDIR-swell   MDir-sea\n') ;
E=nan(64,length(f_new));
dir=nan(64,length(f_new));
Emax1=nan(1,length(f_new));
for i=1:length(f_new) 
   for j = 1:numfile
       filename = fnames(j).name; 
       if str2num(filename(24:25))<30
           f = strcat(filename(1:23),'00Z.spt');
       else
           f=strcat(filename(1:23),'30Z.spt');
       end
       
       if (strcmp(f_new(i,:),f))
           fid=fopen(filename,'r');       
           if fid < 0
               error('no file found to open')
           end
           % % Text scan the file
           S = textscan(fid,'%s','Delimiter','\n') ;

           S = S{1} ;
%           SM = [] ;
%           count = 0 ;
           Emax = str2num(S{4});
           % Run a loop for every line to get the needed matrix
%            for p = 1:length(S) 
%                temp = str2num(S{p}) ;
%                if length(temp) == 6
%                    count = count+1 ;
%                    SM(count,:) = temp ;
%                    %        
%                end
%            end
           
%       E(:,i)=SM(:,2);
%       Eact(:,i)=E(:,i)*Emax;
%       fre=SM(:,1);
%       dir(:,i)=SM(:,3);
     Emax1(1,i)=Emax;
       end
       
   end
end
save('Gopalpur_gapfilled_data.mat','E','Eact','fre','dir');
