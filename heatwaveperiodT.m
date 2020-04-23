%Temperature reduction every hour in three days of a heat wave

time = {'05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','00','01','02','03','04'};
M2 = null(48);
S2 = null(48);
new2 = null(1872);

%11111111111111111111111111111111111111111111111111111111111111111111111111
for k = 1:19
    t = time{k};
    
    file2 = ['F:\Output_scenarios\2040\ref\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\arw\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap1\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap2\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr1\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr2\wrfout_d04_2040-07-31_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2070\ref\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\arw\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-01_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2100\ref\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\arw\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-23_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    old2 = ncread(file2,'T2');
    old2 = old2 - 273.15;
    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
    %Max2(k) = max(new2);
end

%2222222222222222222222222222222222222222222222222222222222222222222222222
for k = 20:24
    t = time{k};
    
    file2 = ['F:\Output_scenarios\2040\ref\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\arw\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap1\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap2\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr1\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr2\wrfout_d04_2040-08-01_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2070\ref\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\arw\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %fiel2 = ['F:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-02_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2100\ref\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\arw\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-24_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    old2 = ncread(file2,'T2');
    old2 = old2 - 273.15;
    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
    
end

%11111111111111111111111111111111111111111111111111111111111111111111111111
for k = 25:43
    t = time{k-24};
    
    file2 = ['F:\Output_scenarios\2040\ref\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\arw\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap1\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap2\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr1\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr2\wrfout_d04_2040-08-01_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2070\ref\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\arw\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-02_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2100\ref\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\arw\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-24_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    old2 = ncread(file2,'T2');
    old2 = old2 - 273.15;
    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
    %Max2(k) = max(new2);
end

%2222222222222222222222222222222222222222222222222222222222222222222222222
for k = 44:48
    t = time{k-24};
    
    file2 = ['F:\Output_scenarios\2040\ref\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\arw\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap1\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap2\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr1\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr2\wrfout_d04_2040-08-02_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2070\ref\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\arw\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %fiel2 = ['F:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-03_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2100\ref\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\arw\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-25_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    old2 = ncread(file2,'T2');
    old2 = old2 - 273.15;
    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
    
end

%11111111111111111111111111111111111111111111111111111111111111111111111111
for k = 49:67
    t = time{k-48};
    
    file2 = ['F:\Output_scenarios\2040\ref\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\arw\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap1\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap2\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr1\wrfout_d04_2040-08-02_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr2\wrfout_d04_2040-08-02_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2070\ref\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\arw\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-03_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2100\ref\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\arw\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-25_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-25_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    old2 = ncread(file2,'T2');
    old2 = old2 - 273.15;
    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
    %Max2(k) = max(new2);
end

%2222222222222222222222222222222222222222222222222222222222222222222222222
for k = 68:72
    t = time{k-48};
    
    file2 = ['F:\Output_scenarios\2040\ref\wrfout_d04_2040-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\arw\wrfout_d04_2040-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap1\wrfout_d04_2040-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\ap2\wrfout_d04_2040-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr1\wrfout_d04_2040-08-03_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2040\gr2\wrfout_d04_2040-08-03_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2070\ref\wrfout_d04_2067-08-04_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\arw\wrfout_d04_2067-08-04_',t,'_00_00.nc'];
    %fiel2 = ['F:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-04_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-04_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-04_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-04_',t,'_00_00.nc'];

    %file2 = ['F:\Output_scenarios\2100\ref\wrfout_d04_2099-07-26_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\arw\wrfout_d04_2099-07-26_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-26_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-26_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-26_',t,'_00_00.nc'];
    %file2 = ['F:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-26_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    old2 = ncread(file2,'T2');
    old2 = old2 - 273.15;
    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
    
end


%legend('Reference','AR100','AP100','AP200','GR50','GR100','Orientation','horizontal');
% xlabel('Local time');
% ylabel('Latent heat flux (W/m^2)');
%
% M3 = M2 - M1;
% S3 = sqrt(S1*S1+S2*S2);

 plot(M2);
 hold on