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

# Initialize average value vectors
pm10_avg = vector(mode='double', length = 12)
pm2.5_avg = vector(mode='double', length = 12)
temp_avg = vector(mode='double', length = 12)
ws_avg = vector(mode='double', length = 12)

# Calculate avg values for each month
for (i in c(1, 4:12))
{
    pm10_avg[i] = mean(pm10[mon==i])
    pm2.5_avg[i] = mean(pm2.5[mon==i])
    temp_avg[i] = mean(temp[mon==i])
    ws_avg[i] = mean(ws[mon==i])
}

# Reorder so it is chronological
pm10_avg = pm10_avg[c(4:12, 1)]
pm2.5_avg = pm2.5_avg[c(4:12, 1)]
temp_avg = temp_avg[c(4:12, 1)]
ws_avg = ws_avg[c(4:12, 1)]

# plot average values for each month
avg_vals = rbind(pm10_avg, pm2.5_avg)
months = c('Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep','Oct', 'Nov', 'Dec','Jan')
colours <- c('darkorange1', 'darkorchid')
barplot(avg_vals, beside=TRUE, col=colours, names.arg = months)
legend("topleft", c('PM 10', 'PM 2.5'), cex=1.3, bty="n", fill=colours)


# Plot boxplots of pm10 and pm2.5 for each month
mar.default = c(5,4,4,2) + 0.1    # default plot margin in R
mar.mod = mar.default + c(0,.5,0,0)
par(mar=mar.mod)
boxplot(pm10[mon==4], pm10[mon==5], pm10[mon==6], pm10[mon==7], pm10[mon==8], 
        pm10[mon==9], pm10[mon==10], pm10[mon==11], pm10[mon==12], 
        pm10[mon==1], names = months, border = 'darkorchid1', 
        xlab = 'Month, April 2015 to January 2016', 
        ylab= expression(paste('PM 10 (', mu, 'g/', m^3, ')')))


