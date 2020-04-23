clear
clc

pq0 = 379.9056;
a2 = 17.2693882;
a3 = 273.16;
a4 = 35.86;
num = [30,31,31,26];


year = 2096;
HI1 = zeros(63,54,118);

for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 6:9          
            for k = 1:num(i-5)                 
                if k > 9                            
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else                   
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
                end

 
                if exist(filename18,'file') == 0
                    HI18 = -99;
                else
                    temp18 = ncread(filename18,'T2');
                    T18 = temp18(lon,lat,1);
                    vapor18 = ncread(filename18,'Q2');
                    Q18 = vapor18(lon,lat,1);
                    pressure18 = ncread(filename18,'PSFC');
                    psfc18 = pressure18(lon,lat,1);
                    RH18 = Q18 / ((pq0 / psfc18) * exp(a2 * (T18 - a3)/(T18 - a4)));
                    T18 = T18 * 9 / 5 - 459.67;
                    HI18 = -42.379 + 2.04901523 * T18 + 10.14333127 * RH18 - 0.22475541 * T18 * RH18 - 0.00683783 * T18 ^ 2 - ...
                        0.05481717 * RH18 ^ 2 + 0.00122874 * T18 ^ 2 * RH18 + 0.00085282 * T18 * RH18 ^ 2 - ...
                        0.00000199 * T18 ^ 2 * RH18 ^ 2;
                end

             
                if exist(filename21,'file') == 0
                    HI21 = -99;
                else
                    temp21 = ncread(filename21,'T2');
                    T21 = temp21(lon,lat,1);
                    vapor21 = ncread(filename21,'Q2');
                    Q21 = vapor21(lon,lat,1);
                    pressure21 = ncread(filename21,'PSFC');
                    psfc21 = pressure21(lon,lat,1);
                    RH21 = Q21 / ((pq0 / psfc21) * exp(a2 * (T21 - a3)/(T21 - a4)));
                    T21 = T21 * 9 / 5 - 459.67;
                    HI21 = -42.379 + 2.04901523 * T21 + 10.14333127 * RH21 - 0.22475541 * T21 * RH21 - 0.00683783 * T21 ^ 2 - ...
                        0.05481717 * RH21 ^ 2 + 0.00122874 * T21 ^ 2 * RH21 + 0.00085282 * T21 * RH21 ^ 2 - ...
                        0.00000199 * T21 ^ 2 * RH21 ^ 2;
                end
                
                HI1(lon,lat,n) = max(HI18, HI21); 
                n = n + 1;
            end
        end                           
    end
end


year = 2097;
HI2 = zeros(63,54,118);

for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 6:9          
            for k = 1:num(i-5)                 
                if k > 9                            
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else                   
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
                end

 
                 if exist(filename18,'file') == 0
                    HI18 = -99;
                else
                    temp18 = ncread(filename18,'T2');
                    T18 = temp18(lon,lat,1);
                    vapor18 = ncread(filename18,'Q2');
                    Q18 = vapor18(lon,lat,1);
                    pressure18 = ncread(filename18,'PSFC');
                    psfc18 = pressure18(lon,lat,1);
                    RH18 = Q18 / ((pq0 / psfc18) * exp(a2 * (T18 - a3)/(T18 - a4)));
                    T18 = T18 * 9 / 5 - 459.67;
                    HI18 = -42.379 + 2.04901523 * T18 + 10.14333127 * RH18 - 0.22475541 * T18 * RH18 - 0.00683783 * T18 ^ 2 - ...
                        0.05481717 * RH18 ^ 2 + 0.00122874 * T18 ^ 2 * RH18 + 0.00085282 * T18 * RH18 ^ 2 - ...
                        0.00000199 * T18 ^ 2 * RH18 ^ 2;
                end

             
                if exist(filename21,'file') == 0
                    HI21 = -99;
                else
                    temp21 = ncread(filename21,'T2');
                    T21 = temp21(lon,lat,1);
                    vapor21 = ncread(filename21,'Q2');
                    Q21 = vapor21(lon,lat,1);
                    pressure21 = ncread(filename21,'PSFC');
                    psfc21 = pressure21(lon,lat,1);
                    RH21 = Q21 / ((pq0 / psfc21) * exp(a2 * (T21 - a3)/(T21 - a4)));
                    T21 = T21 * 9 / 5 - 459.67;
                    HI21 = -42.379 + 2.04901523 * T21 + 10.14333127 * RH21 - 0.22475541 * T21 * RH21 - 0.00683783 * T21 ^ 2 - ...
                        0.05481717 * RH21 ^ 2 + 0.00122874 * T21 ^ 2 * RH21 + 0.00085282 * T21 * RH21 ^ 2 - ...
                        0.00000199 * T21 ^ 2 * RH21 ^ 2;
                end
                
                HI2(lon,lat,n) = max(HI18, HI21); 
                n = n + 1;
            end
        end                           
    end
