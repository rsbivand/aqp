% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/guessColumnNames.R
\name{guessHzDesgnName}
\alias{guessHzDesgnName}
\title{Guess Horizon Designation Column Name}
\usage{
guessHzDesgnName(x)
}
\arguments{
\item{x}{A SoilProfileCollection}
}
\value{
Character containing horizon designation column name.
}
\description{
This follows the historic convention used by \code{aqp::plotSPC()} looking for 'hzname' or other column names containing the regular expression \code{name}. In the future, more patterns may be added.
}
\examples{

a <- data.frame(id = 1, top = c(0,10), bottom=c(10,40), horizonname=c("A","Bw"))
depths(a) <- id ~ top + bottom

# store guess in metadata
hzdesgnname(a) <- guessHzDesgnName(a)

# inspect result
hzdesgnname(a)

}
\author{
Andrew G. Brown
}
