from netCDF4 import Dataset as NetCDFFile 
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.basemap import Basemap

nc = NetCDFFile('1990010100Z-2005123118Z.nc')
lat = nc.variables['lat'][136:139]
longitude = nc.variables['lon'][225:229]
lon = longitude[:]-360
time = nc.variables['time'][9471]
level = nc.variables['lev'][29]
T = nc.variables['T'][9473,29,136:139,225:229] 
t2 = T[:]-273.15 # 2 meter temperature

map = Basemap(projection='merc',llcrnrlon=-77.8,llcrnrlat=38.3,urcrnrlon=-76.4,urcrnrlat=39.5,resolution='i')

map.drawcoastlines()
map.drawstates()
map.drawcountries()
map.drawlsmask(land_color='Linen', ocean_color='#CCFFFF') # can use HTML names or codes for colors
map.drawcounties() # you can even add counties (and other shapefiles!)

parallels = np.arange(38.3,39.5,0.2) # make latitude lines ever 0.5 degrees from 30N to 50N
meridians = np.arange(-77.8,-76.4,0.2) # make longitude lines every 0.5 degrees from 95W to 70W
map.drawparallels(parallels,labels=[1,0,0,0],fontsize=10)
map.drawmeridians(meridians,labels=[0,0,0,1],fontsize=10)


lons,lats= np.meshgrid(lon,lat)
x,y = map(lons,lats)

temp = map.contourf(x,y,t2[:,:])
cb = map.colorbar(temp,"right", size="5%", pad="2%")
plt.title('2m Temperature')
cb.set_label('Temperature (degree C)')

plt.show()