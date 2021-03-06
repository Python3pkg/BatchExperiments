% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reduceResultsExperiments.R
\name{getResultVars}
\alias{getResultVars}
\title{Get variable groups of reduced results.}
\usage{
getResultVars(data, type = "group")
}
\arguments{
\item{data}{[\code{\link{ReducedResultsExperiments}}]\cr
Result data.frame from \code{\link{reduceResultsExperiments}}.}

\item{type}{[\code{character(1)}]\cr
Can be \dQuote{prob} (prob + pars), \dQuote{prob.pars} (only problem pars),
\dQuote{algo} (algo + pars), \dQuote{algo.pars} (only algo pars),
\dQuote{group} (prob + problem pars + algo + algo pars), \dQuote{result} (result column names).
Default is \dQuote{group}.}
}
\value{
[\code{character}]. Names of of columns.
}
\description{
Useful helper for e.g. package plyr and such.
}
\examples{
reg = makeExperimentRegistry("BatchExample", seed = 123, file.dir = tempfile())
addProblem(reg, "p1", static = 1)
addProblem(reg, "p2", static = 2)
addAlgorithm(reg, id = "a1",
  fun = function(static, dynamic, alpha) c(y = static*alpha))
addAlgorithm(reg, id = "a2",
  fun = function(static, dynamic, alpha, beta) c(y = static*alpha+beta))
ad1 = makeDesign("a1", exhaustive = list(alpha = 1:2))
ad2 = makeDesign("a2", exhaustive = list(alpha = 1:2, beta = 5:6))
addExperiments(reg, algo.designs = list(ad1, ad2), repls = 2)
submitJobs(reg)
data = reduceResultsExperiments(reg)
library(plyr)
ddply(data, getResultVars(data, "group"), summarise, mean_y = mean(y))
}

