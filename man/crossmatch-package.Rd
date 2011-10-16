\name{crossmatch-package}
\alias{crossmatch-package}
\alias{crossmatch}
\docType{package}
\title{
The cross-match test for comparing two multivariate distributions. 
}
\description{
The cross-match test is an exact, distribution free test of equality of 2 high dimensional multivariate distributions.   
}
\details{
\tabular{ll}{
Package: \tab crossmatch\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2010-07-26\cr
License: \tab GPL-2 \cr
LazyLoad: \tab yes\cr
}
For the cross-match test, use the function crossmatch().
}
\author{
Ruth Heller, Paul Rosenbaum, Dylan Small. 
Maintainer: Ruth Heller <ruheller@ie.technion.ac.il>
}
\references{
Rosenbaum, P. R. (2005), An exact,
distribution free test comparing two multivariate distributions based on
adjacency, Journal of the Royal Statistical
Society, B, 67, 515-530. 
}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
%~~ the R documentation directory ~~
\keyword{ nonparametric}
\keyword{multivariate}
\examples{
#The example in Section 2 of Rosenbaum P. (2005), An exact distribution-free test comparing two multivariate distributions based on adjacency, JRSS B, 67, pp 515-530.

#The data consists of 2 outcomes measured on 9 treated cases and 9 controls. 
dat = rbind(c(0.47,0.39,0.47,0.78,1,1,0.54,1,0.38,1,0.27,0.63,0.22,0,-1,-0.42,-1,-1),
     c(0.03,0.11,0.16,-0.1,-0.05,0.16,0.12,0.4,0.04,0.71,0.01,0.21,-0.18,-0.08,-0.35,0.26,-0.6,-1.0))
z = c(rep(0,9),rep(1,9))
X=t(dat)

# rank based Mahalanobis distance between each pair
X<-as.matrix(X)
n<-dim(X)[1]
k<-dim(X)[2]
for (j in 1:k) X[,j]<-rank(X[,j])
cv<-cov(X)
vuntied<-var(1:n)
rat<-sqrt(vuntied/diag(cv))
cv<-diag(rat)\%*\%cv\%*\%diag(rat)
out<-matrix(NA,n,n)
library(MASS)
icov<-ginv(cv)
for (i in 1:n) out[i,]<-mahalanobis(X,X[i,],icov,inverted=TRUE)

dis<-out

# the cross-match test
crossmatchtest(z,dis)

}
