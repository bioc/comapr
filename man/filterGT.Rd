% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/count-gt.R
\name{filterGT}
\alias{filterGT}
\alias{filterGT,matrix,numeric,numeric-method}
\alias{filterGT,GRanges,numeric,numeric-method}
\title{filterGT}
\usage{
filterGT(geno, min_markers = 5, min_samples = 3)

\S4method{filterGT}{matrix,numeric,numeric}(geno, min_markers = 5, min_samples = 3)

\S4method{filterGT}{GRanges,numeric,numeric}(geno, min_markers = 5, min_samples = 3)
}
\arguments{
\item{geno}{the genotype data.frame of markers by samples from output of
function \code{correctGT}}

\item{min_markers}{the minimum number of markers for a sample to be kept}

\item{min_samples}{the minimum number of samples for a marker to be kept}
}
\value{
The filtered genotype matrix
}
\description{
Filter markers or samples that have too many missing values
}
\details{
This function takes the \code{geno} data.frame and filter the data.frame by
the provided cut-offs.
}
\examples{
data(snp_geno_gr)
corrected_geno <- filterGT(snp_geno_gr, min_markers = 30,min_samples = 2)

}
\author{
Ruqian Lyu
}
