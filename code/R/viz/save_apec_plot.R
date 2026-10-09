#' Save a ggplot with consistent sizing
#' @evfi verified 2026-10-09 ok
#' 
#' Writes to the fixed `results/figures/<stage>/` 
#' script driven by its own `params$figures_dir`, like
#' `TidyData_Visualisation.qmd`) when `dir` is supplied - `dir`
#' overrides `stage` when both are given.
#'
#' @param plot A ggplot object.
#' @param filename Output file name.
#' @param stage "drafts" or "final" - selects `results/figures/<stage>/`.
#'   Ignored if `dir` is supplied.
#' @param dir Explicit output directory (relative to the project root, via
#'   `here::here()`), overriding `stage`. `NULL` by default.
#' @param width,height,units,dpi Passed through to `ggplot2::ggsave()`.
#' @return Invisibly, the return value of `ggplot2::ggsave()`.
save_apec_plot <- function(plot, filename, stage = c("drafts", "final"), dir = NULL,
                            width = 20, height = 14, units = "cm", dpi = 300) {
  out_dir <- if (!is.null(dir)) {
    here::here(dir)
  } else {
    here::here("results", "figures", match.arg(stage))
  }
  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)
  ggplot2::ggsave(
    filename = file.path(out_dir, filename),
    plot = plot, width = width, height = height, units = units,
    dpi = dpi, limitsize = FALSE
  )
}
