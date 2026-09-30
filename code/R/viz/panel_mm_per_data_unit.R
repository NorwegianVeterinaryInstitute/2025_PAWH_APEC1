#' How many mm one data-unit occupies in a rendered, coord_equal() panel
#'
#' For a `coord_equal()` plot, ggplot fits the panel into whichever of
#' width/height is the tighter constraint - the same data-unit can render at
#' very different physical sizes depending on that, so this can't be worked
#' out from the requested save width/height alone (they're rarely both the
#' binding constraint). This renders `plot` once, off-screen, at the exact
#' size it will be saved at, and measures the actual panel size: all
#' non-panel columns/rows (axis text, titles, legend, margins) have
#' resolvable absolute sizes even without drawing, so panel size = total
#' size minus those - then mm-per-unit = panel size / data range, taking the
#' smaller (tighter) of the width-based and height-based values, matching
#' what `coord_equal()` actually does when rendering for real.
#'
#' @param plot A ggplot object using `coord_equal()`.
#' @param width_cm,height_cm The dimensions `plot` will be saved at.
#' @return A single number: mm per one data-unit in the rendered panel.
panel_mm_per_data_unit <- function(plot, width_cm, height_cm) {
  grDevices::pdf(NULL, width = width_cm / 2.54, height = height_cm / 2.54)
  gt <- ggplot2::ggplotGrob(plot)
  panel_i <- which(gt$layout$name == "panel")
  panel_col <- gt$layout$l[panel_i]
  panel_row <- gt$layout$t[panel_i]

  other_widths_mm <- sum(vapply(seq_along(gt$widths), function(i) {
    if (i == panel_col) return(0)
    tryCatch(grid::convertWidth(gt$widths[i], "mm", valueOnly = TRUE), error = function(e) 0)
  }, numeric(1)))
  other_heights_mm <- sum(vapply(seq_along(gt$heights), function(i) {
    if (i == panel_row) return(0)
    tryCatch(grid::convertHeight(gt$heights[i], "mm", valueOnly = TRUE), error = function(e) 0)
  }, numeric(1)))
  grDevices::dev.off()

  panel_width_mm <- width_cm * 10 - other_widths_mm
  panel_height_mm <- height_cm * 10 - other_heights_mm

  panel_params <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]
  x_range <- diff(panel_params$x.range)
  y_range <- diff(panel_params$y.range)

  min(panel_width_mm / x_range, panel_height_mm / y_range)
}
