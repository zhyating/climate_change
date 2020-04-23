from netCDF4 import Dataset as NetCDFFile 

nc = NetCDFFile('1990010100Z-2005123118Z.nc')
p1 = 12159
p2 = 12770
level = nc.variables['lev'][29]


T = nc.variables['T'][p1:p2,29,136,225]
t = T[:]-273.15
print '(136,225)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,137,225]
t = T[:]-273.15
print '(137,225)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1       


T = nc.variables['T'][p1:p2,29,138,225]
t = T[:]-273.15
print '(138,225)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,136,226]
t = T[:]-273.15
print '(136,226)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,137,226]
t = T[:]-273.15
print '(137,226)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1   


T = nc.variables['T'][p1:p2,29,138,226]
t = T[:]-273.15
print '(138,226)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,136,227]
t = T[:]-273.15
print '(136,227)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,137,227]
t = T[:]-273.15
print '(137,227)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1       


T = nc.variables['T'][p1:p2,29,138,227]
t = T[:]-273.15
print '(138,227)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,136,228]
t = T[:]-273.15
print '(136,228)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1


T = nc.variables['T'][p1:p2,29,137,228]
t = T[:]-273.15
print '(137,228)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1      


T = nc.variables['T'][p1:p2,29,138,228]
t = T[:]-273.15
print '(138,228)'
i = 1
for item in t:
    if (i-1)%4==0:
        if item>=31.7:
            print item
            print i
    i = i + 1