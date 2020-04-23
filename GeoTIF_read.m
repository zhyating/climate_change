infilename = 'C:\Users\Yating\Downloads\GeoSOS-FLUS V2.2\GeoSOS-FLUS V2.2\testdata\testdata\Aspect.tif';
[A,R] = geotiffread(infilename);
info = geotiffinfo(infilename);
