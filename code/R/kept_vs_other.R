#' Collapse a top_n_contingency() table to a "kept" vs. "other" comparison
#'
#' Recodes `group_value` down to exactly 2 buckets - `"kept"` (all top-n
#' values of the grouping column together) and `"other"` (everything else
#' together) - then runs `summarise_contingency()` on that collapsed table.
#' That's what answers "for the top n `<group_col>`s, how many distinct
#' `<other_col>` values, and how many isolates fall in the 'other' bucket" -
#' `summarise_contingency()` alone (without this collapse) instead reports
#' one row per *individual* kept value, not the kept set as a whole.
#'
#' @param contingency Output of `top_n_contingency()` (a `group_value` of
#'   `"Other"` marks the values outside the top n; any other value is one of
#'   the top n).
#' @param top_n The top-n threshold used to build `contingency` - recorded on
#'   the output so results from different thresholds can be combined with
#'   `dplyr::bind_rows()` without losing track of which is which.
#' @return A tibble, one row per (`group_col_name` x `"kept"`/`"other"` x
#'   `other_col`): `top_n`, `n_distinct_values`, `n_isolates`, `values`.
kept_vs_other <- function(contingency, top_n) {
  contingency %>%
    dplyr::mutate(group_value = dplyr::if_else(group_value == "Other", "other", "kept")) %>%
    summarise_contingency() %>%
    dplyr::mutate(top_n = top_n, .before = 1)
}
