clear
clc

num = [30,31,31];
y = 2011;
Tmax = null(460);
Temperature = null(3); 
lon = 31;
lat = 16;
n = 1;

for year = y:y+4
    for i = 6:8          
        for k = 1:num(i-5)                 
            if k > 9
                filename15 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                filename18 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename15 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                filename18 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end


            if exist(filename15,'file') == 0
                T15 = -99;
            else
                temp15 = ncread(filename15,'T2');
                T15 = temp15(lon,lat,1)-273.15;
            end
            Temperature(1) = T15;


            if exist(filename18,'file') == 0
                T18 = -99;
            else
                temp18 = ncread(filename18,'T2');
                T18 = temp18(lon,lat,1)-273.15;
            end
            Temperature(2) = T18;


            if exist(filename21,'file') == 0
                T21 = -99;
            else
                temp21 = ncread(filename21,'T2');
                T21 = temp21(lon,lat,1)-273.15;
            end               
            Temperature(3) = T21;


            T = max(Temperature);
            if T < 20
                fprintf('%d-%d-%d dose not exit\n',year,i,k)
            else
                Tmax(n) = T;
                n = n + 1;
            end

        end
    end

end


% Mean = mean(Tmax);
% V = var(Tmax);
% S = skewness(Tmax);
% K = kurtosis(Tmax);
Max = max(Tmax);
% p95 = prctile(Tmax,95);
% histogram(Tmax, 20)
% xlabel('Temperature (^{\circ}C)')
% ylabel('Number of days')

    