clear
clc

num = [31,30,31,31,26];
year = 2096;
Tmax1 = zeros(63,54,149);
Temperature = zeros(3,149);
Amplitude1 = zeros(63,54,10);
Frequency1 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 5:9          
            for k = 1:num(i-4)                 
                if k > 9
                                      
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                 Amplitude1(lon,lat,Frequency1(lon,lat)) = max(Tmax1(lon,lat,j:j+5));
                 j = j + 6;
                 
 
                 while j < 149 && Tmax1(lon,lat,j) > 31.7
                     Amplitude1(lon,lat,Frequency1(lon,lat)) = max(Amplitude1(lon,lat,Frequency1(lon,lat)),Tmax1(lon,lat,j)); 
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


year = 2097;
Tmax2 = zeros(63,54,149);
Amplitude2 = zeros(63,54,10);
Frequency2 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                                      
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                 Amplitude2(lon,lat,Frequency2(lon,lat)) = max(Tmax2(lon,lat,j:j+5));
                 j = j + 6;
                 
 
                 while j < 149 && Tmax2(lon,lat,j) > 31.7
                     Amplitude2(lon,lat,Frequency2(lon,lat)) = max(Amplitude2(lon,lat,Frequency2(lon,lat)),Tmax2(lon,lat,j));
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end



year = 2098;
Tmax3 = zeros(63,54,149);
Amplitude3 = zeros(63,54,10);
Frequency3 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                                      
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                 Amplitude3(lon,lat,Frequency3(lon,lat)) = max(Tmax3(lon,lat,j:j+5));
                 j = j + 6;
                 
 
                 while j < 149 && Tmax3(lon,lat,j) > 31.7
                     Amplitude3(lon,lat,Frequency3(lon,lat)) = max(Amplitude3(lon,lat,Frequency3(lon,lat)),Tmax3(lon,lat,j));
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end



year = 2099;
Tmax4 = zeros(63,54,149);
Amplitude4 = zeros(63,54,10);
Frequency4 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                                      
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                 Amplitude4(lon,lat,Frequency4(lon,lat)) = max(Tmax4(lon,lat,j:j+5));
                 j = j + 6;
                 
 
                 while j < 149 && Tmax4(lon,lat,j) > 31.7
                     Amplitude4(lon,lat,Frequency4(lon,lat)) = max(Amplitude4(lon,lat,Frequency4(lon,lat)),Tmax4(lon,lat,j));
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


year = 2100;
Tmax5 = zeros(63,54,149);
Amplitude5 = zeros(63,54,10);
Frequency5 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year, lon,lat);
        n = 1;
        for i = 5:9
            for k = 1:num(i-4)                 
                if k > 9
                                      
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else
                   
                    filename15 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                    filename18 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/2096-2100-d3/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
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
                 Amplitude5(lon,lat,Frequency5(lon,lat)) = max(Tmax5(lon,lat,j:j+5));
                 j = j + 6;
                 
 
                 while j < 149 && Tmax5(lon,lat,j) > 31.7
                     Amplitude5(lon,lat,Frequency5(lon,lat)) = max(Amplitude5(lon,lat,Frequency5(lon,lat)),Tmax5(lon,lat,j));
                     j = j + 1;
                 end
            end
            j = j + 1;
        end
             
    end
end


sum1 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
         if Frequency1(lon,lat) > 0
    
            for n1 = 1:Frequency1(lon,lat)
                sum1(lon,lat) = sum1(lon,lat) + Amplitude1(lon,lat,n1);
            end
            sum1(lon,lat) = sum1(lon,lat)/Frequency1(lon,lat);
            
         end        
    end
end


sum2 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        if Frequency2(lon,lat) > 0
    
            for n2 = 1:Frequency2(lon,lat)
                sum2(lon,lat) = sum2(lon,lat) + Amplitude2(lon,lat,n2);
            end
            sum2(lon,lat) = sum2(lon,lat)/Frequency2(lon,lat);
            
        end    
    end
end


sum3 = zeros(63,54);
for lon = 1:63
    for lat =1:54
        if Frequency3(lon,lat) > 0

            for n3 = 1:Frequency3(lon,lat)
                sum3(lon,lat) = sum3(lon,lat) + Amplitude3(lon,lat,n3);
            end
            sum3(lon,lat) = sum3(lon,lat)/Frequency3(lon,lat);
            
        end
    end
end


sum4 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        if Frequency4(lon,lat) > 0
   
            for n4 = 1:Frequency4(lon,lat)
                sum4(lon,lat) = sum4(lon,lat) + Amplitude4(lon,lat,n4);
            end
            sum4(lon,lat) = sum4(lon,lat)/Frequency4(lon,lat);
        end
    end
end


sum5 = zeros(63,54);
for lon = 1:63
    for lat = 1:54
        if Frequency5(lon,lat) > 0

            for n5 = 1:Frequency5(lon,lat)
                sum5(lon,lat) = sum5(lon,lat) + Amplitude5(lon,lat,n5);
            end
            sum5(lon,lat) = sum5(lon,lat)/Frequency5(lon,lat);
        end
    end
end

