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
    append(libraries, 'here', 'data.table', 'lubridate')
  }

  if (is.element('stat.tests', options)) {
    append(libraries, 'infer', 'modelr', 'plotrix')
  }

  if (is.element('unit.tests', options)) {
    append(libraries, 'testthat')
    print('Installed!')
  }
}
