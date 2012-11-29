########7.18 a
A=matrix(c(1,2,3,2,3,4,3,4,5,4,5,6),nrow=4,byrow=TRUE)
B=matrix(c(1,2,3,2,4,6,3,6,9,4,8,12),nrow=4,byrow=TRUE)
Avec<-cbind(A[,1],A[,2])
Bvec<-cbind(B[,1],B[,2])
plot.new()
plot.window(xlim=c(0,6),ylim=c(0,10))
axis(1)
axis(2)
title(main="")
title(xlab="X")
title(ylab="Y")
box()
lines(Avec,type="b",cex=0.6,pch=21,col='red')
lines(Bvec,type="b",cex=0.6,pch=17,col='Blue')
############7.18 b
library(Matrix)
rankMatrix(A)[1]
rankMatrix(B)[1]
qr(A)
qr(A)$rank

#################7.18 c
#mutiply the first column by -1
c<-c(0,0,0)
z<-as.matrix(c)
a1<-cbind(z[1,],z[1,],A[,1])
a1
A1<-cbind(A[,1],A[,2],A[,3]+A[,1])
A1
a2<-cbind(z[1,],z[1,],-2*A[,2])
a2
A2<-cbind(A[,1],A[,2],A[,3]+A[,1]-2*A[,2])
A2
################7.18 D
AT<-t(A)
B<-A%*%AT
c<-diag(B)
One<-matrix(c(1,1,1,1),byrow=T)
D2<-c%*%t(One)+One%*%c-2*B
D<-sqrt(D2)
print(D)

dist(A)
#######7.30
load('matlabclown.RData')
image(X) # omit this in your Sweave code
svdX = svd(X)
U = svdX$u
S = diag(svdX$d)
V = svdX$v
k = 50
M = U[,1:k,drop=FALSE] %*% S[1:k,1:k,drop=FALSE] %*% t(V[,1:k,drop=FALSE])
image(M) # omit this in your Sweave code
image(M,col=gray.colors(k))

svd(X)
##################Ex 4.1
a <- c()
for(i in 1:51) {
  for(j in 1:51){
    if(i==j)
    {
      a=append(a,9)
    } 
    else if((abs(i-j)>=1) && (abs(i-j)<=3)){
      a=append(a,8)
    } 
    else if((abs(i-j)>=4)&&(abs(i-j)<=6)){
      a=append(a,7)  
    } 
    else if((abs(i-j)>=7)&&(abs(i-j)<=9)){
      a=append(a,6)
    } 
    else if((abs(i-j)>=10)&&(abs(i-j)<=12)){
      a=append(a,5)
    } 
    else if((abs(i-j)>=13)&&(abs(i-j)<=15)){
      a=append(a,4)
    } 
    else if((abs(i-j)>=16)&&(abs(i-j)<=18)){
      a=append(a,3)
    } 
    else if((abs(i-j)>=19)&&(abs(i-j)<=21)){
      a=append(a,2)
    } 
    else if((abs(i-j)>=22)&&(abs(i-j)<=24)){
      a=append(a,1)
    } 
    else if((abs(i-j)>=25)){
      a=append(a,0)
    } 
  }
}
q=matrix(a,nrow=51)
for(i in 1:51){
  for(j in 1:51){
    if(i==1 && j==1){
      diff=sqrt(q[i,i]+q[j,j]+-2*q[i,j])
    } else{
      diff = append(diff, sqrt(q[i,i]+q[j,j]+-2*q[i,j]))
    }
  }
}
mdiff = matrix(diff, nrow = 51)
plot(cmdscale(mdiff))

##############Ex 4.3
require(MVA);data(gardenflowers)
mds<-cmdscale(gardenflowers,k=17,eig=T)
mds$eig
#there are negative numbers in eigenvalues
cumsum(abs(mds$eig))/sum(abs(mds$eig))
cumsum((mds$eig)^2)/sum((mds$eig)^2)
x<-mds$points[,1]
y<-mds$points[,2]
co<-cbind(x,y)
plot(co,xlab="Coordinate1",ylab="Coordinate2",xlim=range(x)*1.2,type='n')
text(co,rownames(co),cex=0.7)