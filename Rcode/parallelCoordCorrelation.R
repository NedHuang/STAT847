# Using local so as to not make changes to variables
# outside this file
# 

local({
  # Example: Parallel Coordinates and  Correlated data
  rCorData <- function(n = 30, r = 0.9) {
    x <- rnorm(n)
    y <- rnorm(n)
    y <- r*x + sqrt(1- r^2) * y
    data.frame(x=x, y=y)
  }
  
  # correlation 0.9
  p9 <-  l_plot(rCorData(n=100, r=0.9), 
                title = "correlation 0.9", 
                linkingGroup = "plus .9"
                )
  pcplot(p9)
  
  # correlation 0.5
  p5 <-  l_plot(rCorData(n=100, r=0.5), 
                title = "correlation 0.5", linkingGroup = "plus .5")
  pcplot(p5)
  
  p0 <-  l_plot(rCorData(n=100, r=0), title = "correlation 0", linkingGroup = "zero")
  pcplot(p0)
  
  # correlation -0.5
  pm5 <-  l_plot(rCorData(n=100, r=-0.5), title = "correlation -0.5", linkingGroup = "minus .5")
  pcplot(pm5)
  
  # correlation -0.9
  pm9 <-  l_plot(rCorData(n=100, r=-0.9), title = "correlation -0.9", linkingGroup = "minus .9")
  pcplot(pm9)
  
  })
