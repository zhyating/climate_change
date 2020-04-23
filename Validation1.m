lat = [6,9,28,32,33,36,36,42,48,12,12,16,19,19,22,27];
lon = [26,24,23,18,40,29,42,5,27,28,46,12,24,2,44,35];
num = [30,31,31,29];
Temp = null(16,605);

for n = 1:9
    i = 1;
    for year = 2001:2005
        for month = 6:9
            for day = 1:num(month-5)
                if day > 9
                    file12 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','12_00_00.nc'];
                    file15 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','15_00_00.nc'];
                    file18 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','18_00_00.nc'];
                    file21 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','21_00_00.nc'];
                else
                    file12 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','12_00_00.nc'];
                    file15 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','15_00_00.nc'];
                    file18 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','18_00_00.nc'];
                    file21 = ['E:/Output files/wrfout_d03_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','21_00_00.nc'];
                end

                if exist(file12,'file') == 0
                    T12 = -99;
                else
                    temp = ncread(file12,'T2');
                    T12 = temp(lon(n),lat(n),1)-273.15;
                end 
                
                if exist(file15,'file') == 0
                    T15 = -99;
                else
                    temp = ncread(file15,'T2');
                    T15 = temp(lon(n),lat(n),1)-273.15;
                end 
                
                if exist(file18,'file') == 0
                    T18 = -99;
                else
                    temp = ncread(file18,'T2');
                    T18 = temp(lon(n),lat(n),1)-273.15;
                end
                
                if exist(file21,'file') == 0
                    T21 = -99;
                else
                    temp = ncread(file21,'T2');
                    T21 = temp(lon(n),lat(n),1)-273.15;
                end 
                
                Temp(n,i) = max([T12,T15,T18,T21]);
                if Temp(n,i) == -99
                    fprintf('d03, n = %d, i = %d\n',n,i);
                end
                i = i + 1;
            end
        end
    end
end


for n = 10:16
    i = 1;
    for year = 2001:2005
        for month = 6:9
            for day = 1:num(month-5)
                if day > 9
                    file12 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','12_00_00.nc'];
                    file15 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','15_00_00.nc'];
                    file18 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','18_00_00.nc'];
                    file21 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-',num2str(day),'_','21_00_00.nc'];
                else
                    file12 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','12_00_00.nc'];
                    file15 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','15_00_00.nc'];
                    file18 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','18_00_00.nc'];
                    file21 = ['E:/Output files/wrfout_d04_',num2str(year),'-0',num2str(month),'-0',num2str(day),'_','21_00_00.nc'];
                end

                if exist(file12,'file') == 0
                    T12 = -99;      
                else
                    temp = ncread(file12,'T2');
                    T12 = temp(lon(n),lat(n),1)-273.15;
                end 
                
                if exist(file15,'file') == 0
                    T15 = -99;
                else
                    temp = ncread(file15,'T2');
                    T15 = temp(lon(n),lat(n),1)-273.15;
                end 
                
                if exist(file18,'file') == 0
                    T18 = -99;
                else
                    temp = ncread(file18,'T2');
                    T18 = temp(lon(n),lat(n),1)-273.15;
                end
                
                if exist(file21,'file') == 0
                    T21 = -99;
                else
                    temp = ncread(file21,'T2');
                    T21 = temp(lon(n),lat(n),1)-273.15;
                end 
                
                Temp(n,i) = max([T12,T15,T18,T21]);
                if Temp(n,i) == -99
                    fprintf('d04, n = %d, i = %d\n',n,i);
                end
                i = i + 1;
                
            end
        end
    end
end


SIM = null(16,605);
n = [1,2,9,11,12,13,14,15,16,3,4,5,6,7,8,10];
for s = 1:16
    for v = 1:605
       SIM(s,v) = Temp(n(s),v);
    end
end

%clear day file i lat lon month n num s T temp Temp v year
