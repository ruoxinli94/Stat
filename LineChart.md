### basic plot types
```R
opar <-par(no.readonly = TRUE)
par(mfrow=c(1,2))
t1<- subset(Orange,Tree==1)
attach(t1)
plot(age,circumference,xlab="Age",ylab="circumference",main="Tree1 growth", type="b")
detach(t1)
par(opar)
```
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/typeofL.png">

### correlograms
plot the coorelation matrics.
```R
library(corrgram)
corrgram(mtcars,order=TRUE,lower.panel=panel.shade, upper.panel=panel.pie,
        text.panel=panel.txt,main="Correlogram of mtcars")
```
* Off diagonal:
  * panel.pie
  * panel.shade
  * panel.ellipse
  * panel.pts
* main diagonal:
  * panel.minmax
  * panel.txt
  
### Use Moisac plot for categorical varaibles in contigency table 
```R
mosaic(Titanic,shade = TRUE,legend=TRUE)
```
Shade color based on [pearson residuals](https://v8doc.sas.com/sashtml/insight/chap39/sect56.htm)
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/moisacplots.png">
