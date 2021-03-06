% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Problem.R
\name{addProblem}
\alias{Problem}
\alias{addProblem}
\title{Add a problem to registry.}
\usage{
addProblem(reg, id, static = NULL, dynamic = NULL, seed = NULL,
  overwrite = FALSE)
}
\arguments{
\item{reg}{[\code{\link{ExperimentRegistry}}]\cr

  Registry.}

\item{id}{[\code{character(1)}]\cr
Name of problem.}

\item{static}{[any]\cr
Static part of problem that never changes and is not dependent on parameters.
Default is \code{NULL}.}

\item{dynamic}{[\code{function(job, static, ...)}]\cr
R generator function that creates dynamic / stochastic part of problem instance, which might be dependent on parameters.
First parameter \code{job} is a \code{\link[BatchJobs]{Job}} object, second is static problem part \code{static}.
Further parameters from design are passed to ... argument on instance creation time.
The arguments \code{job} and \code{static} may be omitted.
To retrieve job informations from the \code{job} object
see the documentation on \link{ExperimentJob}.
Default is \code{NULL}.}

\item{seed}{[\code{integer(1)}]\cr
Start seed for this problem. This allows the \dQuote{synchronization} of a stochastic
problem across algorithms, so that different algorithms are evaluated on the same stochastic instance.
The seeding mechanism works as follows, if a problem seed is defined:
(1) Before the dynamic part of a problem is instantiated,
the seed of the problem + replication - 1 is set, so for the first
replication the exact problem seed is used. (2) The stochastic part of the problem is
instantiated (3) From now on the usual experiment seed of the registry is used,
see \code{\link{ExperimentRegistry}}.
If \code{seed} is set to \code{NULL} this extra problem seeding is switched off, meaning
different algorithms see different stochastic versions of the same problem.
Default is \code{NULL}.}

\item{overwrite}{[\code{logical(1)}]\cr
Overwrite the problem file if it already exists?
Default is \code{FALSE}.}
}
\value{
[\code{character(1)}]. Invisibly returns the id.
}
\description{
Add a algorithm to problem and stores it on disk.
}
\seealso{
Other add: \code{\link{addAlgorithm}},
  \code{\link{addExperiments}}
}

