clear
clc

pq0 = 379.9056;
a2 = 17.2693882;
a3 = 273.16;
a4 = 35.86;
RH = null(63,54);

%filename = F:\Output_scenarios\2040\ref\wrfout_d03_2040-07-31_19_00_00.nc;
%filename = F:\Output_scenarios\2040\arw\wrfout_d03_2040-07-31_19_00_00.nc;
%filename = F:\Output_scenarios\2040\ap1\wrfout_d03_2040-07-31_19_00_00.nc;
%filename = F:\Output_scenarios\2040\ap2\wrfout_d03_2040-07-31_19_00_00.nc;
%filename = F:\Output_scenarios\2040\gr1\wrfout_d03_2040-07-31_19_00_00.nc;
%filename = F:\Output_scenarios\2040\gr2\wrfout_d03_2040-07-31_19_00_00.nc;

%filename = F:\Output_scenarios\2070\ref\wrfout_d03_2067-08-01_20_00_00.nc;
%filename = F:\Output_scenarios\2070\arw\wrfout_d03_2067-08-01_20_00_00.nc;
%filename = F:\Output_scenarios\2070\ap1\wrfout_d03_2067-08-01_20_00_00.nc;
%filename = F:\Output_scenarios\2070\ap2\wrfout_d03_2067-08-01_20_00_00.nc;
%filename = F:\Output_scenarios\2070\gr1\wrfout_d03_2067-08-01_20_00_00.nc;
%filename = F:\Output_scenarios\2070\gr2\wrfout_d03_2067-08-01_20_00_00.nc;

%filename = 'F:\Output_scenarios\2100\ref\wrfout_d03_2099-07-23_20_00_00.nc';
%filename = 'F:\Output_scenarios\2100\arw\wrfout_d03_2099-07-23_20_00_00.nc';
%filename = 'F:\Output_scenarios\2100\ap1\wrfout_d03_2099-07-23_20_00_00.nc';
%filename = 'F:\Output_scenarios\2100\ap2\wrfout_d03_2099-07-23_20_00_00.nc';
%filename = 'F:\Output_scenarios\2100\gr1\wrfout_d03_2099-07-23_20_00_00.nc';
filename = 'F:\Output_scenarios\2100\gr2\wrfout_d03_2099-07-23_20_00_00.nc';

for lon  = 1:63
    for lat = 1:54

        temp = ncread(filename,'T2');
        T = temp(lon,lat,1);
        vapor = ncread(filename,'Q2');
        Q = vapor(lon,lat,1);
        pressure = ncread(filename,'PSFC');
        psfc = pressure(lon,lat,1);
        RH(lon,lat) = Q / ((pq0 / psfc) * exp(a2 * (T - a3)/(T - a4)));
        
    end
end

