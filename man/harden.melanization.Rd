% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soilColorIndices.R
\name{harden.melanization}
\alias{harden.melanization}
\title{Harden (1982) Melanization}
\usage{
harden.melanization(value, value_ref)
}
\arguments{
\item{value}{numeric vector containing Munsell values}

\item{value_ref}{A numeric vector containingMunsell value(s) for reference material}
}
\value{
A numeric vector reflecting horizon darkening relative to a reference (e.g. parent) material.
}
\description{
Calculate Melanization component of Profile Development Index after Harden (1982) "A quantitative index of soil development from field descriptions: Examples from a chronosequence in central California". Accepts vectorized inputs for hue and chroma to produce vector output. In Harden (1982), melanization is calculated relative to a reference parent material for all horizons within 100cm of the soil surface. In addition, several other non-color components are normalized relative to a maximum value and summed to obtain the overall Profile Development Index.
}
\author{
Andrew G. Brown.
}
