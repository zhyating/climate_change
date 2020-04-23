from netCDF4 import Dataset as NetCDFFile 

nc = NetCDFFile('1990010100Z-2005123118Z.nc')


"""
T = nc.variables['T'][9470,29,136:139,225:229] 
t2 = T[:]-273.15
print t2
"""



time = nc.variables['time'][12770]
print time


"""
p1 = 10699
p2 = 11310
T = nc.variables['T'][p1:p2,29,136,228]
t = T[:]-273.15
print t
"""