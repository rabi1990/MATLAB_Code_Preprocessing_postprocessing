% Rounding of the minutes to nearby zero values, only valid for three hour
% interval (.his)
% 1.dates 2.
clear all;clc;

k = importdata('2014-02.his',',')
fidw = fopen('his_mod.txt','wt')
fprintf(fidw,'date Tp PkDir PkDspr Tz Hs TI T1 Tc Tdw2 Tdw1 Tpc nu eps QP Ss Tref Tsea Bat \n')
for i = 1:length(k.textdata)
    temp = k.textdata(i,1);
    temp=temp{1,1};
    min = str2num(temp(15:16));
    
    if min < 30
        min_n = '00' ;
            temp1 = strcat(temp(1:14),min_n,temp(17:end)) ;
    else
            min_n = '30' ;
            temp1 = strcat(temp(1:14),min_n,temp(17:end)) ;
    end
    
    fprintf(fidw,'%s %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %1f\n',temp1,k.data(i,1),k.data(i,2),k.data(i,3),k.data(i,4),k.data(i,5),k.data(i,6),k.data(i,7),k.data(i,8),k.data(i,9),k.data(i,10),k.data(i,11),k.data(i,12),k.data(i,13),k.data(i,14),k.data(i,15),k.data(i,16),k.data(i,17),k.data(i,18));
end
fclose(fidw)