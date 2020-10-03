#####################################################################################################
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

#Histogram
hist(
       HPC$Global_active_power,
       col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power (Kilowatts)"
)

#Saving to graphics device
dev.copy(
       png, 
       filename = "plot1.png",
       height = 480,
       width = 480
)
dev.off()       
       


