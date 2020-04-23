# -*- coding: utf-8 -*-

import os
import matplotlib as mpl
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import numpy as np
from pyhdf.SD import SD, SDC

# Open file.
FILE_NAME = 'AIRS.2002.08.01.L3.RetStd_H031.v4.0.21.0.G06104133732.hdf'
hdf = SD(FILE_NAME, SDC.READ)

# List available SDS datasets.
print hdf.datasets()

# Read dataset.
DATAFIELD_NAME='RelHumid_A'
data3D = hdf.select(DATAFIELD_NAME)
data = data3D[11,:,:]

# Read geolocation dataset.
lat = hdf.select('Latitude')
latitude = lat[:,:]
lon = hdf.select('Longitude')
longitude = lon[:,:]

m = Basemap(projection='cyl', resolution='l', llcrnrlat=-90, urcrnrlat = 90, llcrnrlon=-180, urcrnrlon = 180)
m.drawcoastlines(linewidth=0.5)
m.drawparallels(np.arange(-90., 120., 30.), labels=[1, 0, 0, 0])
m.drawmeridians(np.arange(-180., 181., 45.), labels=[0, 0, 0, 1])
x, y = m(longitude, latitude)
m.pcolormesh(x, y, data)