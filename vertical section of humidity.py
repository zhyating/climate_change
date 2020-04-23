import numpy as np
import matplotlib.pyplot as plt
from matplotlib.cm import get_cmap
from netCDF4 import Dataset

from wrf import to_np, getvar, CoordPair, vertcross

# Open the NetCDF file
filename = "H:/Output_scenarios/2100/arw/wrfout_d03_2099-07-23_23_00_00.nc"
ncfile = Dataset(filename, mode='r')
filename2 = "H:/Output_scenarios/2100/ref/wrfout_d03_2099-07-23_23_00_00.nc"
ncfile2 = Dataset(filename2, mode='r')


# Extract the model height and wind speed
z = getvar(ncfile, "z")[0:11]
tc1 =  getvar(ncfile, "rh")[0:11]
tc2 =  getvar(ncfile2, "rh")[0:11]
landmask = np.squeeze(ncfile.variables['LANDMASK'][:])
landuse = np.squeeze(ncfile.variables['LU_INDEX'][:])
tc = tc1 - tc2

#file1 = open("C:/Users/Yating/Desktop/output/output_gr100.txt","w")#write mode 
#for i in range(tc.shape[0]):
#    for j in range(tc.shape[1]):
#        for k in range(tc.shape[2]):
#             if landmask[j,k]!=0 and landuse[j,k]>21 and landuse[j,k]<26:
#               file1.write(np.array2string(tc[i,j,k])) 
#                 file1.write("\n")


#file1.close() 
  

# Create the start point and end point for the cross section
#start_point = CoordPair(lat=39, lon=-78.5)
#end_point = CoordPair(lat=39, lon=-75.7)
start_point = CoordPair(lat=39, lon=-77.5)
end_point = CoordPair(lat=39, lon=-76.5)


# Compute the vertical cross-section interpolation.  Also, include the
# lat/lon points along the cross-section.
wspd_cross = vertcross(tc, z, wrfin=ncfile, start_point=start_point,
                       end_point=end_point, latlon=True, meta=True)


# Create the figure
#fig = plt.figure(figsize=(7,6))
fig = plt.figure(figsize=(2,4))
ax = plt.axes()

# Make the contour plot
clevs = np.arange(-24,26,2)
wspd_contours = ax.contourf(to_np(wspd_cross), clevs, cmap=get_cmap("bwr"))
#wspd_contours = ax.contourf(to_np(wspd_cross), cmap=get_cmap("jet"))

# Add the color bar
plt.colorbar(wspd_contours, ax=ax, orientation="vertical")

# Set the x-ticks to use latitude and longitude labels.
coord_pairs = to_np(wspd_cross.coords["xy_loc"])
x_ticks = np.arange(coord_pairs.shape[0])
x_labels = [pair.latlon_str(fmt="{:.2f}, {:.2f}")
            for pair in to_np(coord_pairs)]
ax.set_xticks(x_ticks[::20])
ax.set_xticklabels(x_labels[::20], fontsize=14)

# Set the y-ticks to be height.
vert_vals = to_np(wspd_cross.coords["vertical"])
v_ticks = np.arange(vert_vals.shape[0])
ax.set_yticks(v_ticks[::10])
ax.set_yticklabels(np.around(vert_vals[::10]), fontsize=14)

# Set the x-axis and  y-axis labels
ax.set_xlabel("Latitude, Longitude", fontsize=14)
ax.set_ylabel("Height (m)", fontsize=14)

plt.title("Vertical Cross Section of humidity (%)", {"fontsize" : 14})

plt.show()