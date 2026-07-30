#' Shared ggplot2 theme and palettes for APEC1 visualisations
#'
#' Design goals: colorblind-safe, print-friendly, minimal chartjunk,
#' consistent typography/legend placement across all figures in this project.

theme_apec <- function(base_size = 11) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      plot.title = ggplot2::element_text(face = "bold", size = ggplot2::rel(1.1)),
      plot.subtitle = ggplot2::element_text(color = "grey30", size = ggplot2::rel(0.95)),
      plot.caption = ggplot2::element_text(color = "grey45", size = ggplot2::rel(0.75), hjust = 0),
      axis.title = ggplot2::element_text(color = "grey20"),
      legend.position = "bottom",
      legend.title = ggplot2::element_text(size = ggplot2::rel(0.85)),
      strip.text = ggplot2::element_text(face = "bold")
    )
}

# Okabe-Ito: colorblind-safe qualitative palette, up to 8 categories
palette_qual <- c(
  "#E69F00", "#56B4E9", "#009E73", "#F0E442",
  "#0072B2", "#D55E00", "#CC79A7", "#999999"
)

# Save a plot to both draft and (optionally) final locations with consistent sizing
save_apec_plot <- function(plot, filename, stage = c("drafts", "final"),
                            width = 20, height = 14, units = "cm", dpi = 300) {
  stage <- match.arg(stage)
  out_dir <- here::here("results", "figures", stage)
  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)
  ggplot2::ggsave(
    filename = file.path(out_dir, filename),
    plot = plot, width = width, height = height, units = units,
    dpi = dpi, limitsize = FALSE
  )
}
