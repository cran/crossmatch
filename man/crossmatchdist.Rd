\name{crossmatchdist}
\alias{crossmatchdist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The exact null distribution of the cross-match statistic under the null
}
\description{
The exact null distribution of the number of crossmatches for bigN>=4 cases, 
 n>=2 from one type and N-n>=2 from another type. 
}
\usage{
crossmatchdist(bigN, n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{bigN}{
The total number of observations
}
  \item{n}{
The number of cases from one type
}
}
\details{
bigN is even. Let a1 be the number of cross-matches pairs. Then a2=(n-a1)/2 and
  a0=bigN/2-(n+a1)/2 are the number of pairs both of one type and the other type 
  respectively.   
}
\value{
  \item{dist }{A matrix with rows a0, a1, a2, Pr(A1=a1), Pr(A1<=a1).}
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

\examples{
crossmatchdist(18,9)
}