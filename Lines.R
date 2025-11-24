
makeLines<-function(nlines=9,lineLength=0.2,lineWidth=1,lineCol='#000',
                    guideLines=TRUE,guideOffset=0.2,guideCol='#000',
                    rLines=TRUE,rlineLength=0.2,rlineWidth=1,rlineCol='#000',rlineOffset=0,rlineMargin=0.1,
                    background='#aaa',useHTML=FALSE,forceUpdate=FALSE
                    ) {
  
  limits<-c(-1,1)*1.2
  if (!exists('braw.env') || ia.null(braw.env$plotLimits)) {
  if (useHTML) initHTML(gsize=400,xlim=limits,ylim=limits)
  else initPlot(xlim=limits,ylim=limits)
  }
  
  # start plot
  g<-nullPlot(background=background)

  # regular grid
  linesX<-seq(-1,1,length.out=nlines)*0.8
  linesY<-c(-1,1)*lineLength/2
  for (i in 1:nlines) {
    g<-addG(g,dataLine(data.frame(x=linesX[i],y=linesY),linewidth=lineWidth/0.015, colour=lineCol))
  }
  
  # optional guide lines above and below
  if (guideLines) {
    for (i in 1:nlines) {
      g<-addG(g,dataLine(data.frame(x=linesX[i],y=linesY+lineLength+guideOffset),linewidth=lineWidth/0.015, colour=guideCol))
      g<-addG(g,dataLine(data.frame(x=linesX[i],y=linesY-lineLength-guideOffset),linewidth=lineWidth/0.015, colour=guideCol))
    }
  }
  
  # random additions
  if (rLines) {
    if (is.null(braw.env$rlines) || forceUpdate) {
      rlinesX<-linesX[1:(nlines-1)]+runif(nlines-1,rlineMargin,1-rlineMargin)*diff(linesX[1:2])
      rlinesY<-c(-1,1)*rlineLength/2-rlineOffset*lineLength
      braw.env$rlines<<-list(rlinesX=rlinesX,rlinesY=rlinesY)
    } else {
      rlinesX<-braw.env$rlines$rlinesX
      rlinesY<-braw.env$rlines$rlinesY
    }
  for (i in 1:(nlines-1)) {
    g<-addG(g,dataLine(data.frame(x=rlinesX[i],y=rlinesY),linewidth=rlineWidth/0.015, colour=rlineCol))
  }
  }
  
  return(g)
}

