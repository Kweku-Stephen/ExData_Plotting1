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


#Line plot
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
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3")
)

#Saving to Graphics device
dev.copy(
       png,
       filename = "plot3.png",
       width = 480,
       height = 480
)

dev.off()




