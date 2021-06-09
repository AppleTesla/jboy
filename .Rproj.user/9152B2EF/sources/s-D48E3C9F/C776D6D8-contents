#' Finds any number of sample means reps across any number of sample sizes n
#'
#' @param vec A vector of numericals to sample from
#' @param reps Number of samples
#' @param ns A vector of different sample sizes
#'
#' @return A dataframe consisting of sample sizes and their respective sample means
#'
#' @import dplyr
#' @import purrr
#'
#' @export

sample_means_ns <- function(vec, reps, ns) {
  df <- map_df(ns,
               ~ data.frame(sample_mean = many_sample_means(vec, .x, reps),
                            sd = sd(many_sample_means(vec, .x, reps)),
                            n = .x))

  return(df)
}
