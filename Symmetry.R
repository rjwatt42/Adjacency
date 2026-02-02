
source('basicPlot.R')
source('../BrawPackDevelopment/R/showHTML.R')

initHTML(gsize=400,xlim=c(-1,1),ylim=c(-1,1))

# variables
background<-'#888'

nlines<-1400
lineRadius<-0.01
lineSize<-1
lineFill<-'#000'
lineLength<-0.01



rlineShow<-TRUE
nrlines<-200
rlineSize<-lineSize
rlineFill<-'#000'
rlineLength<-lineLength

# start plot
g<-nullPlot(background=background)

# symmetric lines
lineX<-lineY<-c()
for (i in 1:(nlines/2)) {
  while (1==1) {
    x<-runif(1,0+lineRadius,1)/2
    y<-runif(1,-1,1)/2
    if (!any(sqrt((x-lineX)^2+(y-lineY)^2)<lineRadius)) break
  }
  lineX<-c(lineX,x)
  lineY<-c(lineY,y)
}
for (i in 1:length(lineX)) {
  theta<-runif(1,0,180)/57.296
  g<-addG(g,dataPath(data.frame(x=lineX[i]+c(-1,1)*sin(theta)*lineSize*lineLength/2,
                                y=lineY[i]+c(-1,1)*cos(theta)*lineSize*lineLength/2),
                     linewidth=lineSize/2,colour=lineFill))
  g<-addG(g,dataPath(data.frame(x=-lineX[i]+c(-1,1)*sin(-theta)*lineSize*lineLength/2,
                                y=lineY[i]+c(-1,1)*cos(theta)*lineSize*lineLength/2),
                     linewidth=lineSize/2,colour=lineFill))
}

lineX<-c(lineX,lineX)
lineY<-c(lineY,lineY)

# random lines
if (rlineShow) {
rlineX<-rlineY<-c()
for (i in 1:nrlines) {
  while (1==1) {
    x<-runif(1,-1,1)/2
    y<-runif(1,-1,1)/2
    if (!any(sqrt((x-lineX)^2+(y-lineY)^2)<lineRadius)) break
  }
  lineX<-c(lineX,x)
  lineY<-c(lineY,y)
  rlineX<-c(rlineX,x)
  rlineY<-c(rlineY,y)
}
for (i in 1:length(rlineX)) {
  theta<-runif(1,0,180)/57.296
  g<-addG(g,dataPath(data.frame(x=rlineX[i]+c(-1,1)*sin(theta)*rlineSize*rlineLength/2,
                                y=rlineY[i]+c(-1,1)*cos(theta)*rlineSize*rlineLength/2),
                     linewidth=rlineSize/2,colour=rlineFill))
}
}


showHTML(g)


