#' Total number of distinct values per column, across a data frame
#'
#' Companion to `top_n_contingency()`/`summarise_contingency()`: their
#' `n_distinct_values` is only meaningful next to "distinct out of how many
#' overall" - this computes that denominator once per column, up front.
#'
#' @param data A data frame.
#' @param cols Character vector of column names to count distinct values for.
#' @return A tibble: `other_col` (from `cols`), `n_total_distinct`.
total_distinct_values <- function(data, cols) {
  tibble::tibble(
    other_col = cols,
    n_total_distinct = purrr::map_int(cols, ~ dplyr::n_distinct(data[[.x]]))
  )
}
