% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/depthWeights.R
\name{depthWeights}
\alias{depthWeights}
\alias{depthWeights,SoilProfileCollection-method}
\title{Return a vector of contributing fractions over a depth interval}
\usage{
depthWeights(top, bottom, upper, lower)
}
\arguments{
\item{top}{A numeric vector of horizon top depths.}

\item{bottom}{A numeric vector of horizon bottom depths.}

\item{upper}{A unit length numeric vector with upper boundary.}

\item{lower}{A unit length numeric vector with lower boundary.}
}
\value{
A named list.
}
\description{
\code{depthWeights()} calculates the contributing fraction for each pair of horizon top and bottom depths, given an upper and lower boundary.
}
\author{
Andrew G. Brown.
}
