### NOTE: Please move the file ETH-USD.csv to your desktop to get the code to work
### This final project aims to show the price changes with the crypto currency Etherum, 
### as well as other factors such as volume, percent changes, and how these relate to one another

library(pacman)
library(datasets)
pacman::p_load(pacman,dplyr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)
ethereum <- import("~/Desktop/ETH-USD.csv")

### Loading packages for R Studio as well as the data set we will be using for the graphs

colnames(ethereum) <- tolower(colnames(ethereum))
ethereum <- ethereum[c((nrow(ethereum)-500) :nrow(ethereum)), ]
ethereum$date <- as.Date(ethereum$date)
ethereum <- ethereum[order(ethereum$date),]
mn <- min(ethereum$low)
mx <- max(ethereum$high)
xs <- c(1:nrow(ethereum))
### Setting up dataset for candlestick graph


color_list <- ifelse(ethereum$close >= ethereum$open, "green", "red")
### Candlestick colors for bullish and bearish candles


png("Desktop/Ethereum.png", res=500, height=5000, width=9000)
### Saving graph as a png file

plot(ethereum$high, main="Ethereum", xaxt="n", xlab="", ylab="Price", ylim=c(mn,mx), type="n")
### First graph which will label the bullish candles for ethereum

par(new=T)
plot(ethereum$low,main="",axes=F,xlab="",ylab="",ylim=c(mn,mx),type="n")
### New plot to overlap on first one for bearish candles


segments(x0=xs, y0=ethereum$open,x1=xs,y1=ethereum$close,col=color_list,lwd=4)
segments(x0=xs, y0=ethereum$low,x1=xs,y1=ethereum$high,col=color_list,lwd=1)
### Manually drawing the candlesticks for each plot

axis(1,at=xs,labels=ethereum$date,las=2)

dev.off()

### Run the code to get the information for the last 500 entries for ETH












