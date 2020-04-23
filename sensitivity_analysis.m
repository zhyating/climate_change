% GRDFLX                  % ground heat flux, W m-2
% ACGRDFLX                % accumulated ground heat flux, J m-2
% HFX                     % upward sensible heat flux, W m-2
% ACHFX                   % accumulated upward sensible heat flux, J m-2
% QFX                     % upward moisture flux at surface, kg m-2 s-1
% LH                      % latent heat flux at surface, W m-2
% ACLHF                   % accumulated upward latent heat flux, J m-2
% SWDOWN                  % DOWNWARD SHORT WAVE FLUX AT GROUND SURFACE
% GLW                     % DOWNWARD LONG WAVE FLUX AT GROUND SURFACE

clear
clc

time = {'05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17'};
M2 = null(48);
S2 = null(48);
% Mdiff = null(48);
% Sdiff = null(48);

new2 = null(1872);
% diff2 = null(1872);
% Max2 = null(48);

%11111111111111111111111111111111111111111111111111111111111111111111111111
for k = 1:19
    t = time{k};
    
%     file2 = ['H:\Output_scenarios\2040\ref\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\arw\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\ap1\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\ap2\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\gr1\wrfout_d04_2040-07-31_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\gr2\wrfout_d04_2040-07-31_',t,'_00_00.nc'];

%     file2 = ['H:\Output_scenarios\2070\ref\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\arw\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-01_',t,'_00_00.nc'];

%     file2 = ['H:\Output_scenarios\2100\ref\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
    file2 = ['H:\Output_scenarios\2100\arw\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-23_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-23_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    
%     rold = ncread(file,'T2');
%     rold = rold - 273.15;

%     rold = ncread(file,'GRDFLX');
%     rold = ncread(file,'LH');
%     rold = ncread(file,'HFX');    
%     rold = rold2 + rold3 + rold4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     old = ncread(file2,'T2');
%     old = old - 273.15;

%     old2 = ncread(file2,'GRDFLX');
%     old3 = ncread(file2,'LH');
%     old = ncread(file2,'HFX');    
%     old = old2 + old3 + old4;
    old = ncread(file2, 'SWDOWN');
%     diff = old - rold;

    land2 = ncread(file2,'LU_INDEX');
    num = 1;

    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old(i,j);
%                 diff2(num) = diff(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
%     Mdiff(k) = mean(diff2);
%     Sdiff(k) = std(diff2);
%     Max2(k) = max(new2);
end

%2222222222222222222222222222222222222222222222222222222222222222222222222
for k = 20:25
    t = time{k};
    
%     file2 = ['H:\Output_scenarios\2040\ref\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\arw\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\ap1\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\ap2\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\gr1\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2040\gr2\wrfout_d04_2040-08-01_',t,'_00_00.nc'];
 
%     file2 = ['H:\Output_scenarios\2070\ref\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\arw\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-02_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-02_',t,'_00_00.nc'];

%     file2 = ['H:\Output_scenarios\2100\ref\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
    file2 = ['H:\Output_scenarios\2100\arw\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-24_',t,'_00_00.nc'];
%     file2 = ['H:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-24_',t,'_00_00.nc'];

    mask2 = ncread(file2,'LANDMASK');
    
%     rold = ncread(file,'T2');
%     rold = rold - 273.15;

%     rold = ncread(file,'GRDFLX');
%     rold = ncread(file,'LH');
%     rold = ncread(file,'HFX');    
%     rold = rold2 + rold3 + rold4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     old = ncread(file2,'T2');
%     old = old - 273.15;

%     old4 = ncread(file2,'GRDFLX');
%     old2 = ncread(file2,'LH');
%     old = ncread(file2,'HFX');    
%     old = old2 + old3 + old4;
    old = ncread(file2, 'SWDOWN');
%     diff = old - rold;

    land2 = ncread(file2,'LU_INDEX');
    num = 1;
    
    for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old(i,j);
%                 diff2(num) = diff(i,j);
                num = num + 1;
            end
        end
    end
    M2(k) = mean(new2);
    S2(k) = std(new2);
%     Mdiff(k) = mean(diff2);
%     Sdiff(k) = std(diff2);
%     Max2(k) = max(new2);
    
end


errorbar(M2,S2);
hold on 

% legend('Reference','AR100','AP100','AP200','GR50','GR100','Orientation','horizontal');
% xlabel('Local time');
% ylabel('Net radiation (W/m^2)');
%
% M3 = M2 - M1;
% S3 = sqrt(S1*S1+S2*S2);

