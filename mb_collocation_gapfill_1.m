close all;
clear all;
clc;
buoy_name=['AD06';'AD07';'AD09';'BD08';'BD11';'BD14'];
for s=1:1%length(buoy_name)
    for t=0:6:18
f_name1=strcat('extract_',num2str(t),'hr',buoy_name(s,:),'.txt');
f_name2=strcat('da_',num2str(t),'hr',buoy_name(s,:),'.dat');
f_name3=strcat('noda_',num2str(t),'hr',buoy_name(s,:),'.dat');
f_name4=strcat('colloc_da_noda_',num2str(t),'hr',buoy_name(s,:),'.txt');
fid4=fopen(f_name4,'w');
[d1 h1 hs1 mdir1 tm1 tp1]=textread(f_name1,'%s %s %f %f %f %f');
[d2 h2 hs2 tm2 tp2 mdir2]=textread(f_name2,'%s %s %f %f %f %f');
[d3 h3 hs3 tm3 tp3 mdir3]=textread(f_name3,'%s %s %f %f %f %f');
 fprintf(fid4,'%10s   %2s \t %s \t %s \t %s %s \t%s %s \t%s \t%s \t %s %s %s %s\n','DATE','HR','HS_bo','HS_da','HS_noda', ...
 'TP_bo','TP_da','TP_noda','TM_bo','TM_da','TM_noda','MDIR_bo','MDIR_da','MDIR_noda');
  d1=datestr(d1,'dd-mmm-yyyy');
  d1=strcat(d1(:,1:2),'-',upper(d1(:,4:6)),'-',d1(:,8:11))
  d2=cell2mat(d2);
   h22=cell2mat(h2);
 hs12=nan(length(d2),1);tm12=nan(length(d2),1);tp12=nan(length(d2),1);mdir12=nan(length(d2),1);
  c=1;
  p=zeros(length(d1),1);q=zeros(length(d2),1);
    for i = 1:length(d2)  % Loop index for first file 
      for j=1:length(d1)
            if (strcmp((d2(i,:)),(d1(j,:)))==1)
                p(c)=j; q(c)=i;
            c=c+1;
            end
      end
      disp(i)
    end
   p1=1:length(d2);
   p=nonzeros(p);q=nonzeros(q);
   x=ismember(p1,p);
   y=ismember(p1,q);
   hs11=hs2;tm11=tm2;tp11=tp2;mdir11=mdir2;
   hs13=hs3;tm13=tm3;tp13=tp3;mdir13=mdir3;
   hs12(q)=hs1(p);tm12(q)=tm1(p);tp12(q)=tp1(p);mdir12(q)=mdir1(p);

  for i = 1:length(hs11)  % Loop index for first file        
      fprintf(fid4,'%s  %s \t %5.2f \t %5.2f \t %5.2f \t %5.2f \t%5.2f \t %5.2f \t %5.2f \t %5.2f \t %5.2f \t %5.2f \t %5.2f \t %5.2f \n',...
       d2(i,:),h22(i,:),hs12(i),hs11(i),hs13(i),tm12(i),tm11(i),tm13(i),tp12(i),tp11(i),tp13(i),mdir12(i),mdir11(i),mdir13(i));           
   disp(i) 
  end      
    end
end