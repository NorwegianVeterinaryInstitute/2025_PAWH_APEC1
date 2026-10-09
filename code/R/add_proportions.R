#' Attach isolate-count and distinct-value-count percentages to a kept/other summary
#' @evfi verified 2026-10-09 - was only used for data exploration and choice how 
#' to display - reverified
#' 
#' Counts alone don't say whether that's a lot or a little - this attaches
#' the two proportions that actually matter for picking a top-N threshold:
#' `pct_isolates` (share of all isolates in this bucket) and
#' `pct_distinct_values` (share of all distinct values of `other_col` this
#' bucket represents). A bucket can hold most of the isolates while
#' representing almost none of the underlying diversity, or vice versa.
#'
#' @param threshold_summary A tibble with `top_n`, `other_col`, `group_value`,
#'   `n_isolates`, `n_distinct_values` - the output of `kept_vs_other()`.
#' @param total_distinct Output of `total_distinct_values()`: `other_col`,
#'   `n_total_distinct` - total distinct values per `other_col` across the
#'   full dataset.
#' @param n_total_isolates Total number of isolates/rows in the full dataset.
#' @return `threshold_summary` with `pct_isolates` and `pct_distinct_values`
#'   added, keeping only the columns relevant for reading the comparison.
add_proportions <- function(threshold_summary, total_distinct, n_total_isolates) {
  threshold_summary %>%
    dplyr::left_join(total_distinct, by = "other_col") %>%
    dplyr::mutate(
      pct_isolates = round(100 * n_isolates / n_total_isolates, 1),
      pct_distinct_values = round(100 * n_distinct_values / n_total_distinct, 1)
    ) %>%
    dplyr::select(top_n, other_col, group_value, n_isolates, pct_isolates, n_distinct_values, pct_distinct_values)
}
