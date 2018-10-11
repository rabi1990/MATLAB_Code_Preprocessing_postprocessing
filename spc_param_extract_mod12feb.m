clear all;
clc;
close all;
f_name1='GOPAL_1d_spectra.spc';
f_name2='GOPAL_param_extrctd_model.txt' ;
fid1=fopen(f_name1,'r');
fid2=fopen(f_name1,'r');
fid3=fopen(f_name2,'w');
S=textscan(fid1,'%s','delimiter','\n');
S = S{1} ;
% loop 
data = cell(2906,1) ;
pos = 0:44:length(S) ;
% First set
junk = cell(1) ;
for i = 1:44
    junk{i} = S{i} ;
end
data{1} = junk ;
for i = 2:length(pos)
    junk = cell(1) ;
    for j = 1:44
        junk{j} = S{pos(i)+j} ;  
    end
    data{i} = junk ;
end