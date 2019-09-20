Scatter plot is the basic plot of all visualizations. Usually scatter plot can provide a overall basic understanding of the data. 
Scatter plot can be build from the basic x-y plot to more advanced scatter plots matrix, scatter plot density, and 3D plots.
### Basic x-y plot
```R
attach(mtcars)
plot(wt,mpg,main = "x-y scatter plot", xlab = "Car Weight",pch = 16,col="orange")
abline(lm(mpg~wt),col="blue4",lty=1, lwd=2)
lines(lowess(wt,mpg),col = "salmon",lwd=1,lty = 2)
```
[lowess() function adds a smoothed line.](https://www.rdocumentation.org/packages/gplots/versions/3.0.1.1/topics/lowess)

![image](https://github.com/ruoxinli94/Stat/blob/master/image/xy-scatter.png)
