# -*- coding: utf-8 -*-
"""
Created on Wed Mar 28 16:17:57 2018

@author: Yating
"""

import os
import matplotlib as mpl
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import numpy as np
from pyhdf.SD import SD, SDC

# Open file.
FILE_NAME = 'C:\Users\Yating\Downloads\New folder\MOD11A1.A2003202.h10v05.006.2015201152642.hdf'
hdf = SD(FILE_NAME, SDC.READ)

# List available SDS datasets.
print hdf.datasets()

# Read dataset.
DATAFIELD_NAME='LST_Night_1km'
data3D = hdf.select(DATAFIELD_NAME)
data = data3D.get()
data = data * 0.02 - 273.15 

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