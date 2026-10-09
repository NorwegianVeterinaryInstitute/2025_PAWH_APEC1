#' Collapse a vector to its n most frequent values, folding the rest into "Other"
#' @evfi 20261005 ok
#' 
#' @param x A character/factor vector.
#' @param n Number of top levels to keep individually.
#' @param other_label Label used for every non-missing value outside the top n.
#' @return A character vector, same length as x. `NA` in `x` stays `NA` - it's
#'   "unknown", not "known but rare", so it is left alone rather than folded
#'   into `other_label` (matches `forcats::fct_lump()`'s convention).
top_n_other <- function(x, n = 5, other_label = "Other") {
  freq_order <- names(sort(table(x), decreasing = TRUE))
  top_levels <- freq_order[seq_len(min(n, length(freq_order)))]
  dplyr::case_when(
    is.na(x) ~ NA_character_,
    x %in% top_levels ~ as.character(x),
    TRUE ~ other_label
  )
}
