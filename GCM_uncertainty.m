% clear
% clc

T = null(153*5);
% filename = 'E:/Download/BC_1deg_tasmax_day_NorESM1-M_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_MRI-CGCM3_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_MIROC-ESM-CHEM_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_MIROC-ESM_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_IPSL-CM5A-LR_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_inmcm4_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_GFDL-ESM2M_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_GFDL-ESM2G_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_GFDL-CM3_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_CSIRO-Mk3-6-0_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_ACCESS1-0_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_CNRM-CM5_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_CanESM2_rcp85_r1i1p1_20960101-21001231.nc';
% filename = 'E:/Download/BC_1deg_tasmax_day_CCSM4_rcp85_r1i1p1_20960101-21001231.nc';
filename = 'E:/Download/BC_1deg_tasmax_day_CESM1-BGC_rcp85_r1i1p1_20960101-21001231.nc';

Temp = ncread(filename,'tasmax');

for i = 1 : 153
    T(i) = Temp(50,15,120+i);  %121:274
end

for i = 154 : 306
    T(i) = Temp(50,15,332+i);  %486:639
end

for i = 307 : 459
    T(i) = Temp(50,15,544+i);  %851:1004
end

for i = 460 : 612
    T(i) = Temp(50,15,756+i);  %1216:1369
end

for i = 613 : 765
    T(i) = Temp(50,15,969+i);  %1582:1735
end

T = T';

ksdensity(T);
hold on

xlabel('Temperature (^{\circ}C)');
ylabel('Probability');
legend('NorESM1-M','MRI-CGCM3','MIROC-ESM-CHEM','MIROC-ESM','IPSL-CM5A-LR','INMCM4','GFDL-ESM2M',...
    'GFDL-ESM2G','GFDL-CM3','CSIRO-Mk3-6-0','ACCESS1-0','CNRM-CM5','CanESM2','CCSM4','MPI-ESM-MR',...
    'MPI-ESM-LR','CESM1-BGC')
