#' Collapse a top_n_contingency() table to unique-value counts per group
#'
#' Answers "if I group by X, how many different values of Y (and Z, ...)
#' show up in each group" - not just how many rows the long contingency
#' table has.
#'
#' @param contingency_table Output of `top_n_contingency()` (or any tibble
#'   with `group_col_name`, `group_value`, `other_col`, `other_value`,
#'   `n_isolates` columns).
#' group_value represent the different values of the grouping variable eg. variant
#' other_col represent the different columns that were used eg. serotype, ST (its long format)
#' other_value represent the orginal value in the other_col eg ST23, O78:H4
#' @return A tibble, one row per (group_col_name x group_value x other_col):
#'   `n_distinct_values` (how many distinct `other_value`s occur),
#'   `n_isolates` (total isolates in that group) and `values` (those
#'   distinct values, sorted and comma-joined).
summarise_contingency <- function(contingency_table) {
  contingency_table %>%
    # grouping by top n column and other variables we want to count distinct values for
    dplyr::group_by(group_col_name, group_value, other_col) %>%
    # group value represent either the top n values or `Other`
    dplyr::summarise(
      n_distinct_values = dplyr::n_distinct(other_value),
      n_isolates = sum(n_isolates),
      values = paste(sort(unique(other_value)), collapse = ", "),
      .groups = "drop"
    )
}
