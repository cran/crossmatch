\name{crossmatchdist}
\alias{crossmatchdist}
\title{
The Exact Null Distribution Of The Cross-match Statistic Under The Null
}
\description{
The exact null distribution of the number of crossmatches for \code{bigN>=4} cases, 
 \code{n>=2} from one type and \code{N-n>=2} from another type. 
}
\usage{
crossmatchdist(bigN, n)
}
\arguments{
  \item{bigN}{
The total number of observations
}
  \item{n}{
The number of cases from one type
}
}
\details{
\code{bigN} is even. Let a1 be the number of cross-matches pairs. Then \code{a2=(n-a1)/2} and
  \code{a0=bigN/2-(n+a1)/2} are the number of pairs both of one type and the other type 
  respectively.   
}
\value{
  \item{dist }{A matrix with rows \code{a0, a1, a2, Pr(A1=a1)} and \code{Pr(A1<=a1)}.}
}
\references{
Rosenbaum, P.R. (2005),
An exact distribution-free test comparing two multivariate distributions based on adjacency,
\emph{Journal of the Royal Statistical Society: Series B (Statistical Methodology)}, \bold{67}, 4, 515-530.
}
\author{
Ruth Heller
}

\examples{
crossmatchdist(18,9)
}