library('gplots')

myfigure <- function(mwidth = 0.1, mxlim=c(0,1), mylim = max(hh)*2,mcex.names = 0.8,mcol=c("grey42", "grey82"),mhh=hh,mci.l=ci.l,mci.u=ci.u){
return(barplot2(mhh, beside = TRUE, col = mcol, width = 0.1, xlim=c(0,1), ylim = c(0, mylim),cex.names = 0.8, legend = rownames(mhh), plot.ci = TRUE, ci.l = mci.l, ci.u = mci.u))
}

significance_lines <- function(a,b,h,g,s,t){
lines(c(mp[a],mp[a]),c(ci.u[a]+g,max(c(ci.u[a],ci.u[b])+h)))
lines(c(mp[b],mp[b]),c(ci.u[b]+g,max(c(ci.u[a],ci.u[b])+h)))
lines(c(mp[a],mp[b]),c(max(c(ci.u[a],ci.u[b]))+h,max(c(ci.u[a],ci.u[b])+h)))
x.text<-mean(c(mp[a],mp[b]))
y.text<-max(c(ci.u[a],ci.u[b]))+h+t
text(s,x=x.text,y=y.text)
}

hh <- as.matrix(read.table('avg.csv',sep=",",row.names=1,header=T))
h.sd <- as.matrix(read.table('sd.csv',sep=","))
#hh <- matrix(c(1,1,1,0.806870697,0.884192781,0.329875986), ncol=3, byrow=T)
#dimnames(hh) = list(c('Control','KD Ube2s'),c('48h','72h','96h'))
#h.sd=matrix(c(0.341201016,0.031474443,0.036164633,0.038945923,0.017418863,0.030724584), ncol=3, byrow=T)
ci.l <- hh - h.sd
ci.u <- hh + h.sd

mp <- myfigure()
significance_lines(3,4,0.6,0.02,'**',0.03)
