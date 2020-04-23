clear
clc

lat = 16;
lon = 31;
threshold = 31.7;
Tmax = null(149);
Temperature = zeros(3,149);
num = [31,30,31,31,26];
year = 2010;
Amplitude = null(5);
A = null(5);


for y = 1:5
    n = 1;
    Amplitude(y) = 0;
    for i = 5:9
        for k = 1:num(i-4)                 
            if k > 9
                filename15 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year+y),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                filename18 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year+y),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year+y),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename15 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year+y),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                filename18 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year+y),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['F:/Output files/2011-2015-d4/wrfout_d04_',num2str(year+y),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end
                
            if exist(filename15,'file') == 0
                T15 = -99;
            else
                temp15 = ncread(filename15,'T2');
                T15 = temp15(lon,lat,1)-273.15;
            end
            Temperature(1,n) = T15;


            if exist(filename18,'file') == 0
                T18 = -99;
            else
                temp18 = ncread(filename18,'T2');
                T18 = temp18(lon,lat,1)-273.15;
            end
            Temperature(2,n) = T18;


            if exist(filename21,'file') == 0
                T21 = -99;
            else
                temp21 = ncread(filename21,'T2');
                T21 = temp21(lon,lat,1)-273.15;
            end               
            Temperature(3,n) = T21;

            Tmax(n) = max(Temperature(:,n));
            if Tmax(n) == -99
                fprintf('%d-%d-%d dose not exit\n',year+y,i,k)
            end
            n = n + 1;
        end
    end
    
    j = 1;
    while j < 145
        if min(Tmax(j:j+5)) > threshold                                
                 
             while Tmax(j) > threshold && j < 149
                 if Tmax(j) > Amplitude(y)
                    Amplitude(y) = Tmax(j);
                    A(y) = j;
                 end
                 j = j + 1;
             end
             
        end
        j = j + 1;
    end
    
end   
                
