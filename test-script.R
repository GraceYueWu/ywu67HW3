
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

library(Matrix)
rankMatrix(A)[1]
rankMatrix(B)[1]

library(HSAUR)
A.pca<-prcomp(A,retx=TRUE,center=TRUE,scale.=TRUE)
loadingsA<-A.pca$rotation
print(A.pca)
summary(A.pca)
