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
There are four basic ways to plot scatter matrixs.
- pairs() function, built in function
```R
pairs(~mpg+disp+drat+wt,data=mtcars,main = 'Basic Scatter Plot Matrix',lower.panel = NULL)
```
<img src="https://github.com/ruoxinli94/Stat/blob/master/image/ScatterMatrixPairs.png" alt = "ScatterMatrixPairs" width = 450, height = 350>
In the scatter plot matrix, any pair of the variables seems correlated with each other. 

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



