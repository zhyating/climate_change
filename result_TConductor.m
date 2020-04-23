%temperature_of_conductor
%q_cn_method
%q_c1_method
%q_c2_method

clear
clc

lon = 31;
lat = 16;
num = [31, 30, 31, 31, 26];
Tc = null(149,30);
y = 2010;

for year = y+1:y+5
    n = 1;
    for i = 5:9
        for k = 1:num(i-4)          
            if k > 9
                    filename00 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','00_00_00.nc'];
                    filename03 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','03_00_00.nc'];
                    filename12 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','12_00_00.nc'];                  
                    filename15 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                    filename00 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','00_00_00.nc'];
                    filename03 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','03_00_00.nc'];
                    filename12 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','12_00_00.nc'];
                    filename15 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end
                                   
            N = 151 + n;
                        
            if exist(filename00,'file') == 0
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                temp = ncread(filename00,'T2');
                T = temp(lon, lat ,1) - 273.15;
                %wind_x = ncread(filename00,'U');
                wind_y = ncread(filename00,'V');
                V = abs(wind_y(lon, lat ,1));
            end
            Hour = 0;
            Tc(n,1+(year-y-1)*6) = real(temperature_of_conductor(V, T, N, Hour));


            if exist(filename03,'file') == 0
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                temp = ncread(filename03,'T2');
                T = temp(lon,lat,1) - 273.15;
                %wind_x = ncread(filename03,'U');
                wind_y = ncread(filename03,'V');
                V = abs(wind_y(lon, lat ,1));               
            end
            Hour = 3;
            Tc(n,2+(year-y-1)*6) = real(temperature_of_conductor(V, T, N, Hour));


            if exist(filename12,'file') == 0
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                temp = ncread(filename12,'T2');
                T = temp(lon,lat,1) - 273.15;
                %wind_x = ncread(filename12,'U');
                wind_y = ncread(filename12,'V');
                V = abs(wind_y(lon, lat ,1));               
            end
            Hour = 12;
            Tc(n,3+(year-y-1)*6) = real(temperature_of_conductor(V, T, N, Hour));

            if exist(filename15,'file') == 0
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                temp = ncread(filename15,'T2');
                T = temp(lon, lat ,1) - 273.15;
                %wind_x = ncread(filename15,'U');
                wind_y = ncread(filename15,'V');
                V = abs(wind_y(lon, lat ,1));
            end
            Hour = 15;
            Tc(n,4+(year-y-1)*6) = real(temperature_of_conductor(V, T, N, Hour));


            if exist(filename18,'file') == 0
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                temp = ncread(filename18,'T2');
                T = temp(lon,lat,1) - 273.15;
                %wind_x = ncread(filename18,'U');
                wind_y = ncread(filename18,'V');
                V = abs(wind_y(lon, lat ,1));               
            end
            Hour = 18;
            Tc(n,5+(year-y-1)*6) = real(temperature_of_conductor(V, T, N, Hour));


            if exist(filename21,'file') == 0
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                temp = ncread(filename21,'T2');
                T = temp(lon,lat,1) - 273.15;
                %wind_x = ncread(filename21,'U');
                wind_y = ncread(filename21,'V');
                V = abs(wind_y(lon, lat ,1));               
            end
            Hour = 21;
            Tc(n,6+(year-y-1)*6) = real(temperature_of_conductor(V, T, N, Hour));
                                 
            n = n + 1;
        end
    end
end
