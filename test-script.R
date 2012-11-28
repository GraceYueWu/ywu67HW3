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

##############Ex 4.3
require(MVA);data(gardenflowers)
mds<-cmdscale(gardenflowers,k=17,eig=T)
mds$eig
#there are negative numbers in eigenvalues
cumsum(abs(mds$eig))/sum(abs(mds$eig))
cumsum((mds$eig)^2)/sum((mds$eig)^2)