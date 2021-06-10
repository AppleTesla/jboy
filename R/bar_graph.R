#' A wrapper function for ggplot geom_bar
#'
#' @param data A list of data that ggplot can interpret.
#' @param x The explanatory variable in data.
#' @param y The response variable in data.
#' @param z A potential lurking variable in data.
#' @param title A string for the title.
#' @param subtitle A string for the subtitle.
#' @param color A literal color or a variable name from data.
#'
#'
#' @return Returns a geom_bar plot from ggplot.
#'
#' @examples bar_graph(cereals, mfr, calories, title = 'Mfr vs Calories', 'mfr')
#' @examples bar_graph(cereals, protein, title = 'Protein vs Calories', 'blue')
#'
#'
#' @import tidyr
#'
#' @export

bar_graph <- function(data, x, y = NA, z = NA, title = ggplot2::waiver(), subtitle = ggplot2::waiver(), color = NA) {
  graph <- ggplot2::ggplot(data = data)
  aes_string_temp <- NULL

  if (is.na(y) && is.element(color, colors())) {
    graph <- graph +
      ggplot2::geom_bar(mapping = aes_string(x),
                        fill = color)
  } else if (is.na(y)) {
    graph <- graph +
      ggplot2::geom_bar(mapping = aes_string(x, fill = color))
  } else if (is.element(color, colors())) {
    graph <- graph +
      ggplot2::geom_bar(mapping = aes_string(x, y),
                        fill = color,
                        stat = 'identity')
  } else {
    graph <- graph +
      ggplot2::geom_bar(mapping = aes_string(x, y, fill = color),
                        stat = 'identity')
  }

  if (!is.na(z)) {
    graph <- graph + ggplot2::facet_wrap(z)
  }

  graph <- graph + ggplot2::ggtitle(title, subtitle = subtitle)

  return(graph)
}
