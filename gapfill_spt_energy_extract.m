% To read a .spt file and plot the data
% Assuming that frequencies in the spt files are in ascending order
clc ; close all;
clear;
%Create date and the spectral file names
st=datenum(2016,07,1,0,0,0);
en=datenum(2016,07,31,23,30,0);
d1=datestr(st:minutes(30):en,'yyyy-mm-dd HH:MM');
%f1='Gopalpur}';
%s1={'00','03','06','09','12','15','18','21'};
c=0;
 for i=1:length(d1)
     c=c+1;
     f_new(c,:)=strcat(d1(i,1:10),'T',d1(i,12:13),'h',d1(i,15:16),'.spt');
 end
 fnames = dir('*.spt') ;
 numfile = numel(fnames);
 
 % fidw = fopen('KOZIKODE_2014.txt','w') ;% Change the name of the file for each run
% % fprintf(fidw,'filename                Hs         HS-Wind Sea     HS-Swell       TM       TMA    TMB        TP      MDIR   MDIR-swell   MDir-sea\n') ;
 E=nan(64,length(f_new));
 dir=nan(64,length(f_new));
 Emax1=nan(1,length(f_new));
 for i=1:length(f_new) 
    for j = 1:numfile
        filename = fnames(j).name; 
        if str2num(filename(15:16))<30
             f = strcat(filename(1:14),'00.spt');
        else
            f=strcat(filename(1:14),'30.spt');
        end
    
 
        if (strcmp(f_new(i,:),f))
            fid=fopen(filename,'r');       
   %         if fid < 0
   %             error('no file found to open')
   %         end
%            % % Text scan the file
            S = textscan(fid,'%s','Delimiter','\n') ; 
            S = S{1} ;
            Emax = str2double(S{4});
            SM = [] ;count = 0 ;
            % Run a loop for every line to get the needed matrix
            for p = 1:length(S) 
                 temp = str2num(S{p}) ;
                   if length(temp) == 6
                     count = count+1 ;
                      SM(count,:) = temp ;        
                   end
            end
%            
         E(:,i)=SM(:,2);
        Eact(:,i)=E(:,i)*Emax;
        fre=SM(:,1);
        dir(:,i)=SM(:,3);
       Emax1(1,i)=Emax;
        end
    end
    disp(i)   
 end
 save('Kozhikode_gapfilled_Jul_data.mat','E','Eact','fre','dir','f_new');
