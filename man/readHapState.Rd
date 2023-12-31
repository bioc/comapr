% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-hap-state.R
\name{readHapState}
\alias{readHapState}
\title{readHapState}
\usage{
readHapState(
  sampleName,
  chroms = c("chr1"),
  path,
  barcodeFile = NULL,
  minSNP = 30,
  minlogllRatio = 200,
  bpDist = 100,
  maxRawCO = 10,
  nmad = 1.5,
  minCellSNP = 200,
  biasTol = 0.45
)
}
\arguments{
\item{sampleName, }{the name of the sample to parse which is used as prefix for
finding relevant files for the underlying sample}

\item{chroms, }{the character vectors of chromosomes to parse. Multiple chromosomes'
results will be concated together.}

\item{path, }{the path to the files, with name patterns *{chrom}_vi.mtx,
*{chrom}_viSegInfo.txt, end with slash}

\item{barcodeFile, }{if NULL, it is assumed to be in the same directory as the
other files and with name sampleName_barcodes.txt}

\item{minSNP}{the crossover(s) will be filtered out if introduced by a segment
that has fewer than `minSNP` SNPs to support.}

\item{minlogllRatio}{the crossover(s) will be filtered out if introduced by a
segment that has lower than `minlogllRatio` to its reversed state.}

\item{bpDist, }{the crossover(s) will be filtered out if introduced by a segment
that is shorter than `bpDist` basepairs. It can be a single value or a vector
that is the same length and order with `chroms`.}

\item{maxRawCO}{if a cell has more than `maxRawCO` number of raw crossovers
called across a chromosome, the cell is filtered out}

\item{nmad}{how many mean absolute deviations lower than the median number
of SNPs per cellfor a cell to be considered as low coverage cell and filtered
Only effective when number of cells are larger than 10. When effective, this or
`minCellSNP`, whichever is larger, is applied}

\item{minCellSNP}{the minimum number of SNPs detected for a cell to be kept,
used with `nmads`}

\item{biasTol}{the SNP's haplotype ratio across all cells is assumed
to be 1:1. This argument can be used for removing SNPs that have a biased
haplotype. i.e. almost always inferred to be haplotype state 1. It specifies
a bias tolerance value, SNPs with haplotype ratios deviating from 0.5 smaller
than this value are kept. Only effective when number of cells are larger than
10}
}
\value{
a RangedSummarizedExperiment with rowRanges as SNP positions that
contribute to crossovers in any cells. colData contains cells annotation
including barcodes and sampleName.
}
\description{
A function that parses the viterbi state matrix (in .mtx format),
barcode.txt and snpAnno.txt files for each individual.
}
\examples{
demo_path <- system.file("extdata",package = "comapr")
s1_rse_state <- readHapState(sampleName="s1",chroms=c("chr1"),
path=paste0(demo_path,"/"),
barcodeFile=NULL,minSNP = 0, minlogllRatio = 50,
bpDist = 100,maxRawCO=10,minCellSNP=3)
s1_rse_state
}
\author{
Ruqian Lyu
}
