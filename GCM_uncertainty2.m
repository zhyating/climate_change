% clear
% clc

T = null(153*5);
% filename = 'E:/Download/BC_1deg_tasmax_day_MPI-ESM-MR_rcp85_r1i1p1_20900101-21001231.nc';
filename = 'E:/Download/BC_1deg_tasmax_day_MPI-ESM-LR_rcp85_r1i1p1_20900101-21001231.nc';

Temp = ncread(filename,'tasmax');

for i = 1 : 153
    T(i) = Temp(50,15,2311+i);  %2312:2465
end

for i = 154 : 306
    T(i) = Temp(50,15,2523+i);  %2677:2830
end

for i = 307 : 459
    T(i) = Temp(50,15,2735+i);  %3042:3195
end

for i = 460 : 612
    T(i) = Temp(50,15,2947+i);  %3407:3560
end

for i = 613 : 765
    T(i) = Temp(50,15,3159+i);  %3772:3925
end

T = T';

ksdensity(T);
hold on
