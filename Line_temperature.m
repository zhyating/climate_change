clear
clc

%Clear atmosphere, 795 kcmil 26/7 Drake ACSR conductor
I = 1000;            %Current, A
Vw = 0.61;           %Wind speed perpendicular to the conductor, m/s
E = 0.8;             %Emissivity
a = 0.8;             %Solar absorptivity
Ts = 100;            %Conductor surface temperature, degree C
Ta = 40;             %Ambient air temperature, degree C
D0 = 0.0281;         %Conductor outside diameter, m
Dc = 0.0104;         %Conductor inside diameter, m
R_25 = 7.283/10^5;   %Conductor AC resistandce, Ohm/m
R_75 = 8.688/10^5;
Z1 = 90;             %Azimuth of line: The line runs in an east to west direction
lat = 30;            %Latitude: North
He = 0;              %Line elevation is 0 m (0 ft)       
N = 161;             %The day of the year
Hour = 13;
omega = 15 * (Hour - 12);          %The hour angle. The number of hours from noon times 15 degrees (11AM is –15, 2PM is +30).
k_angle = 1;


T_film = (Ta + Ts) / 2;
mu_f = (1.458/10^6 * (T_film + 273)^1.5) / (T_film + 383.4);      %Air viscosdity, kg/m-s
rho_f = (1.293 - 1.525/10^4 + 6.379/10^9 * He^2) / (1 + 0.00367 * T_film);    %Air density, kg/m^3     
kf = 2.424/10^2 + 7.477/10^5 * T_film - 4.407/10^9 * T_film^2;    %Thermal conductivity of air, w/m-degree C

q_cn = 3.645 * rho_f^0.5 * D0^0.75 * (Ts - Ta)^1.25;              %Natural convection heat loss, w/m
K_angle = 1;                                                      %Wind direction multiplyer
N_Re = D0 * rho_f * Vw / mu_f;                                    %Reynolds number
q_c1 = k_angle * (1.01 + 1.35 * N_Re^0.52) * kf * (Ts - Ta);      %Forced convention heat loss, w/m
q_c2 = k_angle * 0.754 * N_Re^0.6 * kf * (Ts - Ta);
q_c = max(q_c1,q_c2);

q_r = 17.8 * D0 * E * (((Ts + 273)/100)^4 - ((Ta + 273)/100)^4);  %Radiated heat loss rate, w/m

delta = 23.46 * sind((284 + N) / 365 * 360);
Hc = asind(cosd(lat) * cosd(delta) * cosd(omega) + sind(lat) * sind(delta));             %Solar altitude, degree
Q_s = -42.2391 + 63.8044 * Hc - 1.922 * Hc^2 + 3.46921/10^2 * Hc^3 - 3.61118/10^4 * Hc^4 + 1.94318/10^6 * Hc^5 - 4.07608/10^9 * Hc^6;  
%Solar heat flux, w/m^2
chi = sind(omega) / (sind(lat) * cosd(omega) - cosd(lat) * tand(delta));
if chi >= 0
    if omega < 0 && omega >= -180
        C = 0;
    else
        C = 180;
    end
else
    if omega < 0 && omega >= -180
        C = 180;
    else
        C = 360;
    end
end        
Zc = C + atand(chi);
theta = acosd(cosd(Hc) * cosd(Zc - Z1));
q_s = a * Q_s *sind(theta) * D0;                                    %Solar heat gain rate
                 
R = (q_c + q_r - q_s) / I^2;                                       %Resistandce at operating temperature, Ohm/m
T = (R - R_25) * (75 - 25) / (R_75 - R_25) + 25;                   %Operating temperature, degree C
