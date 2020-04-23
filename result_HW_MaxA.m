 clear
clc

file1 = 'H:/Output files/2011-2015-d3/wrfout_d03_2011-07-13_21_00_00.nc';
file2 = 'H:/Output files/2011-2015-d3/wrfout_d03_2012-07-03_21_00_00.nc';
file3 = 'H:/Output files/2011-2015-d3/wrfout_d03_2013-07-21_21_00_00.nc';
file4 = 'H:/Output files/2011-2015-d3/wrfout_d03_2014-06-19_21_00_00.nc';
file5 = 'H:/Output files/2011-2015-d3/wrfout_d03_2015-07-13_21_00_00.nc';

% file1 = 'H:/Output files/2011-2015-d4/wrfout_d04_2011-07-13_21_00_00.nc';
% file2 = 'H:/Output files/2011-2015-d4/wrfout_d04_2012-07-03_21_00_00.nc';
% file3 = 'H:/Output files/2011-2015-d4/wrfout_d04_2013-07-21_21_00_00.nc';
% file4 = 'H:/Output files/2011-2015-d4/wrfout_d04_2014-06-19_21_00_00.nc';
% file5 = 'H:/Output files/2011-2015-d4/wrfout_d04_2015-07-13_21_00_00.nc';



% file1 = 'H:/Output files/2031-2035-d3/wrfout_d03_2034-07-21_18_00_00.nc';
% file2 = 'H:/Output files/2031-2035-d3/wrfout_d03_2035-07-17_21_00_00.nc';
% file3 = 'H:/Output files/2036-2040-d3/wrfout_d03_2036-07-18_21_00_00.nc';
% file4 = 'H:/Output files/2036-2040-d3/wrfout_d03_2038-08-09_21_00_00.nc';
% file5 = 'H:/Output files/2036-2040-d3/wrfout_d03_2040-07-31_21_00_00.nc';

% file1 = 'H:/Output files/2031-2035-d4/wrfout_d04_2034-07-21_18_00_00.nc';
% file2 = 'H:/Output files/2031-2035-d4/wrfout_d04_2035-07-17_21_00_00.nc';
% file3 = 'H:/Output files/2036-2040-d4/wrfout_d04_2036-07-18_21_00_00.nc';
% file4 = 'H:/Output files/2036-2040-d4/wrfout_d04_2038-08-09_21_00_00.nc';
% file5 = 'H:/Output files/2036-2040-d4/wrfout_d04_2040-07-31_21_00_00.nc';


% 
% file1 = 'H:/Output files/2066-2070-d3/wrfout_d03_2066-07-26_21_00_00.nc';
% file2 = 'H:/Output files/2066-2070-d3/wrfout_d03_2067-08-01_21_00_00.nc';
% file3 = 'H:/Output files/2066-2070-d3/wrfout_d03_2068-08-14_21_00_00.nc';
% file4 = 'H:/Output files/2066-2070-d3/wrfout_d03_2069-07-19_21_00_00.nc';
% file5 = 'H:/Output files/2066-2070-d3/wrfout_d03_2070-07-11_21_00_00.nc';

% file1 = 'H:/Output files/2066-2070-d4/wrfout_d04_2066-07-26_21_00_00.nc';
% file2 = 'H:/Output files/2066-2070-d4/wrfout_d04_2067-08-01_21_00_00.nc';
% file3 = 'H:/Output files/2066-2070-d4/wrfout_d04_2068-08-14_21_00_00.nc';
% file4 = 'H:/Output files/2066-2070-d4/wrfout_d04_2069-07-19_21_00_00.nc';
% file5 = 'H:/Output files/2066-2070-d4/wrfout_d04_2070-07-11_21_00_00.nc';



% file1 = 'H:/Output files/2096-2100-d3/wrfout_d03_2096-08-01_21_00_00.nc';
% file2 = 'H:/Output files/2096-2100-d3/wrfout_d03_2097-08-01_21_00_00.nc';
% file3 = 'H:/Output files/2096-2100-d3/wrfout_d03_2098-08-06_21_00_00.nc';
% file4 = 'H:/Output files/2096-2100-d3/wrfout_d03_2099-07-23_21_00_00.nc';
% file5 = 'H:/Output files/2096-2100-d3/wrfout_d03_2100-06-29_21_00_00.nc';

% file1 = 'H:/Output files/2096-2100-d4/wrfout_d04_2096-08-01_21_00_00.nc';
% file2 = 'H:/Output files/2096-2100-d4/wrfout_d04_2097-08-01_21_00_00.nc';
% file3 = 'H:/Output files/2096-2100-d4/wrfout_d04_2098-08-06_21_00_00.nc';
% file4 = 'H:/Output files/2096-2100-d4/wrfout_d04_2099-07-23_21_00_00.nc';
% file5 = 'H:/Output files/2096-2100-d4/wrfout_d04_2100-06-29_21_00_00.nc';


A1 = ncread(file1,'T2');
A1 = A1 -273.15;
A2 = ncread(file2,'T2');
A2 = A2 - 273.15;
A3 = ncread(file3,'T2');
A3 = A3 - 273.15;
A4 = ncread(file4,'T2');
A4 = A4 - 273.15;
A5 = ncread(file5,'T2');
A5 = A5 - 273.15;

% B = A1(31,16);
% C = A2(31,16);
% D = A3(31,16);
% E = A4(31,16);
% F = A5(31,16);

A = (A1 + A2 + A3 + A4 + A5)/5;

