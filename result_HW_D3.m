clear
clc

num = [31,30,31,31,26];
year = 2011;
Tmax1 = zeros(63,54,149);
Temperature = zeros(3,149);
Duration1 = zeros(63,54);
Frequency1 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 5:9          
            for k = 1:num(i-4)                 
                if k > 9
                                      
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                
                
                Tmax1(lon,lat,n) = max(Temperature(:,n));
                if Tmax1(lon,lat,n) == -99
                    fprintf('%d-%d-%d dose not exit\n',year,i,k)
                end
                n = n + 1;
            end
        end
        
        j = 1;
        while j < 145
            if min(Tmax1(lon,lat,j:j+5)) > 31.7                
                 Frequency1(lon,lat) = Frequency1(lon,lat) + 1;
                 Duration1(lon,lat) = Duration1(lon,lat) + 6;
                 j = j + 6;
                 
 
                 while j < 149 && Tmax1(lon,lat,j) > 31.7
                     Duration1(lon,lat) = Duration1(lon,lat) + 1; 
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


year = 2097;
Tmax2 = zeros(63,54,149);
Duration2 = zeros(63,54);
Frequency2 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                    
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                
                
                Tmax2(lon,lat,n) = max(Temperature(:,n)); 
                if Tmax2(lon,lat,n) == -99
                    fprintf('%d-%d-%d dose not exit\n',year,i,k)
                end
                n = n + 1;
            end
        end
        
        j = 1;
        while j < 145
            if min(Tmax2(lon,lat,j:j+5)) > 31.7                
                 Frequency2(lon,lat) = Frequency2(lon,lat) + 1;
                 Duration2(lon,lat) = Duration2(lon,lat) + 6;
                 j = j + 6;
                 
 
                 while j < 149 && Tmax2(lon,lat,j) > 31.7
                     Duration2(lon,lat) = Duration2(lon,lat) + 1;
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


year = 2098;
Tmax3 = zeros(63,54,149);
Duration3 = zeros(63,54);
Frequency3 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                    
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                
                
                Tmax3(lon,lat,n) = max(Temperature(:,n));
                if Tmax3(lon,lat,n) == -99
                    fprintf('%d-%d-%d dose not exit\n',year,i,k)
                end
                n = n + 1;
            end
        end
        
        j = 1;
        while j < 145
            if min(Tmax3(lon,lat,j:j+5)) > 31.7                
                 Frequency3(lon,lat) = Frequency3(lon,lat) + 1;
                 Duration3(lon,lat) = Duration3(lon,lat) + 6;
                 j = j + 6;
                 
 
                 while j < 149 && Tmax3(lon,lat,j) > 31.7
                     Duration3(lon,lat) = Duration3(lon,lat) + 1;
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


year = 2099;
Tmax4 = zeros(63,54,149);
Duration4 = zeros(63,54);
Frequency4 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                    
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                
                
                Tmax4(lon,lat,n) = max(Temperature(:,n));  
                if Tmax4(lon,lat,n) == -99
                    fprintf('%d-%d-%d dose not exit\n',year,i,k)
                end
                n = n + 1;
            end
        end
        
        j = 1;
        while j < 145
            if min(Tmax4(lon,lat,j:j+5)) > 31.7                
                 Frequency4(lon,lat) = Frequency4(lon,lat) + 1;
                 Duration4(lon,lat) = Duration4(lon,lat) + 6;
                 j = j + 6;
                 
 
                 while j < 149 && Tmax4(lon,lat,j) > 31.7
                     Duration4(lon,lat) = Duration4(lon,lat) + 1;
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


year = 2100;
Tmax5 = zeros(63,54,149);
Duration5 = zeros(63,54);
Frequency5 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9                   
 
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                                       
                    filename15 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2011-2015-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                
                
                Tmax5(lon,lat,n) = max(Temperature(:,n)); 
                if Tmax5(lon,lat,n) == -99
                    fprintf('%d-%d-%d dose not exit\n',year,i,k)
                end
                n = n + 1;
            end
        end
        
        j = 1;
        while j < 145
            if min(Tmax5(lon,lat,j:j+5)) > 31.7                
                 Frequency5(lon,lat) = Frequency5(lon,lat) + 1;
                 Duration5(lon,lat) = Duration5(lon,lat) + 6;
                 j = j + 6;
                 
 
                 while j < 149 && Tmax5(lon,lat,j) > 31.7
                     Duration5(lon,lat) = Duration5(lon,lat) + 1;
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end

Frequency = (Frequency1 + Frequency2 + Frequency3 + Frequency4 + Frequency5) / 5;
D1 = Duration1./Frequency1;
D2 = Duration2./Frequency2;
D3 = Duration3./Frequency3;
D4 = Duration4./Frequency4;
D5 = Duration5./Frequency5;
