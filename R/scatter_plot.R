#' A wrapper function for ggplot geom_point
#'
#' @param data A list of data that ggplot can interpret.
#' @param x The explanatory variable in data.
#' @param y The response variable in data.
#' @param z A potential lurking variable in data.
#' @param title A string for the title.
#' @param subtitle A string for the subtitle.
#' @param one.chart A boolean to switch between single chart overlays or a facet wrap (default = FALSE).
#' @param show.regression A boolean to enable a regression line to appear (default = FALSE).
#' @param show.CI A boolean to control the visibility of confidence intervals around the regresion line (default = TRUE).
#' @param color A literal color or a variable from the data.
#' @param size Control the size of points through a variable name in data.
#'
#'
#' @return Returns a geom_point plot from ggplot.
#'
#'
#' @examples scatter_plot(cereals, protein, sugar, title = 'Is It Really Protein?', show.regression = TRUE, color = 'calories')
#' @examples line_graph(cereals, sugar, shelf, title = 'For Children?', show.regression = TRUE, show.CI = FALSE, size = 'protein')
#'
#'
#' @import tidyr
#'
#' @export

scatter_plot <- function(data, x, y, z = NA, title = ggplot2::waiver(), subtitle = ggplot2::waiver(), one.chart = FALSE, show.regression = FALSE, show.CI = TRUE, color = NA, size = NA) {
  plot <- ggplot2::ggplot(data = data)

  if (!is.na(color) & is.element(color, colors())) {
    plot <- plot +
      ggplot2::geom_point(mapping = aes_string(x,
                                               y,
                                               size = if (is.na(size)) c() else size,
                                               group = if (one.chart) z else NA),
                          color = color)
  } else {
    plot <- plot +
      ggplot2::geom_point(mapping = aes_string(x,
                                               y,
                                               color = if (is.na(color)) c() else color,
                                               size = if (is.na(size)) c() else size,
                                               group = if (one.chart) z else NA))
  }

  if (!is.na(z) && !one.chart) {
    plot <- plot + ggplot2::facet_wrap(z)
  }

  if (show.regression) {
    plot <- plot +
      ggplot2::geom_smooth(data = data, mapping = aes_string(x, y), se = show.CI)
  }

  plot <- plot + ggplot2::ggtitle(title, subtitle = subtitle)

  return(plot)
}
