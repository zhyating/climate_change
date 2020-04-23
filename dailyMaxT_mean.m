clear
clc

num = [31,30,31,31,26];
name1 = '2006-2010-d4';
name2 = '2011-2015-d4';
initial = 2005;
T = zeros(7,9);
d = 1;
day_max = null(920);
daily_Temp = null(61);

for year = 1:5 
    for i = 6:8            
        for k = 1:num(i-4)          
            if k > 9                   
                filename18 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename18 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end


            if exist(filename21,'file') == 0
                fprintf('%d-%d-%d-%d-%d dose not exit\n',lon,lat,year,i,k);
                continue;
            else
                temp = ncread(filename21,'T2');
                T = temp - 273.15;
            end               
            
            n = 1;           
            for lon = 1:7
                for lat = 1:9 
                     if (lon == 3 && lat == 1) ||  (lon == 3 && lat == 2)
                         continue;
                     else
                        daily_Temp(n) = T(lon,lat);
                        n = n + 1;
                     end
                end
            end
            
            max_value = mean(mean(daily_Temp));
            if max_value > 0
                day_max(d) = max_value;
                d = d + 1; 
            else
                fprintf('%d-%d-%d-%d-%d dose not exit\n',lon,lat,year,i,k);
            end
            
        end           
    end      
end

initial = initial + 5;

for year = 1:5 
    for i = 6:8            
        for k = 1:num(i-4)          
            if k > 9                   
                filename18 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename18 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end


            if exist(filename21,'file') == 0
                fprintf('%d-%d-%d-%d-%d dose not exit\n',lon,lat,year,i,k);
                continue;
            else
                temp = ncread(filename21,'T2');
                T = temp(27:33,12:20,1) - 273.15;
            end               

            n = 1;
            for lon = 1:7
                for lat = 1:9 
                     if (lon == 3 && lat == 1) ||  (lon == 3 && lat == 2)
                         continue;
                     else
                        daily_Temp(n) = T(lon,lat);
                        n = n + 1;
                     end
                end
            end
            
            max_value = mean(mean(daily_Temp));
            if max_value > 0
                day_max(d) = max_value;
                d = d + 1; 
            else
                fprintf('%d-%d-%d-%d-%d dose not exit\n',lon,lat,year,i,k);
            end
            
        end           
    end      
end

M = mean(day_max);
V = var(day_max);
S = skewness(day_max);
K = kurtosis(day_max);

