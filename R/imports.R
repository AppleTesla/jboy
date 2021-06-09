#' Provides a template for the repetitve task of requiring libraries
#'
#' @param options A vector of use cases. Choose from the following: default, csv, stat.tests, unit.tests
#'
#' @return A dataframe consisting of sample sizes and their respective sample means
#'
#' @export

imports <- function(options = c('default')) {
  libraries <- c('tidyverse')

  if (is.element('csv', options)) {
    libraries <- c(libraries, 'lubridate', 'data.table', 'here')
  }

  if (is.element('stat.tests', options)) {
    libraries <- c(libraries, 'infer', 'modelr', 'plotrix')
  }

  if (is.element('unit.tests', options)) {
    libraries <- c(libraries, 'testthat')
  }

  new.packages <- libraries[!(libraries %in% installed.packages()[,"Package"])]

  if (length(new.packages)) {
    install.packages(new.packages)
  }

  lapply(libraries, require, character.only = TRUE)

  print('Installed these packages:')
  print(libraries)
}
