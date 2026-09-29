#' Save a ggplot to this script's draft figures directory (params$figures_dir)
#'
#' Companion to `save_apec_plot()` (`code/R/viz/theme_apec.R`), which writes to
#' the fixed `results/figures/drafts|final` path used by `2_visualisation.qmd`.
#' This one is for `20260929_TidyData_Visualisation.qmd`, whose figures
#' directory is a run parameter (`params$figures_dir`) rather than a fixed
#' path, so it looks that parameter up at call time instead of hard-coding it.
#'
#' @param plot A ggplot object.
#' @param filename Output file name, written into `params$figures_dir`.
#' @param width,height,units,dpi Passed through to `ggplot2::ggsave()`.
#' @return Invisibly, the return value of `ggplot2::ggsave()`.
save_draft_plot <- function(plot, filename, width = 22, height = 16, units = "cm", dpi = 300) {
  ggplot2::ggsave(
    filename = file.path(here::here(params$figures_dir), filename),
    plot = plot, width = width, height = height, units = units,
    dpi = dpi, limitsize = FALSE
  )
}
