#' How many mm one data-unit occupies in a rendered, coord_equal() panel
#' @evfi verified 2026-10-09 - appears ok - plot adjustment no data modif
#' 
#' For a `coord_equal()` plot, ggplot fits the panel into whichever of
#' width/height is the tighter constraint - the same data-unit can render at
#' very different physical sizes depending on that, so this can't be worked
#' out from the requested save width/height alone (they're rarely both the
#' binding constraint). 
#' 
#' This renders `plot` once, off-screen, at the exact
#' size it will be saved at, and measures the actual panel size: all
#' non-panel columns/rows (axis text, titles, legend, margins) have
#' resolvable absolute sizes even without drawing, 
#' so panel size = total size minus those 
#' then mm-per-unit = panel size / data range, taking the
#' smaller (tighter) of the width-based and height-based values, matching
#' what `coord_equal()` actually does when rendering for real.
#'
#' @param plot A ggplot object using `coord_equal()`.
#' @param width_cm,height_cm The dimensions `plot` will be saved at.
#' @return A single number: mm per one data-unit in the rendered panel.
panel_mm_per_data_unit <- function(plot, width_cm, height_cm) {
  # Open an off-screen device at the real save size. Needed because some
  # gtable units are relative ("1null" = "whatever's left over") and can
  # only be resolved to an absolute mm value once a device of a known size
  # is active - there's nothing drawn to screen/file, this is measurement only.
  grDevices::pdf(NULL, width = width_cm / 2.54, height = height_cm / 2.54)

  # ggplotGrob() lays the whole plot out as a grid of cells (gtable): panel,
  # axis titles, axis text, legend, margins, etc, each its own row/column.
  gt <- ggplot2::ggplotGrob(plot)

  # Find which row/column of that grid is the actual data panel, so it can
  # be excluded from the "everything else" sums below. (l = left column
  # index, t = top row index, gtable's own naming.)
  panel_i <- which(gt$layout$name == "panel")
  panel_col <- gt$layout$l[panel_i]
  panel_row <- gt$layout$t[panel_i]

  # Sum the mm width of every column EXCEPT the panel (axis text, axis
  # title, legend, margins, ...). convertWidth(..., "mm") turns each
  # column's grid unit into an absolute mm number now that a sized device
  # is open; tryCatch because a handful of gtable's zero-size spacer rows
  # can't be converted and should just contribute 0.
  other_widths_mm <- sum(vapply(seq_along(gt$widths), function(i) {
    if (i == panel_col) return(0)
    tryCatch(grid::convertWidth(gt$widths[i], "mm", valueOnly = TRUE), error = function(e) 0)
  }, numeric(1)))
  # Same idea, but summing row heights instead of column widths.
  other_heights_mm <- sum(vapply(seq_along(gt$heights), function(i) {
    if (i == panel_row) return(0)
    tryCatch(grid::convertHeight(gt$heights[i], "mm", valueOnly = TRUE), error = function(e) 0)
  }, numeric(1)))
  grDevices::dev.off()  # done measuring, close the off-screen device

  # Panel's own physical size = total requested size minus everything else
  # that shares the page with it (legend, axis text, margins, ...).
  panel_width_mm <- width_cm * 10 - other_widths_mm
  panel_height_mm <- height_cm * 10 - other_heights_mm

  # The panel's size in DATA units (e.g. "8.5 units wide"), as ggplot
  # actually computed it (after coord_equal(), scale expansion, etc) - the
  # counterpart to the physical mm size just computed above.
  panel_params <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]
  x_range <- diff(panel_params$x.range)
  y_range <- diff(panel_params$y.range)

  # mm-per-data-unit, computed separately from width and from height - take
  # whichever is SMALLER (tighter). This mirrors exactly what coord_equal()
  # does when it actually renders: one of the two dimensions is the binding
  # constraint (1 x-unit forced to equal 1 y-unit), and the other dimension
  # ends up with extra blank padding to compensate.
  min(panel_width_mm / x_range, panel_height_mm / y_range)
}
