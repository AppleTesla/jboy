#' Provides a template for the repetitve task of requiring libraries
#'
#' @param options A vector of use cases. Choose from the following: default, csv, stat.tests, unit.tests
#'
#' @return A dataframe consisting of sample sizes and their respective sample means
#'
#' @export

imports <- function(options = c('default')) {
  libraries <- c('tidyerse')

  if (is.element('csv', options)) {
    append(libraries, c('here', 'data.table'))
  }

  if (is.element('stat.tests', options)) {
    append(libraries, c('infer', 'modelr', 'plotrix'))
  }

  if (is.element('unit.tests', options)) {
    append(libraries, c('testthat'))
  }

  lapply(libraries, library, character.only = TRUE)
  print('Installed all packages!')
}
