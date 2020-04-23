clear
clc
Tmax = null(24);
lat = 31;
lon = 16;
num = 1;
for i = 13:19
    for k = 0:23                 
        if k > 9
            filename = ['E:/2005 triple/wrfout_d04_2005-08-',num2str(i),'_',num2str(k),'_00_00.nc'];           
        else
            filename = ['E:/2005 triple/wrfout_d04_2005-08-',num2str(i),'_0',num2str(k),'_00_00.nc'];            
        end
        
        if exist(filename,'file') == 0
            Tmax(num) = -99;
        else
            temp = ncread(filename,'T2');
            Tmax(num) = temp(lon,lat,1) - 273.15;            
        end
        
        num = num + 1;                   
    end
   
end