end
 

year = 2098;
HI3 = zeros(63,54,118);

for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 6:9          
            for k = 1:num(i-5)                 
                if k > 9                            
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else                   
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
                end

 
                if exist(filename18,'file') == 0
                    HI18 = -99;
                else
                    temp18 = ncread(filename18,'T2');
                    T18 = temp18(lon,lat,1);
                    vapor18 = ncread(filename18,'Q2');
                    Q18 = vapor18(lon,lat,1);
                    pressure18 = ncread(filename18,'PSFC');
                    psfc18 = pressure18(lon,lat,1);
                    RH18 = Q18 / ((pq0 / psfc18) * exp(a2 * (T18 - a3)/(T18 - a4)));
                    T18 = T18 * 9 / 5 - 459.67;
                    HI18 = -42.379 + 2.04901523 * T18 + 10.14333127 * RH18 - 0.22475541 * T18 * RH18 - 0.00683783 * T18 ^ 2 - ...
                        0.05481717 * RH18 ^ 2 + 0.00122874 * T18 ^ 2 * RH18 + 0.00085282 * T18 * RH18 ^ 2 - ...
                        0.00000199 * T18 ^ 2 * RH18 ^ 2;
                end

             
                if exist(filename21,'file') == 0
                    HI21 = -99;
                else
                    temp21 = ncread(filename21,'T2');
                    T21 = temp21(lon,lat,1);
                    vapor21 = ncread(filename21,'Q2');
                    Q21 = vapor21(lon,lat,1);
                    pressure21 = ncread(filename21,'PSFC');
                    psfc21 = pressure21(lon,lat,1);
                    RH21 = Q21 / ((pq0 / psfc21) * exp(a2 * (T21 - a3)/(T21 - a4)));
                    T21 = T21 * 9 / 5 - 459.67;
                    HI21 = -42.379 + 2.04901523 * T21 + 10.14333127 * RH21 - 0.22475541 * T21 * RH21 - 0.00683783 * T21 ^ 2 - ...
                        0.05481717 * RH21 ^ 2 + 0.00122874 * T21 ^ 2 * RH21 + 0.00085282 * T21 * RH21 ^ 2 - ...
                        0.00000199 * T21 ^ 2 * RH21 ^ 2;
                end
                
                HI3(lon,lat,n) = max(HI18, HI21); 
                n = n + 1;
            end
        end                           
    end
end


year = 2099;
HI4 = zeros(63,54,118);

