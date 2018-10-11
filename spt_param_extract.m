% To read a .spt file and plot the data
% Assuming that frequencies in the spt files are in ascending order
% Sequence used for reading and plotting required parameters
% from spt files
% 1.sptreadnplot 2.Remove excess data if more than 3 in an hr
% 3.sptreadnplot1 4.GenerateDates 5. PltHsmssng  6.Remove wrong data from
% both mod as well as original 7.PltTzmssng

clc ; clear all
fnames = dir('*.spt') ;
numfile = numel(fnames);
fidw = fopen('KOZIKODE_2014.txt','w') ;% Change the name of the file for each run
fprintf(fidw,'filename                Hs         HS-Wind Sea     HS-Swell       TM       TMA    TMB        TP      MDIR   MDIR-swell   MDir-sea\n') ;

for I = 1:numfile
    filename = fnames(I).name; 
    disp(filename)
    fid = fopen(filename,'r') ;
    if fid < 0
        error('no file found to open')
    end
% Text scan the file 
    S = textscan(fid,'%s','Delimiter','\n') ;
    S = S{1} ;
    SM = [] ;
    count = 0 ;
    Emax = str2num(S{4});
% Run a loop for every line to get the needed matrix
    for i = 1:length(S) 
        temp = str2num(S{i}) ;
        if length(temp) == 6
            count = count+1 ;
            SM(count,:) = temp ;
        end 
    end

    f = SM(:,1);
    Enor = SM(:,2);
    Dir = SM(:,3);
    Eact = Emax*Enor;
    %plot(f,Eact) % If plotting is required
% Overall area of the graph
    A = trapz(f,Eact);
% Area upto 0.125 Hz frequency
    [i j] = find(f<=0.125) ;
    f1 = f(i) ;
    Eact1 = Eact(i) ;
    A1 = trapz(f1,Eact1) ;
%Area of graph beyond 0.125 Hz frequency
    f2 = f((i(end)):end) ;
    Eact2 = Eact((i(end)):end) ;
    A2 = trapz(f2,Eact2);
% Calculating Hs, Swell, Sea
    HS= 4*sqrt(A);
    HSA = 4*sqrt(A1);
    HSB = 4*sqrt(A2);
% Mean wave direction   
   MDIR = mean2(Dir);
% Mean swell direction
    DIRA = Dir(i); 
    MDIRA = mean2(DIRA);
% Mean sea direction
    DIRB = Dir((i(end)):end);
    MDIRB = mean2(DIRB);
% Calculating Tp
    % Calculation for TM
            m0 = trapz(f,Eact);
        % Calculating second moment of Eact
            Q = (f.^2).*Eact;
            m2 = trapz(f,Q);
            TM = sqrt(m0/m2);
            
    % Calculation for TMB
            m0_sea = trapz(f2,Eact2);
            % Calculating second moment of Eact
            Q_sea = (f2.^2).*Eact2;
            m2_sea = trapz(f2,Q_sea);
            TMB = sqrt(m0_sea/m2_sea);
            
    % Calculation for Tz_swell
            m0_swell = trapz(f1,Eact1);
        % Calculating second moment of Eact
            Q_swell = (f1.^2).*Eact1;
            m2_swell = trapz(f1,Q_swell);
            TMA = sqrt(m0_swell/m2_swell);
            
% Calculating peak wave period (TP)
   [i j] = max(Eact);
   fmax = f(j);
   TP = 1/fmax;

   % Removing the extension .spt in the filename
   [pathstr,name,ext] = fileparts(filename)
   if (HS>=0.1)
     fprintf(fidw,'%s    %8.4f    %8.4f    %8.4f   %8.4f    %8.4f    %8.4f    %8.4f   %8.4f    %8.4f    %8.4f \n',name,HS,HSB,HSA,TM,TMA,TMB,TP,MDIR,MDIRA,MDIRB) ;
   end
   fclose(fid) ;
end
fclose(fidw) ;
