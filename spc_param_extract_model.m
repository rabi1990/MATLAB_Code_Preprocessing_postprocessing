clear all;
clc;
close all;
f_name1='GOPAL_1d_spectra.spc';
f_name2='GOPAL_param_extrctd_model.txt'
fid1=fopen(f_name1,'r');
fid2=fopen(f_name1,'r');
fid3=fopen(f_name2,'w');
fprintf(fid3,'date                Hs         HS-Wind Sea     HS-Swell       TM       TMA    TMB        TP      MDIR   MDIR-swell   MDir-sea\n') ;
S=textscan(fid1,'%s','delimiter','\n');
S = S{1} ;
    SM = [] ;
    count = 0 ;
    x=1:44:length(S);
    date =cell2mat(S(x));
   %Run a loop for every line to get the needed matrix
    for i = 1:length(S) 
        temp = str2num(S{i}) ;
        if length(temp) == 6
            count = count+1 ;
            SM(count,:) = temp ;
        end 
    end
    f=SM(:,1);
    E=SM(:,3);
    dir=SM(:,4);
    data1 = zeros(32,3) ;
    for p=1:2%2905%floor(length(f)/32)
          for q =32*(p-1)+1:32*p
        data1(q,:)=[f(q) E(q) dir(q)];  
          end
          m0 = trapz(data1(:,1),data1(:,2));
        
        [i j] = find(data1(:,1)<=0.125) ;% Area upto 0.125 Hz frequency
            f_swell = data1(i,1) ;
            E_swell =data1(i,2);
          m0_swell=trapz(f_swell,E_swell);
       %Area of graph beyond 0.125 Hz frequency   
          f_sea = data1(((i(end)):end),1) ;
          E_sea = data1(((i(end)):end),2) ;
         m0_sea=trapz(f_sea,E_sea);
       % Calculating Hs, Swell, Sea
        HS= 4*sqrt(m0);
        HSA = 4*sqrt(m0_swell);
        HSB = 4*sqrt(m0_sea);
       % Mean wave direction   
        MDIR = mean2(data1(:,3)); 
       % Mean swell direction
       DIRA = data1(i,3); 
       MDIRA = mean2(DIRA);
       %  Mean sea direction
       DIRB = data1(((i(end)):end),3);
       MDIRB = mean2(DIRB);
    % Calculating Tp
     % Calculation for TM
     %Calculating second moment of Eact
             Q = (data1(:,1).^2).*data1(:,2);
             m2 = trapz(data1(:,1),Q);
             TM = sqrt(m0/m2);
     % Calculation for TMB
             % Calculating second moment of Eact
             Q_sea = (f_sea.^2).*E_sea;
             m2_sea = trapz(f_sea,Q_sea);
             TMB = sqrt(m0_sea/m2_sea);    % Calculation for Tz_swell
             m0_swell = trapz(f_swell,E_swell);
         % Calculating second moment of Eact
             Q_swell = (f_swell.^2).*E_swell;
             m2_swell = trapz(f_swell,Q_swell);
             TMA = sqrt(m0_swell/m2_swell)        
   % Calculating peak wave period (TP)
    [i j] = max(data1(:,2));
    fmax = f(j);
    TP = 1/fmax;    
             if (HS> 0.1)
        fprintf(fid3,'%s    %8.4f    %8.4f    %8.4f   %8.4f    %8.4f    %8.4f    %8.4f   %8.4f    %8.4f    %8.4f \n',date(p,12:24),HS,HSB,HSA,TM,TMA,TMB,TP,MDIR,MDIRA,MDIRB) ;
    end
    end
              
       
         
     %plot(f,Eact) % If plotting is required
% Overall area of the graph
   % A = trapz(f(q),Eact(q));
     
  
% % Area upto 0.125 Hz frequency
% [i j] = find(f(q)<=0.125) ;
%     f1 = f(i) ;
%     Eact1 = Eact(i) ;
%     A1 = trapz(f1,Eact1) ;
% %Area of graph beyond 0.125 Hz frequency
%     f2 = f((i(end)):end) ;
%     Eact2 = Eact((i(end)):end) ;
%     A2 = trapz(f2,Eact2);
% % Calculating Hs, Swell, Sea
%     HS= 4*sqrt(A);
%     HSA = 4*sqrt(A1);
%     HSB = 4*sqrt(A2);
%     % Mean wave direction   
%    MDIR = mean2(Dir);
% % Mean swell direction
%     DIRA = Dir(i); 
%     MDIRA = mean2(DIRA);
% % Mean sea direction
%     DIRB = Dir((i(end)):end);
%     MDIRB = mean2(DIRB);
% % Calculating Tp
%     % Calculation for TM
%             m0 = trapz(f,Eact);
%         % Calculating second moment of Eact
%             Q = (f.^2).*Eact;
%             m2 = trapz(f,Q);
%             TM = sqrt(m0/m2);
%             
%     % Calculation for TMB
%             m0_sea = trapz(f2,Eact2);
%             % Calculating second moment of Eact
%             Q_sea = (f2.^2).*Eact2;
%             m2_sea = trapz(f2,Q_sea);
%             TMB = sqrt(m0_sea/m2_sea);    % Calculation for Tz_swell
%             m0_swell = trapz(f1,Eact1);
%         % Calculating second moment of Eact
%             Q_swell = (f1.^2).*Eact1;
%             m2_swell = trapz(f1,Q_swell);
%             TMA = sqrt(m0_swell/m2_swell);
%             
% % Calculating peak wave period (TP)
%    [i j] = max(Eact);
%    fmax = f(j);
%    TP = 1/fmax;
% %    
% %   for i= 1:length(SM)
% %       for j=1:length(date)
% %           
% %    if (HS> 0.1)
% %        fprintf(fidw,'%s    %8.4f    %8.4f    %8.4f   %8.4f    %8.4f    %8.4f    %8.4f   %8.4f    %8.4f    %8.4f \n',name(10:22),HS,HSB,HSA,TM,TMA,TMB,TP,MDIR,MDIRA,MDIRB) ;
% %        Eact_f(:,count)=Eact;
% %    end
%             
%             