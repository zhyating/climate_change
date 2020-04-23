clear
clc

num = [30,31,31];
year = 2034;
Tmax1 = zeros(63,54,91);
temp15 = zeros(63,54);
temp18 = zeros(63,54);
temp21 = zeros(63,54);

n = 1;
for i = 6:8          
    for k = 1:num(i-5)                 
        if k > 9

            filename15 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
        else

            filename15 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
        end


        if exist(filename15,'file') ~= 0 && exist(filename18,'file') ~= 0 && exist(filename21,'file') ~= 0                
            temp15 = ncread(filename15,'T2');
            temp15 = temp15 - 273.15;
            temp18 = ncread(filename18,'T2');
            temp18 = temp18 - 273.15;
            temp21 = ncread(filename21,'T2');
            temp21 = temp21 - 273.15;              
            Tmax1(:,:,n) = max(temp15, temp18);
            Tmax1(:,:,n) = max(Tmax1(:,:,n), temp21);
        else
            fprintf('%d-%d-%d dose not exit\n',year,i,k)
        end
        n = n + 1;
    end
end                          


year = 2035;
Tmax2 = zeros(63,54,91);

n = 1;
for i = 6:8          
    for k = 1:num(i-5)                 
        if k > 9

            filename15 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
        else

            filename15 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2031-2035-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
        end


        if exist(filename15,'file') ~= 0 && exist(filename18,'file') ~= 0 && exist(filename21,'file') ~= 0                
            temp15 = ncread(filename15,'T2');
            temp15 = temp15 - 273.15;
            temp18 = ncread(filename18,'T2');
            temp18 = temp18 - 273.15;
            temp21 = ncread(filename21,'T2');
            temp21 = temp21 - 273.15;              
            Tmax2(:,:,n) = max(temp15, temp18);
            Tmax2(:,:,n) = max(Tmax2(:,:,n), temp21);
        else
            fprintf('%d-%d-%d dose not exit\n',year,i,k)
        end
        n = n + 1;
    end
end 

year = 2036;
Tmax3 = zeros(63,54,92);

n = 1;
for i = 6:8          
    for k = 1:num(i-5)                 
        if k > 9

            filename15 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
        else

            filename15 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
        end


        if exist(filename15,'file') ~= 0 && exist(filename18,'file') ~= 0 && exist(filename21,'file') ~= 0                
            temp15 = ncread(filename15,'T2');
            temp15 = temp15 - 273.15;
            temp18 = ncread(filename18,'T2');
            temp18 = temp18 - 273.15;
            temp21 = ncread(filename21,'T2');
            temp21 = temp21 - 273.15;              
            Tmax3(:,:,n) = max(temp15, temp18);
            Tmax3(:,:,n) = max(Tmax3(:,:,n), temp21);
        else
            fprintf('%d-%d-%d dose not exit\n',year,i,k)
        end
        n = n + 1;
    end
end 


year = 2038;
Tmax4 = zeros(63,54,91);

n = 1;
for i = 6:8          
    for k = 1:num(i-5)                 
        if k > 9

            filename15 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
        else

            filename15 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
        end


        if exist(filename15,'file') ~= 0 && exist(filename18,'file') ~= 0 && exist(filename21,'file') ~= 0                
            temp15 = ncread(filename15,'T2');
            temp15 = temp15 - 273.15;
            temp18 = ncread(filename18,'T2');
            temp18 = temp18 - 273.15;
            temp21 = ncread(filename21,'T2');
            temp21 = temp21 - 273.15;              
            Tmax4(:,:,n) = max(temp15, temp18);
            Tmax4(:,:,n) = max(Tmax4(:,:,n), temp21);
        else
            fprintf('%d-%d-%d dose not exit\n',year,i,k)
        end
        n = n + 1;
    end
end 

year = 2040;
Tmax5 = zeros(63,54,91);

n = 1;
for i = 6:8          
    for k = 1:num(i-5)                 
        if k > 9

            filename15 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
        else

            filename15 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
            filename18 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
            filename21 = ['F:/Output files/2036-2040-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
        end


        if exist(filename15,'file') ~= 0 && exist(filename18,'file') ~= 0 && exist(filename21,'file') ~= 0                
            temp15 = ncread(filename15,'T2');
            temp15 = temp15 - 273.15;
            temp18 = ncread(filename18,'T2');
            temp18 = temp18 - 273.15;
            temp21 = ncread(filename21,'T2');
            temp21 = temp21 - 273.15;              
            Tmax5(:,:,n) = max(temp15, temp18);
            Tmax5(:,:,n) = max(Tmax5(:,:,n), temp21);
        else
            fprintf('%d-%d-%d dose not exit\n',year,i,k)
        end
        n = n + 1;
    end
end 

sum1 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        sum1(lon,lat) = mean(Tmax1(lon,lat,:));      
    end
end


sum2 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        sum2(lon,lat) = mean(Tmax2(lon,lat,:));   
    end
end


sum3 = zeros(63,54);
for lon = 1:63
    for lat =1:54
        sum3(lon,lat) = mean(Tmax3(lon,lat,:));
    end
end


sum4 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        sum4(lon,lat) = mean(Tmax4(lon,lat,:));
    end
end


sum5 = zeros(63,54);
for lon = 1:63
    for lat = 1:54     
        sum5(lon,lat) = mean(Tmax5(lon,lat,:));
    end
end

sum = (sum1 + sum2 + sum3 + sum4 + sum5) / 5;