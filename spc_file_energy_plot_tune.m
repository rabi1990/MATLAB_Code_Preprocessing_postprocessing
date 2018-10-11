close all;
clear
clc;
fid1=fopen('TUTI_1d_spectra.spc','r');
%[x y]=textread('frequency_direction_data.txt','%f %f');
 S1= textscan(fid1,'%s','Delimiter','\n') ;
 S1=S1{1};
SM1 = [] ;
    count = 0 ;
    fclose(fid1);
%      date1(1:length(1:40:S1(end)),:)=S1{1:40:S1(end)};
    % Run a loop for every line to get the needed matrix
    for i = 1:length(S1) 
        temp1 = str2num(S1{i}) ;
        if length(temp1) == 6
            count = count+1 ;
            SM1(count,:) = temp1 ;
        end 
    end
 for i=1:round(length(SM1)/(29));
       E_mod(:,i)=[SM1(29*(i-1)+1:29*i,3)];
 end   
   p=[248,480,728,968,1216,1456,1704,1952,2192,2440,2680,2927] ;  
   l=[1,249,481,729,969,1217,1457,1705,1953,2193,2441,2681];
 f_mod=SM1(1:29,1);
  mon=['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'];
  i=10
 for j=l(i):p(i)     
     E_Mod(:,j)=E_mod(:,j);
 end
 E_Mod(:,E_Mod(29, :) == 0) = [];
 save(strcat('Tuticorin_mod_',mon(i,:),'_data.mat'),'E_Mod','f_mod');
  
