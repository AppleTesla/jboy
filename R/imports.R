#' Provides a template for the repetitve task of requiring libraries
#'
#' @param options A vector of use cases. Choose from the following: default, csv, stat.tests, unit.tests
#'
#' @return A dataframe consisting of sample sizes and their respective sample means
#'
#' @export

imports <- function(options = c('default')) {
  libraries <- c('tidyerse')

  if ('csv' %in% options) {
    append(libraries, 'here', 'data.table', 'lubridate')
  }

  if ('stat.tests' %in% options) {
    append(libraries, 'infer', 'modelr', 'plotrix')
  }

  if ('unit.tests' %in% options) {
    append(libraries, 'testthat')
  }
}
