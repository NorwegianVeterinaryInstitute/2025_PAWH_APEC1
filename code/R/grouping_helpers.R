#' Collapse a vector to its n most frequent values, folding the rest into "Other"
#'
#' @param x A character/factor vector.
#' @param n Number of top levels to keep individually.
#' @param other_label Label used for every value outside the top n (this
#'   includes `NA`: a missing value is never itself in the top n, so it is
#'   relabelled to `other_label` rather than staying `NA` - call
#'   `stopifnot(!anyNA(x))` first if that would be misleading for a column).
#' @return A character vector, same length as x.
top_n_other <- function(x, n = 5, other_label = "Other") {
  freq_order <- names(sort(table(x), decreasing = TRUE))
  top_levels <- freq_order[seq_len(min(n, length(freq_order)))]
  dplyr::if_else(x %in% top_levels, x, other_label)
}
