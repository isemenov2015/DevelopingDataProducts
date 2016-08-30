\name{prefix}
\alias{prefix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get full field description
}
\description{
Helper function for SaratogaHouses project.
Returns a string with text description corresponding to particular column in SaratogaHouses dataset from mosaicData R library.
}
\usage{
prefix(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
  Number of a field
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\item{1 }{'No of bedrooms'}
\item{2 }{'Total No of rooms'}
\item{3 }{'No of bathrooms (0.5 for no shower/tub)'}
\item{4 }{'House age'}
\item{5 }{'Living area'}
\item{6 }{'Heating type'}
\item{7 }{'Fuel type'}
\item{8 }{'Sewer type'}
\item{9 }{'No of fireplaces'}
\item{10 }{'Waterfront?'}
\item{11 }{'New construction?'}
\item{12 }{'Central air'}
\item{13 }{'College grads \%'}
\item{14 }{'Lot size'}
\item{15 }{'Land value'}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
prefix(10)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
