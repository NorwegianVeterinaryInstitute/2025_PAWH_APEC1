#' theme_apec() variant for the Figure 7 pie-matrix charts
#'
#' Adds the styling shared by the top-5 and top-10 pie-matrix figures on top
#' of theme_apec(): grey, slightly smaller axis text, no gridlines (a grid
#' under overlapping pie circles reads as clutter), legend at the bottom
#' (grouping the isolate-count and production-type legends into one legend
#' box, same row, instead of one at the side and one at the bottom), and
#' rotated x-axis labels for the long variant names.
#'
#' @param base_size Passed through to theme_apec().
#' @return A ggplot2 theme object.
theme_apec_piematrix <- function(base_size = 11) {
  theme_apec(base_size) +
    ggplot2::theme(
      legend.position = "bottom",
      legend.box = "vertical",
      legend.box.just = "left",
      axis.text = ggplot2::element_text(color = "grey30", size = ggplot2::rel(0.85)),
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, vjust = 1),
      panel.grid.major = ggplot2::element_blank()
    )
}
