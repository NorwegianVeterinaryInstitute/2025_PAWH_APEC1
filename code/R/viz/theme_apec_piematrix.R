#' theme_apec() variant for the Figure 7 pie-matrix charts
#'
#' Adds the styling shared by the top-5 and top-10 pie-matrix figures on top
#' of theme_apec(): grey, slightly smaller axis text, no gridlines (a grid
#' under overlapping pie circles reads as clutter), legend at the bottom
#' (grouping the isolate-count and production-type legends into one legend
#' box, same row, instead of one at the side and one at the bottom), and
#' rotated x-axis labels for the long variant names. Axis titles ("Variant",
#' "Year") are recolored to match the axis text's grey30 - theme_apec()'s
#' default axis.title is grey20, a shade darker than its (inherited)
#' axis.text, which reads as an inconsistency once axis.text is styled
#' explicitly here; overridden locally rather than in theme_apec() itself so
#' figures already using that grey20 title elsewhere are unaffected.
#'
#' @param base_size Passed through to theme_apec().
#' @return A ggplot2 theme object.
theme_apec_piematrix <- function(base_size = 11) {
  theme_apec(base_size) +
    ggplot2::theme(
      legend.position = "bottom",
      legend.box = "vertical",
      legend.box.just = "left",
      axis.title = ggplot2::element_text(color = "grey30"),
      axis.text = ggplot2::element_text(color = "grey30", size = ggplot2::rel(0.85)),
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, vjust = 1),
      panel.grid.major = ggplot2::element_blank()
    )
}
