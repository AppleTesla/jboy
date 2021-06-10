#' Provides a template for the repetitive task of requiring packages It also installs missing packages.
#'
#' @param options A vector of use cases. Choose from the following: default, csv, stat.tests, unit.tests
#'
#' @return No return value. Prints to the console upon package installation.
#'
#' @export

imports <- function(options = c('default')) {
  libraries <- c('tidyverse')

  if (is.element('csv', options)) {
    libraries <- c(libraries, 'lubridate', 'data.table', 'here')
  }

  if (is.element('stat.tests', options)) {
    libraries <- c(libraries, 'infer', 'modelr', 'cowplot')
  }

  if (is.element('unit.tests', options)) {
    libraries <- c(libraries, 'testthat')
  }

  new.packages <- libraries[!(libraries %in% installed.packages()[,"Package"])]

  if (length(new.packages)) {
    install.packages(new.packages)
    print('Installed these missing packages:')
    print(new.packages)
  }

  lapply(libraries, require, character.only = TRUE)
}
