#' Shared ggplot2 theme for APEC1 visualisations
#'
#' Design goals: colorblind-safe, print-friendly, minimal chartjunk,
#' consistent typography/legend placement across all figures in this project.
#'
#' @param base_size Base font size, passed to `ggplot2::theme_minimal()`.
#' @return A ggplot2 theme object.
theme_apec <- function(base_size = 11) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      plot.title = ggplot2::element_text(face = "bold", size = ggplot2::rel(1.1)),
      plot.subtitle = ggplot2::element_text(color = "grey30", size = ggplot2::rel(0.95)),
      plot.caption = ggplot2::element_text(color = "grey45", size = ggplot2::rel(0.75), hjust = 0),
      axis.title = ggplot2::element_text(color = "grey20"),
      legend.position = "right",
      legend.title = ggplot2::element_text(size = ggplot2::rel(0.85)),
      strip.text = ggplot2::element_text(face = "bold")
    )
}
