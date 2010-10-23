\name{crossmatchtest}
\alias{crossmatchtest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{The cross-match test}
\description{
A test for comparing two multivariate distributions by using the distance between the observations. 
}
\usage{
crossmatchtest(z, D)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{z}{A binary vector corresponding to observations class labels.}
  \item{D}{A distance matrix of dimensions NxN, where N is the total number of observations. }
}
\details{
Observations are divided into pairs to minimize the total distance within pairs, using a polynomial
time algorithm made available in R by Lu, B., Greevy, R., Xu, X., and Beck, C in the R package "nbpMatching".
 The cross-match test takes as the test statistic the number of times a subject from one group was
paired with a subject from another group, rejecting the hypothesis of equal distribution for small values
of the statistic; see Rosenbaum (2005) for details. 
}
\value{
  A list with the following
  \item{a1 }{The number of cross-matches}
  \item{Ea1 }{The expected number of cross-matches under the null}
  \item{Va1 }{The variance of number of cross-matches under the null}
  \item{dev}{The observed difference from expectation under null in SE units}
  \item{pval}{The p-value based on exact null distribution (NA for datasets with 340 observations or more)}
  \item{approxpval}{The approximate p-value based on normal approximation}
}
\references{
Rosenbaum, P. R. (2005), An exact,
distribution free test comparing two multivariate distributions based on
adjacency, Journal of the Royal Statistical
Society, B, 67, 515-530. 
}
\author{
Ruth Heller 
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
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

crossmatchtest(z,dis)

}
