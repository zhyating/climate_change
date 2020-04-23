from netCDF4 import Dataset
import csv
import numpy as np

def csv_dict_writer(fieldnames, data):
    """
    Writes a CSV file using DictWriter
    """
    with open('CMIP5 daily.csv', "wb") as out_file:      
        writer = csv.DictWriter(out_file, delimiter=',', fieldnames=fieldnames)
        writer.writeheader()
        for row in data:
            writer.writerow(row)


if __name__ == "__main__":
     dataset1 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_IPSL-CM5A-LR_historical_r1i1p1_19500101-19591231.nc')
     y1 = dataset1['tasmax'][:,15,49]
     dataset1 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_IPSL-CM5A-LR_historical_r1i1p1_19600101-19691231.nc')
     y = dataset1['tasmax'][:,15,49]
     y1 = np.append(y1,y)    
     dataset1 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_IPSL-CM5A-LR_historical_r1i1p1_19700101-19791231.nc')
     y = dataset1['tasmax'][:,15,49]
     y1 = np.append(y1,y)     
     dataset1 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_IPSL-CM5A-LR_historical_r1i1p1_19800101-19891231.nc')
     y = dataset1['tasmax'][:,15,49]
     y1 = np.append(y1,y)
     dataset1 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_IPSL-CM5A-LR_historical_r1i1p1_19900101-19991231.nc')
     y = dataset1['tasmax'][:,15,49]
     y1 = np.append(y1,y)
     dataset1 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_IPSL-CM5A-LR_historical_r1i1p1_20000101-20051231.nc')
     y = dataset1['tasmax'][:,15,49]
     y1 = np.append(y1,y)
    
    
    
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MIROC5_historical_r1i1p1_19500101-19591231.nc')
     y2 = dataset2['tasmax'][:,15,49]
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MIROC5_historical_r1i1p1_19600101-19691231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)     
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MIROC5_historical_r1i1p1_19700101-19791231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)     
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MIROC5_historical_r1i1p1_19800101-19891231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MIROC5_historical_r1i1p1_19900101-19991231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)     
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MIROC5_historical_r1i1p1_20000101-20051231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)
     """     
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_GFDL-CM3_historical_r1i1p1_19800101-19841231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)     
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_GFDL-CM3_historical_r1i1p1_19850101-19891231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_GFDL-CM3_historical_r1i1p1_19900101-19941231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)     
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_GFDL-CM3_historical_r1i1p1_19950101-19991231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y) 
     dataset2 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_GFDL-CM3_historical_r1i1p1_20000101-20051231.nc')
     y = dataset2['tasmax'][:,15,49]
     y2 = np.append(y2,y)
     """


     dataset3 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MPI-ESM-LR_historical_r1i1p1_19500101-19591231.nc')
     y3 = dataset3['tasmax'][:,15,49]
     dataset3 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MPI-ESM-LR_historical_r1i1p1_19600101-19691231.nc')
     y = dataset3['tasmax'][:,15,49]
     y3 = np.append(y3,y)     
     dataset3 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MPI-ESM-LR_historical_r1i1p1_19700101-19791231.nc')
     y = dataset3['tasmax'][:,15,49]
     y3 = np.append(y3,y)
     dataset3 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MPI-ESM-LR_historical_r1i1p1_19800101-19891231.nc')
     y = dataset3['tasmax'][:,15,49]
     y3 = np.append(y3,y)     
     dataset3 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MPI-ESM-LR_historical_r1i1p1_19900101-19991231.nc')
     y = dataset3['tasmax'][:,15,49]
     y3 = np.append(y3,y)
     dataset3 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MPI-ESM-LR_historical_r1i1p1_20000101-20051231.nc')
     y = dataset3['tasmax'][:,15,49]
     y3 = np.append(y3,y) 
     
     
     dataset4 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MRI-CGCM3_historical_r1i1p1_19500101-19591231.nc')
     y4 = dataset4['tasmax'][:,15,49]
     dataset4 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MRI-CGCM3_historical_r1i1p1_19600101-19691231.nc')
     y = dataset4['tasmax'][:,15,49]
     y4 = np.append(y4,y)     
     dataset4 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MRI-CGCM3_historical_r1i1p1_19700101-19791231.nc')
     y = dataset4['tasmax'][:,15,49]
     y4 = np.append(y4,y)
     dataset4 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MRI-CGCM3_historical_r1i1p1_19800101-19891231.nc')
     y = dataset4['tasmax'][:,15,49]
     y4 = np.append(y4,y) 
     dataset4 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MRI-CGCM3_historical_r1i1p1_19900101-19991231.nc')
     y = dataset4['tasmax'][:,15,49]
     y4 = np.append(y4,y)
     dataset4 = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_MRI-CGCM3_historical_r1i1p1_20000101-20051231.nc')
     y = dataset4['tasmax'][:,15,49]
     y4 = np.append(y4,y)
         

     
     data = np.empty([len(y1),4])
     for i in range(len(y1)):
         data[i,0] =  y1[i]
         data[i,1] =  y2[i]
         if i<len(y3)-1:
            data[i,2] = y3[i]
         data[i,3] =  y4[i]
     
     
     my_list = []
     fieldnames = ['bcc','CanESM2','CCSM4','CGCM3']
     for values in data[0:]:
        inner_dict = dict(zip(fieldnames, values))
        my_list.append(inner_dict)

     csv_dict_writer(fieldnames, my_list)


    

