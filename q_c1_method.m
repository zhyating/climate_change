function Y = q_c1_method(x)     %(Ts, T_film, rho_f, kf, N_Re, q_c1, q_r, R, mu_f)

Vw = x(10);
Ta = x(11);
N = x(12);
Hour = x(13); 

D0 = 0.0281;         %Conductor outside diameter, m
R_25 = 7.283/10^5;   %Conductor AC resistandce, Ohm/m
R_75 = 8.688/10^5;
Ampacity = 907;

E = 0.5;             %Emissivity
a = 0.5;             %Solar absorptivity
Z1 = 90;             %Azimuth of line: The line runs in an east to west direction
lat = 40;            %Latitude: North
He = 0;              %Line elevation is 0 m (0 ft)       
omega = 15 * (Hour - 12);          %The hour angle. The number of hours from noon times 15 degrees (11AM is –15, 2PM is +30).
k_angle = 1;

delta = 23.46 * sind((284 + N) / 365 * 360);
Hc = asind(cosd(lat) * cosd(delta) * cosd(omega) + sind(lat) * sind(delta));   %Solar altitude, degree

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
q_s = a * Q_s *sind(theta) * D0;                                                        %Solar heat gain rate
I = (0.6 + (Ta - 31.18) * 0.09) * Ampacity;

Y(1,1) = (Ta + x(1)) / 2 - x(2);
Y(2,1) = (1.458/10^6 * (x(2) + 273)^1.5) / (x(2) + 383.4) - x(9);
Y(3,1) = (1.293 - 1.525/10^4 + 6.379/10^9 * He^2) / (1 + 0.00367 * x(2)) - x(3);     %Air density, kg/m^3     
Y(4,1) = 2.424/10^2 + 7.477/10^5 * x(2) - 4.407/10^9 * x(2)^2 - x(4);                 %Thermal conductivity of air, w/m-degree C
Y(5,1) = D0 * x(3)* Vw / x(9) - x(5);                                                 %Reynolds number
Y(6,1) = k_angle * (1.01 + 1.35 * x(5)^0.52) * x(4) * (x(1) - Ta) - x(6);
Y(7,1) = 17.8 * D0 * E * (((x(1) + 273)/100)^4 - ((Ta + 273)/100)^4) - x(7);               %Radiated heat loss rate, w/m
Y(8,1) = (x(6) + x(7) - q_s) / I^2 - x(8); 
Y(9,1) = (x(8) - R_25) * (75 - 25) / (R_75 - R_25) + 25 - x(1);

end

