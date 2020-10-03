######################################################################################################

require(
       magrittr
)

#Reading in data
read.table(
       "household_power_consumption.txt", 
       header = T,
       sep = ";"
) -> HPC

#Converting Date-like column to Date class
HPC[,1] <- as.Date(
       HPC[,1],
       format = "%d/%m/%Y"
)

#Subsetting Date
HPC <- HPC[HPC$Date >= "2007-02-01" & HPC$Date <= "2007-02-02", ]

#Converting ff columns to numeric class
apply(
       HPC[ ,3:ncol(HPC)],
       2, 
       as.numeric
) -> HPC[, 3:ncol(HPC)]


##################################################################################################


#Creating matrix of grid
par(
       mfrow = c(2,2), 
       mar = c(4,4,2,1),
       oma = c(0,0,2,0)
)

#Univariate Line plot grid[1,1] Global Active
with(
       HPC,
       plot(
              1:nrow(HPC),
              HPC$Global_active_power,
              type = "l",
              lwd = 1.5,
              xaxt = "n",
              xlab = "",
              ylab = "Global Active Power (Kilowatts)"
       )
)
#Formatting x-axis lables
axis(
       1, 
       at = c(
              min(1:nrow(HPC)),
              median(1:nrow(HPC)),
              max(1:nrow(HPC))
       ),
       labels = c(
              "Thu",
              "Fri",
              "Sat"
       )
)

#Univariate Line plot grid[1,2] Voltage
with(
       HPC,
       plot(
              1:nrow(HPC),
              HPC$Voltage,
              type = "l",
              lwd = 1.5,
              xaxt = "n",
              xlab = "datetime",
              ylab = "Voltage"
       )
)
#Formatting x-axis lables
axis(
       1, 
       at = c(
              min(1:nrow(HPC)),
              median(1:nrow(HPC)),
              max(1:nrow(HPC))
       ),
       labels = c(
              "Thu",
              "Fri",
              "Sat"
       )
)


#Multivariate Line Plot grid[2,1] sub metering 1,2,3
with(
       HPC,
       plot(
              1:nrow(HPC),
              HPC$Sub_metering_1,
              type = "n",
              xaxt = "n",
              xlab = "",
              ylab = "Energy sub metering"
       )
)
#Sub Metering 1
lines(
       HPC$Sub_metering_1, 
       type = "l"
       
)
#Sub Metering 2
lines(
       HPC$Sub_metering_2,
       type = "l",
       col = "red"
)
#Sub Metering 3
lines(
       HPC$Sub_metering_3,
       type = "l",
       col = "blue"
)
#Formatting x-axis labels
axis(
       1, 
       at = c(
              min(1:nrow(HPC)),
              median(1:nrow(HPC)),
              max(1:nrow(HPC))
       ),
       labels = c(
              "Thu",
              "Fri",
              "Sat"
       )
)
#Legend
legend(
       "topright", 
       lty = 1,
       col = c("black","red","blue"),
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       bty = "n"
)



#
with(
       HPC,
       plot(
              1:nrow(HPC),
              HPC$Global_reactive_power,
              type = "l",
              lwd = 1.5,
              xaxt = "n",
              xlab = "datetime",
              ylab = "Global_reactor_Power"
       )
)
#Formatting x-axis lables
axis(
       1, 
       at = c(
              min(1:nrow(HPC)),
              median(1:nrow(HPC)),
              max(1:nrow(HPC))
       ),
       labels = c(
              "Thu",
              "Fri",
              "Sat"
       )
)

dev.copy(
       png,
       filename = "plot4.png",
       width = 480,
       height = 480
)

dev.copy()
