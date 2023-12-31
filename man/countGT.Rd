% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/count-gt.R
\name{countGT}
\alias{countGT}
\title{countGT}
\usage{
countGT(geno, plot = TRUE, interactive = FALSE)
}
\arguments{
\item{geno}{the genotype data.frame of markers by samples from output of
function \code{correctGT}}

\item{plot, }{it determines whether a plot will be generated, defaults to TRUE}

\item{interactive, }{it determines whether an interactive plot will be generated}
}
\value{
A list of two elements including \code{n_markers} and \code{n_samples}
}
\description{
count how many samples have genotypes calls across markers and count how
many markers that each individual has called genotypes for. This function
helps identify poor samples or poor markers for filtering. It can also generate
plots that help identify outlier samples/markers
}
\examples{
data(snp_geno_gr)
genotype_counts <- countGT(GenomicRanges::mcols(snp_geno_gr))
}
\author{
Ruqian Lyu
}
