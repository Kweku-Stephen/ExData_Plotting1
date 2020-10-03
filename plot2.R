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


#Line plot
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

#Saving to graohics device
dev.copy(
       png, 
       filename = "plot2.png",
       height = 480,
       width = 480
)

dev.off()



