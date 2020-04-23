%lat = [6,9,28,32,33,36,36,42,48,12,12,16,19,19,22,27];
%lon = [26,24,23,18,40,29,42,5,27,28,46,12,24,2,44,35];
num = [30,31,31,29];
Temperature = null(8,605);

%D3 1:9

n = 1;
for year = 2001:2005
    for i = 6:9
        for k = 1:num(month-5)
            if k > 9
                filename0 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','00_00_00.nc'];
                filename3 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','03_00_00.nc'];
                filename6 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','06_00_00.nc'];
                filename9 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','09_00_00.nc'];
                filename12 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','12_00_00.nc'];
                filename15 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                filename18 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename0 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','00_00_00.nc'];
                filename3 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','03_00_00.nc'];
                filename6 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','06_00_00.nc'];
                filename9 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','09_00_00.nc'];
                filename12 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','12_00_00.nc'];
                filename15 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                filename18 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end

            if exist(filename0,'file') == 0
                T0 = -99;
            else
                temp0 = ncread(filename0,'T2');
                T0 = temp0(lon,lat,1)-273.15;            
            end
            Temperature(1,n) = T0;


            if exist(filename3,'file') == 0
                T3 = -99;
            else
                temp3 = ncread(filename3,'T2');
                T3 = temp3(lon,lat,1)-273.15;
            end
            Temperature(2,n) = T3;


            if exist(filename6,'file') == 0
                T6 = -99;
            else
                temp6 = ncread(filename6,'T2');
                T6 = temp6(lon,lat,1)-273.15;
            end
            Temperature(3,n) = T6;


            if exist(filename9,'file') == 0
                T9 = -99;
            else
                temp9 = ncread(filename9,'T2');
                T9 = temp9(lon,lat,1)-273.15;
            end
            Temperature(4,n) = T9;


            if exist(filename12,'file') == 0
                T12 = -99;
            else
                temp12 = ncread(filename12,'T2');
                T12 = temp12(lon,lat,1)-273.15;
            end
            Temperature(5,n) = T12;


            if exist(filename15,'file') == 0
                T15 = -99;
            else
                temp15 = ncread(filename15,'T2');
                T15 = temp15(lon,lat,1)-273.15;
            end
            Temperature(6,n) = T15;


            if exist(filename18,'file') == 0
                T18 = -99;
            else
                temp18 = ncread(filename18,'T2');
                T18 = temp18(lon,lat,1)-273.15;
            end
            Temperature(7,n) = T18;


            if exist(filename21,'file') == 0
                T21 = -99;
            else
                temp21 = ncread(filename21,'T2');
                T21 = temp21(lon,lat,1)-273.15;
            end
            Temperature(8,n) = T21;

            n = n + 1;
        end
    end
end


%D4 10:16

n = 1;
for year = 2001:2005
    for i = 6:9
        for k = 1:num(month-5)
            if k > 9
                filename0 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','00_00_00.nc'];
                filename3 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','03_00_00.nc'];
                filename6 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','06_00_00.nc'];
                filename9 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','09_00_00.nc'];
                filename12 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','12_00_00.nc'];
                filename15 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','15_00_00.nc'];
                filename18 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','18_00_00.nc'];
                filename21 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
            else
                filename0 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','00_00_00.nc'];
                filename3 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','03_00_00.nc'];
                filename6 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','06_00_00.nc'];
                filename9 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','09_00_00.nc'];
                filename12 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','12_00_00.nc'];
                filename15 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','15_00_00.nc'];
                filename18 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','18_00_00.nc'];
                filename21 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
            end

            if exist(filename0,'file') == 0
                T0 = -99;
            else
                temp0 = ncread(filename0,'T2');
                T0 = temp0(lon,lat,1)-273.15;            
            end
            Temperature(1,n) = T0;


            if exist(filename3,'file') == 0
                T3 = -99;
            else
                temp3 = ncread(filename3,'T2');
                T3 = temp3(lon,lat,1)-273.15;
            end
            Temperature(2,n) = T3;


            if exist(filename6,'file') == 0
                T6 = -99;
            else
                temp6 = ncread(filename6,'T2');
                T6 = temp6(lon,lat,1)-273.15;
            end
            Temperature(3,n) = T6;


            if exist(filename9,'file') == 0
                T9 = -99;
            else
                temp9 = ncread(filename9,'T2');
                T9 = temp9(lon,lat,1)-273.15;
            end
            Temperature(4,n) = T9;


            if exist(filename12,'file') == 0
                T12 = -99;
            else
                temp12 = ncread(filename12,'T2');
                T12 = temp12(lon,lat,1)-273.15;
            end
            Temperature(5,n) = T12;


            if exist(filename15,'file') == 0
                T15 = -99;
            else
                temp15 = ncread(filename15,'T2');
                T15 = temp15(lon,lat,1)-273.15;
            end
            Temperature(6,n) = T15;


            if exist(filename18,'file') == 0
                T18 = -99;
            else
                temp18 = ncread(filename18,'T2');
                T18 = temp18(lon,lat,1)-273.15;
            end
            Temperature(7,n) = T18;


            if exist(filename21,'file') == 0
                T21 = -99;
            else
                temp21 = ncread(filename21,'T2');
                T21 = temp21(lon,lat,1)-273.15;
            end
            Temperature(8,n) = T21;

            n = n + 1;
        end
    end
end



