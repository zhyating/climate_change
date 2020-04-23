function T = temperature_of_conductor(V, T, N, Hour)

x1 = [100, 70, 1.029, 0.02945, 42.4, 39.1, 0.0000939, 0.00002043, double(V), double(T), double(N), double(Hour)];
options = optimoptions('fsolve','Display','none');
M1 = fsolve(@q_cn_method, x1, options);
q_cn = M1(5);

x2 = [100, 70, 1.029, 0.02945, 865, 81.93, 39.1, 0.0000939, 0.00002043, double(V), double(T), double(N), double(Hour)];
options = optimoptions('fsolve','Display','none');
M2 = fsolve(@q_c1_method, x2, options);
q_c1 = M2(6);

x3 = [100, 70, 1.029, 0.02945, 865, 77.06, 39.1, 0.0000939, 0.00002043, double(V), double(T), double(N), double(Hour)];
options = optimoptions('fsolve','Display','none');
M3 = fsolve(@q_c2_method, x3, options);
q_c2 = M3(6);

if q_c1 > q_c2
    if q_c1 > q_cn
        T = M2(1);
    else
        T = M1(1);
    end  
else
    if q_c2 > q_cn
        T = M3(1);
    else
        T = M1(1);
    end 
end

end