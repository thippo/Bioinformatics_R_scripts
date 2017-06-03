library('gplots')

myfigure <- function(mwidth = 0.1, mxlim=c(0,1), mylim = max(hh)*2,mcex.names = 0.8,mcol=c("grey82"),mhh=hh,mci.l=ci.l,mci.u=ci.u){
return(barplot2(mhh, col = mcol, width = 0.1, xlim=c(0,1), ylim = c(0, mylim),cex.names = 0.8, plot.ci = TRUE, ci.l = mci.l, ci.u = mci.u))
}

significance_lines <- function(a,b,h,g,s,t){
lines(c(mp[a],mp[a]),c(ci.u[a]+g,max(c(ci.u[a],ci.u[b])+h)))
lines(c(mp[b],mp[b]),c(ci.u[b]+g,max(c(ci.u[a],ci.u[b])+h)))
lines(c(mp[a],mp[b]),c(max(c(ci.u[a],ci.u[b]))+h,max(c(ci.u[a],ci.u[b])+h)))
x.text<-mean(c(mp[a],mp[b]))
y.text<-max(c(ci.u[a],ci.u[b]))+h+t
text(s,x=x.text,y=y.text)
}

hh <- matrix(c(450), ncol=3, byrow=T)
hh <- matrix(c(450,483.333333333333,993.333333333333), ncol=3, byrow=T)
dimnames(hh) = list('',c('WT','-dox','+dox'))
h.sd=matrix(c(149.3318452,20.81665999,51.31601439), ncol=3, byrow=T)
ci.l <- hh - h.sd
ci.u <- hh + h.sd

mp <- myfigure()
significance_lines(2,3,400,50,'**',50)
