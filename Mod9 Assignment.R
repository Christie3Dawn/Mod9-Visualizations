

# 1986 Challenger disaster and O-rings

# Load data and save to variablename "orings"
orings <- read.table("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/orings.csv",
                     header = TRUE, sep = ",")

# Remove first column which appear to be row names(numbers)
orings <- orings[ ,-1]


# Base R Plot
plot(orings$damaged, orings$temperature,
     cex = 3, 
     pch = 18,
     col = alpha(ifelse(orings$damaged == 0, "dark green",
                        ifelse(orings$damaged == 1, "blue",
                               "red")), 0.7),
     main = "1986 Challenger Disaster O-Ring Test\nBase R",
     xlab = "Number of Rings Damaged",
     ylab = "Temperature")



# Lattice Plot
library(lattice)

latticePlot <- xyplot(temperature ~ damaged, data = orings, cex = 1.5,
                      group = damaged,
                      auto.key = TRUE,
                      main = "1986 Challenger Disaster O-Ring Test\nwith Lattice")

latticePlot



# ggPlot
library(ggplot2)

OringsggPlot <- ggplot(orings, aes(x = damaged, y = temperature, color = factor(damaged))) +
  geom_point(aes(shape = factor(damaged)), size = 4, alpha = .85) +
  scale_color_hue(direction = -1) +
  ggtitle("1986 Challenger Disaster O-Ring Test\nwith ggPlot2")

OringsggPlot