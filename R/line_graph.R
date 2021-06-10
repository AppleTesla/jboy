#' A wrapper function for ggplot geom_smooth
#'
#' @param data A list of data that ggplot can interpret.
#' @param x The explanatory variable in data.
#' @param y The response variable in data.
#' @param z A potential lurking variable in data.
#' @param title A string for the title.
#' @param subtitle A string for the subtitle.
#' @param one.chart A boolean to switch between single chart overlays or a facet wrap (default = FALSE).
#' @param show.CI A boolean to control the visibility of confidence intervals around line graphs (default = TRUE).
#' @param color A literal color or a variable name from data.
#'
#'
#' @return Returns a geom_smooth plot from ggplot.
#'
#'
#' @examples line_graph(cereals, protein, calories, sugar, title = 'Is It Really Protein?', show.CI = FALSE, color = 'protein')
#' @examples line_graph(cereals, sodium, fat, title = 'Fat vs Sodium', one.chart = TRUE, color = 'green')
#'
#'
#' @import tidyr
#'
#' @export

line_graph <- function(data, x, y, z = NA, title = ggplot2::waiver(), subtitle = ggplot2::waiver(), one.chart = FALSE, show.CI = TRUE, color = NA) {
  graph <- ggplot2::ggplot(data = data)

  if (!is.na(color) & is.element(color, colors())) {
    graph <- graph +
      ggplot2::geom_smooth(mapping = aes_string(x,
                                                y,
                                                group = if (one.chart) z else NA),
                           color = color,
                           se = show.CI)
  } else {
    graph <- graph +
      ggplot2::geom_smooth(mapping = aes_string(x,
                                                y,
                                                color = if (is.na(color)) c() else color,
                                                group = if (one.chart) z else NA),
                           se = show.CI)
  }

  if (!is.na(z) && !one.chart) {
    graph <- graph + ggplot2::facet_wrap(z)
  }

  graph <- graph + ggplot2::ggtitle(title, subtitle = subtitle)

  return(graph)
}
