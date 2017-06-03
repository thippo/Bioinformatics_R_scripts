ds = read.table(file="data_table.txt")
names(ds) = c("t","C")
x=ds$t
y=ds$C

rhs = function(x, Bu, Rm, Lamda){Bu*exp(-exp((Rm*exp(1)*(Lamda-x)/Bu)+1))}

m.2 = nls(y ~ rhs(x, A, B, L), data = ds, start = list(A = 73,B=4,L=1),trace=T)
summary(m.2)
s = seq(0, 70, length = 1000)
plot(y ~ x, xlab="Time(d)",ylab="Production(ml CH4/gVS)",main = "Fitted modified Gompertz model", sub = "Blue: fit")

lines(s, predict(m.2, list(x = s)), lty = 1, col = "blue")
segments(x, y, x, fitted(m.2), lty = 2, col = "red")

sst=0
sse=0
ym=mean(y)
for(i in 1:29){
  ye=225.711*exp(-exp(18.235*exp(1)*(0.300-(i-1))/225.711+1))
  sst=sst+(y[i]-ym)^2
  sse=sse+(y[i]-ye)^2
}
R2=1-sse/sst
R2

text(17,45,"y=225.711*exp(-exp(18.234*exp(1)*(0.300-(i-1))/225.711+1)]}")
text(20,30,"R2=0.974")

#data_table.txt:
#1	24.19884963
#2	42.89235826
#3	55.66967954
#4	66.06409203
#5	80.03286771
