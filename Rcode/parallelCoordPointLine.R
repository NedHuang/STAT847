require(loon)

pcplot <- function(p) {
  coords <- function(dir='x') {
    if(dir == 'x') {
      xTemp <- p['xTemp']
      if (length(xTemp) == 0)
        p['x']
      else
        xTemp
    } else {
      yTemp <- p['yTemp']
      if (length(yTemp) == 0)
        p['y']
      else
        yTemp
    }
  }
  if (p['linkingGroup'] == 'none') {
    l_configure(p, linkingGroup='pcplot', sync='pull')
  }
  if (p['title'] != "") {
    pc <- l_serialaxes(data=data.frame(x=p['x'], y=p['y']), title = p['title'],
                       linkingGroup=p['linkingGroup'], axesLayout='parallel')
  } else {
    pc <- l_serialaxes(data=data.frame(x=p['x'], y=p['y']),
                       linkingGroup=p['linkingGroup'], axesLayout='parallel')
  }
  updateLines <- function() {
    l_configure(pc, data=data.frame(xTemp=coords('x'), yTemp=coords('y')))
  }
  
  l_redraw(pc)
  l_bind_state(p, c("active", 'xTemp', 'yTemp'), updateLines)
}

# Using local so as to not make changes to variables
# outside this file
local({
  
  # example 1
  n <- 30
  x <- seq(1,100, length.out = n)
  y1 <- 10 + 5 * x
  y2 <- 500 - 5 * x
  y3 <- (x - 50)^2 / 5
  y4 <- 200 + 5 * x
  y5 <- 500 - 2 * x
  y6 <- 500 -(x - 50)^2 / 5
  y7 <- 250 - 5 * x
  y8 <- 200 + 2 * x
  y9 <- 200 + 1 * x
  y10 <- 200 +  x/x
  m <- 10
  xlow <- runif(m, 2,20)
  xhigh<- runif(n-m, 90,100)
  ylow <- runif(m, -100, 0)
  yhigh<- runif(n-m, 300,400)
  xvals <- c(rep(x,m), rep(50, n), xlow, xhigh)
  yvals <- c(y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, x*5, ylow, yhigh)
  numGroups <- 12
  groups <-  rep(1:numGroups, each=n)
  # cols <- rep(c("black", "red", "orange", "yellow", "green", "blue", "violet",
  #               "darkgrey", "firebrick", "gold", "darkolivegreen", "darkorange"), each=n)
  # cols <- rep(rainbow(numGroups), each=n)
  data <- data.frame(x = xvals, y = yvals, group = groups)
  p <- l_plot(data[,"x"], data[,"y"], 
              xlabel = "x", ylabel = "y",
              color=groups, linkingGroup = "Parallel coords")
  pcplot(p)
})

