
%Simulation input
%SIM(16,605) 6.1-9.29 2001-2005

%Observation input
lat = LATITUDE(1);
T = null(16,605); T(1,1) = TMAX(1);
Y = null(16,605); Y(1,1) = YEAR(1);
M = null(16,605); M(1,1) = MONTH(1);
D = null(16,605); D(1,1) = DAY(1);

n = 1; k = 2;
for i = 2:length(LATITUDE)
    if MONTH(i) ~= 5 && DAY(i) ~= DAY(i-1)
        if LATITUDE(i) == lat
            T(n,k) = TMAX(i);
            Y(n,k) = YEAR(i);
            M(n,k) = MONTH(i);
            D(n,k) = DAY(i);
            k = k + 1;
        else
            n = n + 1;
            k = 1;
            lat = LATITUDE(i);
            fprintf('n = %d, latitude = %f\n',n,lat);
            T(n,k) = TMAX(i);
            Y(n,k) = YEAR(i);
            M(n,k) = MONTH(i);
            D(n,k) = DAY(i);
        end
    end
end
        
clear  i n k lat TMAX YEAR MONTH DAY LATITUDE LONGITUDE

%Validation
total = [30, 31, 31];
sim = null(16,605);
obs = null(16,605);
Ave = null(16);


for n = 1:16
    error = null(605);
    num = 1; j = 1;
    for Year = 2001:2005
        for Month = 6:8
            for Day = 1:total(Month-5)
                for i = 1:length(T(n,:))
                    if Y(n,i) == Year && M(n,i) == Month && D(n,i) == Day && T(n,i) ~= 0 && isnan(T(n,i)) == 0                        
                       error(num) = SIM(n,j)- T(n,i);                      
                       num = num + 1; 
                       break;
                    end
                end
                j = j + 1;
            end
        end
    end
    Ave(n) = mean(error);
    fprintf('num = %d\n',num);
    clear error
end

clear num Year Month Day

%histogram(error)
%xlabel('Temperature ()');
%ylabel('Frequency');

%plot(pair(:,1),pair(:,2),'.')
%xlabel('Simulated temperature ()');
%ylabel('Observed temperature ()');
%refline(1,0)





