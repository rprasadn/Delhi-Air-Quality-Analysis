# Read the csv file
Delhi = read.csv('Datasets/Delhi_Air_Quality_24hr_avg_Anand_Vihar_2015_16.csv')

# Remove unwanted parameters
Delhi = Delhi[,c("PM10", "PM2.5", "AmbientTemperature", 
                 "WindSpeed", "Day", "Month")]

# Remove rows containing NAs
Delhi <- na.omit(Delhi)

# Let's rename the column parameters 
pm10 <- Delhi$PM10
pm2.5 <- Delhi$PM2.5
mon <- Delhi$Month
temp = Delhi$AmbientTemperature
ws = Delhi$WindSpeed

# Num of rows
n = length(pm10)

# Extract no of days for each month
num_days_mon = vector('double', 12)
for (i in seq(1:12))
{
    num_days_mon[i] = length(mon[mon==i])
}
    
# Reorder so it is chronological
num_days_mon = num_days_mon[c(4:12, 1)]

# Plot PM 10 and PM 2.5 value for the entire year
# bar_label = vector('character', n)
# bar_label[1:n] = ' '
# num_days_cumsum = cumsum(num_days_mon)
# num_days_cumsum = num_days_cumsum + 1
# num_days_ind = c(1, num_days_cumsum[-10])
# months = c('Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep','Oct', 'Nov', 'Dec','Jan')
# bar_label[num_days_ind] = months

# default plot margin in R
mar.default = c(5,4,4,2) + 0.1        
mar.mod = mar.default + c(0,.5,0,0)  # slightly increase it

jpeg(filename='pm2.5_apr15_jan16.jpg', width=1280,height=720)
par(mar=mar.mod)
barplot(pm10,col='darkorchid', border='darkorchid4', 
        xlab='April 2015  to  Jan 2016', ylab='PM 10',
        cex.lab=3, cex.axis=3)
dev.off()

jpeg(filename='pm2.5_apr15_jan16.jpg', width=1280,height=720)
par(mar=mar.mod)
barplot(pm2.5,col='firebrick', border='firebrick3', 
        xlab='April 2015  to  Jan 2016', ylab='PM 2.5',
        cex.lab=3, cex.axis=3)
dev.off()

# Plot Temp and Wind speed for the entire year
barplot(temp, col='indianred1', border='indianred4',
        xlab='April 2015  to  Jan 2016',ylab= 'Ambient Temperature (deg C)')

mar.mod = mar.mod + c(0,.5,0,0)
jpeg(filename='ws_apr15_jan16.jpg', width=1280,height=720)
par(mar=mar.mod)
barplot(ws, col='royalblue', border='royalblue4',
        xlab='April 2015  to  Jan 2016',ylab='Wind Speed (m/s)', 
        cex.names=2)
dev.off()




# Scatter plot of Temp vs PM 10 & PM 2.5
mar.mod = mar.default + c(0,1.2,0,0)  # slightly increase it
jpeg(filename='temp_vs_pm10.jpg', width=1280,height=720)
par(mar=mar.mod)
plot(temp, pm10, col='blue',xlab='Ambient Temperature (deg C)', 
     ylab=expression(paste('PM 10 (', mu, 'g/', m^3, ')')),
     cex=3,pch=20,cex.lab=2,cex.axis=2)
dev.off()

jpeg(filename='temp_vs_pm2.5.jpg', width=1280,height=720)
par(mar=mar.mod)
plot(temp, pm2.5, col='red',xlab='Ambient Temperature (deg C)', 
     ylab=expression(paste('PM 2.5 (', mu, 'g/', m^3, ')')),
     cex=3,pch=20,cex.lab=2,cex.axis=2)
dev.off()

jpeg(filename='ws_vs_pm10.jpg', width=1280,height=720)
par(mar=mar.mod)
plot(ws, pm10, col='cadetblue4',xlab='Ambient Temperature (deg C)', 
     ylab=expression(paste('PM 10 (', mu, 'g/', m^3, ')')),
     cex=3,pch=20,cex.lab=2,cex.axis=2)
dev.off()

jpeg(filename='ws_vs_pm2.5.jpg', width=1280,height=720)
par(mar=mar.mod)
plot(ws, pm2.5, col='darkmagenta',xlab='Ambient Temperature (deg C)', 
     ylab=expression(paste('PM 2.5 (', mu, 'g/', m^3, ')')),
     cex=3,pch=20,cex.lab=2,cex.axis=2)
dev.off()

# bar_labels = vector('character', n)
# for (i in seq(9))
# {
#     low = num_days_ind[i]
#     high = num_days_ind[i+1] - 1
#     bar_labels[low:high]  = months[i]
# }




