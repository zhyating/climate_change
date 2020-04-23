
a = mean(gr100(1:1188));
b = mean(gr100(1189:2376));
c = mean(gr100(2377:3564));
d = mean(gr100(3565:4752));
e = mean(gr100(4573:5940));
f = mean(gr100(5941:7128));
g = mean(gr100(7129:8316));
h = mean(gr100(8317:9504));
i = mean(gr100(9505:10692));
z = [0 56.6 137.9 244.7 377.6 546.3 761.1 1016.2 1372.7];


plot([a b c d e f g h i],z,'-o')
hold on
%xlabel('Temperature (\circC)')
%ylabel('Heigth (m)')