#source("http://bioconductor.org/biocLite.R")
#biocLite("ROCR")

library(ROCR)

x=read.table("predict.th")
pred <- prediction(x[,1],x[,2])	#第一列：分值，第二列：T/F值
perf <- performance(pred,"tpr","fpr")
performance(pred,"spec","sens")
#performance(pred,"auc")
#performance(pred,"acc")

par(c(3,2),bg="white",mai=c(1.5,1.5,1,1))
plot(perf,main="Sigma24",colorize=TRUE,lwd=5,colorkey.relwidth=0,xaxis.cex.axis=1.2,yaxis.cex.axis=1.2,yaxis.las=1,cex.main=2.5)
segments(0,0,1,1,lty=2)
#text(0.6,0.5,"AUC=0.83",cex=2)