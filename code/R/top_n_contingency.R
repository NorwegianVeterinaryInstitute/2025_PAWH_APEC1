#' Contingency counts for the top-N values of one column vs. other columns
#'
#' Recodes `group_col` in `data` to its top `top_n` most frequent values +
#' `other_label` (via `top_n_other()`), then cross-tabulates isolate counts
#' against each column named in `other_cols`. Long/tidy output so any number
#' of cross variables, and any top-N threshold, work without rewriting the
#' query - e.g. "if I keep the top 5 variants, which ST/Serotype values show
#' up, and how many isolates each" is one call instead of one hand-written
#' block per threshold.
#'
#' @param data A data frame (one row per isolate).
#' @param group_col Name (string) of the column to rank/threshold on, e.g.
#'   `"variant"`.
#' @param top_n Number of top values of `group_col` to keep individually.
#' @param other_cols Character vector of column names to cross-tabulate
#'   against the recoded `group_col`, e.g. `c("ST", "Serotype")`.
#' @param other_label Label used for values of `group_col` outside the top n.
#' @return A tibble with one row per (recoded group value x other_col x
#'   other_value) combination actually observed: `group_col_name` (which
#'   column was thresholded, e.g. `"variant"`), `group_value` (the recoded
#'   value of that column, or `other_label`) - the same name/value pairing
#'   as `other_col`/`other_value` - plus `n_isolates`.
top_n_contingency <- function(data, group_col, top_n, other_cols, other_label = "Other") {

  # return the top n of the group and recode the rest as other
  group_recoded <- top_n_other(data[[group_col]], top_n, other_label = other_label)

  # for each column in other_cols, build its own contingency table (one data
  # frame per column), then stack all of those data frames into one, on top
  # of each other (row-bind) 
  other_cols %>%
    purrr::map(function(col) {
      tibble::tibble(
        group_col_name = group_col,
        group_value = group_recoded,
        other_col = col,
        other_value = data[[col]]
      ) %>%
        dplyr::count(group_col_name, group_value, other_col, other_value, name = "n_isolates")
    }) %>%
    purrr::list_rbind()
}
