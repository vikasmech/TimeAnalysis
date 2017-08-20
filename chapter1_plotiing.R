rm(list = ls())
library(astsa) # SEE THE FOOTNOTE

plot(jj, type="o", ylab="Quarterly Earnings per Share")

plot(globtemp, type="o", ylab="Global Temperature Deviations")

plot(speech)

library(TTR)
djia = getYahooData("^DJI", start=20060420, end=20160420, freq="daily")
library(xts)
djiar = diff(log(djia$Close))[-1] # approximate returns
plot(djiar, main="DJIA Returns", type="n")
lines(djiar)

par(mfrow = c(2,1)) # set up the graphics
plot(soi, ylab="", xlab="", main="Southern Oscillation Index")
plot(rec, ylab="", xlab="", main="Recruitment")

par(mfrow=c(2,1))
plot(EQ5, main="Earthquake")
plot(EXP6, main="Explosion")


w = rnorm(500,0,1) # 500 N(0,1) variates
v = stats::filter(w, sides=2, filter=rep(1/3,3)) # moving average
par(mfrow=c(2,1))
plot.ts(w, main="white noise")
plot.ts(v, ylim=c(-3,3), main="moving average")


dev.off()
w = rnorm(550,0,1) # 50 extra to avoid startup problems
x = stats::filter(w, filter=c(1,-.9), method="recursive")[-(1:50)] # remove first 50
plot.ts(x, main="autoregression")



