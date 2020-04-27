# Heat Wave Analysis
#
#
## Extract data from WRF output files (nc files):
#### result_HW_A_D_AD_F.m (Heat wave amplitude_duration_annual duration_frequency)
#### result_UHI.m (Urban heat island intensity)
#
## Extract data from weather stations (nc files):
#### observation.m, observation2.m, missing_ratio.m
#
## Heat wave amplitudes:
### Annual 
#### result_HW_D3.m, result_HW_D4.m (WRF model Domains 3 and 4)
### Annual average
#### result_HW_MeanA.m, result_HW_MeanA2.m (WRF model Domains 3 and 4)
### Annual maximum
#### result_HW_MaxA.m, result_HW_MaxA2.m (WRF model Domains 3 and 4)
#
## Heat wave frequencies and durations:
### Annual average and standard deviation
#### result_HW_MeanStd_F_D.m
#
## First day of heat waves in a year:
#### FirstDayofHW.m
#
## Model validation 
### Compare simulations to observations
#### validation.m, Validation1.m, Validation_2.m
#
## Monthly statistics:
### Mean temperature
#### monthly_mean_temperature.m
### Mean heat index
#### monthly_mean_heat_index.m
#
## Daily statistics:
### Maximum and mean temperatures
#### dailyMaxMinT.m, dailyMaxT_max.m, dailyMaxT_mean.m, summer_daily_maxT.m, summer_daily_maxT_all.m
### Humidity
#### Humidity_analysis.m
#
## Heat wave mitigation:
#### sensitivity_analysis.m, sensitivity_analysis_less_hot_day.m, sensitivity_analysis_linear_relation.m
#### sensitivity_analysis_plot.m, sensitivity_analysis_plot_2.m (box plots)
#
## Failure probability of power supply:
### Electricity systems
#### *Components and a whole system failures*
#### electric_analysis.m,electric_system_analysis.m, electric_fail_test.m, failure_probability.m, getGlobalx.m, Dynamic_analysis.m
#### *Transmission line current-temperature relationship*
#### Line_current.m, Line_temperature.m, q_c1_method.m, q_c2_method.m, q_cn_method.m
