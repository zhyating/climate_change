clear
clc

num = [31,30,31,31,28];
y = 2011;
Tmax = null(755);
Tmin = null(755);
Temperature = null(4); 
lon = 45; % 33 24 1 45
lat = 13; % 17 19 19 13
n = 1;

% file ='H:/Output files/2011-2015-d4/wrfout_d04_2066-05-05_06_00_00.nc';
% longitude = ncread(file,'XLONG');
% latitude = ncread(file,'XLAT');
% long = longitude(lon,lat);
% lati = latitude(lon,lat);

for year = y: y+4
    for i = 5:9          
        for k = 1:num(i-4)                 
            if k > 9
                filename06 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','06_00_00.nc'];
                filename09 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','09_00_00.nc'];
                filename18 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename06 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','06_00_00.nc'];
                filename09 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','09_00_00.nc'];
                filename18 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['H:/Output files/2011-2015-d4/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end
            
            
            if exist(filename06,'file') == 0
                T06 = -99;
            else
                temp06 = ncread(filename06,'T2');
                T06 = temp06(lon,lat,1)-273.15;
            end
            Temperature(1) = T06;
            
            
            if exist(filename09,'file') == 0
                T09 = -99;
            else
                temp09 = ncread(filename09,'T2');
                T09 = temp09(lon,lat,1)-273.15;
            end
            Temperature(2) = T09;


            if exist(filename18,'file') == 0
                T18 = -99;
            else
                temp18 = ncread(filename18,'T2');
                T18 = temp18(lon,lat,1)-273.15;
            end
            Temperature(3) = T18;


            if exist(filename21,'file') == 0
                T21 = -99;
            else
                temp21 = ncread(filename21,'T2');
                T21 = temp21(lon,lat,1)-273.15;
            end               
            Temperature(4) = T21;


            Tmx = max(Temperature);
            Tmn = min(Temperature);
            
            
            Tmax(n) = Tmx;
            Tmin(n) = Tmn;
            n = n + 1;
 

        end
    end

end


% hold off
% ksdensity(W)
% hold on
% ksdensity(obs1)
% xlabel('Temperature (^{\circ}C)')
% ylabel('Density')
% legend('WRF','Observation')
% title('2011-2015')