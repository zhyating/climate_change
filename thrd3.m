
%file1 = 'F:\Output_scenarios\my2040\ref\wrfout_d04_2040-07-31_19_00_00.nc';
file1 = 'F:\Output_scenarios\my2070\ref\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2100\ref\wrfout_d04_2099-07-23_20_00_00.nc';


old1 = ncread(file1,'T2');
old1 = old1 - 273.15;

ref = old1;
clear old1 file1;


%file1 = 'F:\Output_scenarios\my2040\arw\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040\ap1\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040\ap2\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040\gr1\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040\gr2\wrfout_d04_2040-07-31_19_00_00.nc';

%file1 = 'F:\Output_scenarios\my2070\arw\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2070\ap1\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2070\ap2\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2070\gr1\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2070\gr2\wrfout_d04_2067-08-01_20_00_00.nc';

%file1 = 'F:\Output_scenarios\my2100\arw\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2100\ap1\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2100\ap2\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2100\gr1\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2100\gr2\wrfout_d04_2099-07-23_20_00_00.nc';

%file1 = 'F:\Output_scenarios\my2040_arw45\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_arw75\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_arw90\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_ap60\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_ap75\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_ap90\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_gr25\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'F:\Output_scenarios\my2040_gr75\wrfout_d04_2040-07-31_19_00_00.nc';

%file1 = 'F:\Output_scenarios\my2067_arw45\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2067_arw75\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2067_arw90\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2067_ap60\wrfout_d04_2067-08-01_20_00_00.nc';
file1 = 'F:\Output_scenarios\my2067_ap75\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2067_ap90\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2067_gr25\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2067_gr75\wrfout_d04_2067-08-01_20_00_00.nc';

%file1 = 'F:\Output_scenarios\my2099_arw45\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_arw75\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_arw90\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_ap60\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_ap75\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_ap90\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_gr25\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'F:\Output_scenarios\my2099_gr75\wrfout_d04_2099-07-23_20_00_00.nc';

old1 = ncread(file1,'T2');
old1 = old1 - 273.15;

threshold = 31.7 - old1 + ref;