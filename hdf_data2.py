# -*- coding: utf-8 -*-
"""
Created on Wed Mar 28 16:37:44 2018

@author: Yating
"""

 
from pyhdf import SD
 
# HDF file and SDS names
FILE_NAME = "C:\Users\Yating\Downloads\New folder\MOD11A1.A2003202.h10v05.006.2015201152642.hdf"
SDS_NAME  = "Day_view_angl"
 
# open the hdf file
hdf = SD.SD(FILE_NAME)
 
# select and read the sds data
sds = hdf.select(SDS_NAME)
data = sds.get()
data = data * 0.02 - 273.15 

# get dataset dimensions
nrows, ncols = data.shape  # data.shape: (3712, 3712) in the SEVIRI AER-OC example, 203
print data.shape # data.shape: (3712, 3712) in the SEVIRI AER-OC example, (203, 135)
 
i=200 # row index
j=125 # col index
print data
 
# Terminate access to the data set
sds.endaccess()
 
# Terminate access to the SD interface and close the file
hdf.end()