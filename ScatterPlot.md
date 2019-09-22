Scatter plot is the basic plot of all visualizations. Usually scatter plot can provide a overall basic understanding of the data. 
Scatter plot can be build from the basic x-y plot to more advanced scatter plots matrix, scatter plot density, and 3D plots.

Use the built in dataset mtcars to create scatter plots below:
- mpg	Miles/(US) gallon
- cyl	Number of cylinders
- disp	Displacement (cu.in.)
- hp	Gross horsepower
- drat	Rear axle ratio
- wt	Weight (1000 lbs)
- qsec	1/4 mile time
- vs	Engine (0 = V-shaped, 1 = straight)
- am	Transmission (0 = automatic, 1 = manual)
- gear	Number of forward gears
- carb	Number of carburetors

### Basic x-y plot
```R
attach(mtcars)
plot(wt,mpg,main = "x-y scatter plot", xlab = "Car Weight",pch = 16,col="orange")
abline(lm(mpg~wt),col="blue4",lty=1, lwd=2)
lines(lowess(wt,mpg),col = "salmon",lwd=1,lty = 2)
```
[lowess() function adds a smoothed line.](https://www.rdocumentation.org/packages/gplots/versions/3.0.1.1/topics/lowess)

<img src="https://github.com/ruoxinli94/Stat/blob/master/image/xy-scatter.png" alt="X-Y Scatter Plot" width=450 height=350>

### Scatter plot matrixs
- pairs() function, built in function
```R
pairs(~mpg+disp+drat+wt,data=mtcars,main = 'Basic Scatter Plot Matrix',lower.panel = NULL)
```
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/ScatterMatrixPairs.png" alt = "ScatterMatrixPairs" width = 450, height = 350>
In the scatter plot matrix, any pair of the variables seems correlated with each other. Chech the correlation, the lowest correlation is about 0.68.
```R
cor(mtcars[c("mpg","wt","disp","drat")])
```

##### We can add linear and loess fit lines to any of the plot in the matrix. 

- [scatterplotMatrix() in car package](https://www.rdocumentation.org/packages/car/versions/2.1-4/topics/scatterplotMatrix)
```R
library(car)
library(RColorBrewer)
my_colors <- brewer.pal(nlevels(as.factor(mtcars$cyl)), "Dark2")
scatterplotMatrix(~mpg+disp+drat+wt|cyl, data=mtcars, col = my_colors, spread = FALSE, 
                  diagonal=list(method ="histogram", breaks="FD"),
                  pch=c(1,2,3),main = 'Scatter Plot Matrix using Car package')
```
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/ScatterPlotMatrixinCar.png" alt = "ScatterPlotMatrixinCar" width =450, height=350>

- [cpairs() in gclus package](https://www.rdocumentation.org/packages/gclus/versions/1.3.2/topics/cpairs) <br/>
The variables can be ordered and colored by the correlation using the gclus package. 

```R
library(gclus)
data <- mtcars[c("mpg","wt","disp","drat")]
data.corr <- abs(cor(data))
mycolor <- dmat.color(data.corr)
myorder <- order.single(data.corr)
cpairs(data, myorder, panel.colors = mycolor, gap = 0.5, 
       main = "Variables ordered and colored by correlation")
```
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/cpaires_gclus.png" alt = "cpaires_gclus" width =450, height=350>

### High-density scatter plots
simulate the data and perform simple scatter plot
```R
set.seed(1234)
n<-10000
c1 <- matrix(rnorm(n,mean = 0,sd = .5),ncol = 2)
c2 <- matrix(rnorm(n, mean = 5, sd = 2), ncol = 2)
data <- as.data.frame(rbind(c1,c2))
names(data) <- c("x","y")
with(data,
     plot(x,y,pch=19,main="simple scatter plot with 10000 observations"))
```
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/SimpleSPwithLargeData.png" alt = "SimpleSPwithLargeData" width =450, height=350>