for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 6:9          
            for k = 1:num(i-5)                 
                if k > 9                            
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else                   
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
                end

 
                 if exist(filename18,'file') == 0
                    HI18 = -99;
                else
                    temp18 = ncread(filename18,'T2');
                    T18 = temp18(lon,lat,1);
                    vapor18 = ncread(filename18,'Q2');
                    Q18 = vapor18(lon,lat,1);
                    pressure18 = ncread(filename18,'PSFC');
                    psfc18 = pressure18(lon,lat,1);
                    RH18 = Q18 / ((pq0 / psfc18) * exp(a2 * (T18 - a3)/(T18 - a4)));
                    T18 = T18 * 9 / 5 - 459.67;
                    HI18 = -42.379 + 2.04901523 * T18 + 10.14333127 * RH18 - 0.22475541 * T18 * RH18 - 0.00683783 * T18 ^ 2 - ...
                        0.05481717 * RH18 ^ 2 + 0.00122874 * T18 ^ 2 * RH18 + 0.00085282 * T18 * RH18 ^ 2 - ...
                        0.00000199 * T18 ^ 2 * RH18 ^ 2;
                end

             
                if exist(filename21,'file') == 0
                    HI21 = -99;
                else
                    temp21 = ncread(filename21,'T2');
                    T21 = temp21(lon,lat,1);
                    vapor21 = ncread(filename21,'Q2');
                    Q21 = vapor21(lon,lat,1);
                    pressure21 = ncread(filename21,'PSFC');
                    psfc21 = pressure21(lon,lat,1);
                    RH21 = Q21 / ((pq0 / psfc21) * exp(a2 * (T21 - a3)/(T21 - a4)));
                    T21 = T21 * 9 / 5 - 459.67;
                    HI21 = -42.379 + 2.04901523 * T21 + 10.14333127 * RH21 - 0.22475541 * T21 * RH21 - 0.00683783 * T21 ^ 2 - ...
                        0.05481717 * RH21 ^ 2 + 0.00122874 * T21 ^ 2 * RH21 + 0.00085282 * T21 * RH21 ^ 2 - ...
                        0.00000199 * T21 ^ 2 * RH21 ^ 2;
                end
                
                HI4(lon,lat,n) = max(HI18, HI21); 
                n = n + 1;
            end
        end                           
    end
end



year = 2100;
HI5 = zeros(63,54,118);

for lon = 1:63
    for lat = 1:54
        fprintf('year = %d, lon = %d, lat = %d\n',year,lon,lat);
        n = 1;
        for i = 6:9          
            for k = 1:num(i-5)                 
                if k > 9                            
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
                else                   
                    filename18 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                    filename21 = ['F:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
                end

 
                 if exist(filename18,'file') == 0
                    HI18 = -99;
                else
                    temp18 = ncread(filename18,'T2');
                    T18 = temp18(lon,lat,1);
                    vapor18 = ncread(filename18,'Q2');
                    Q18 = vapor18(lon,lat,1);
                    pressure18 = ncread(filename18,'PSFC');
                    psfc18 = pressure18(lon,lat,1);
                    RH18 = Q18 / ((pq0 / psfc18) * exp(a2 * (T18 - a3)/(T18 - a4)));
                    T18 = T18 * 9 / 5 - 459.67;
                    HI18 = -42.379 + 2.04901523 * T18 + 10.14333127 * RH18 - 0.22475541 * T18 * RH18 - 0.00683783 * T18 ^ 2 - ...
                        0.05481717 * RH18 ^ 2 + 0.00122874 * T18 ^ 2 * RH18 + 0.00085282 * T18 * RH18 ^ 2 - ...
                        0.00000199 * T18 ^ 2 * RH18 ^ 2;
                end

             
                if exist(filename21,'file') == 0
                    HI21 = -99;
                else
                    temp21 = ncread(filename21,'T2');
                    T21 = temp21(lon,lat,1);
                    vapor21 = ncread(filename21,'Q2');
                    Q21 = vapor21(lon,lat,1);
                    pressure21 = ncread(filename21,'PSFC');
                    psfc21 = pressure21(lon,lat,1);
                    RH21 = Q21 / ((pq0 / psfc21) * exp(a2 * (T21 - a3)/(T21 - a4)));
                    T21 = T21 * 9 / 5 - 459.67;
                    HI21 = -42.379 + 2.04901523 * T21 + 10.14333127 * RH21 - 0.22475541 * T21 * RH21 - 0.00683783 * T21 ^ 2 - ...
                        0.05481717 * RH21 ^ 2 + 0.00122874 * T21 ^ 2 * RH21 + 0.00085282 * T21 * RH21 ^ 2 - ...
                        0.00000199 * T21 ^ 2 * RH21 ^ 2;
                end
                
                HI5(lon,lat,n) = max(HI18, HI21); 
                n = n + 1;
            end
        end                           
    end
end