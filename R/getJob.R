#' @title Get jobs (here: experiments) from registry by id.
#'
#' @description
#' Constructs an \code{\link{Experiment}} for each job id provided.
#'
#' @param reg [\code{\link{ExperimentRegistry}}]\cr
#'   Registry.
#' @param ids [\code{integer}]\cr
#'   Ids of job.
#'   Default is all jobs.
#' @param check.ids [\code{logical(1)}]\cr
#'   Check the job ids?
#'   Default is \code{TRUE}.
#' @return [list of \code{Experiment}].
#' @method getJobs ExperimentRegistry
#' @family get
#' @export
getJobs.ExperimentRegistry = function(reg, ids, check.ids = TRUE) {
  if (!missing(ids) && check.ids)
    ids = checkIds(reg, ids)
  dbGetJobs(reg, ids)
}
