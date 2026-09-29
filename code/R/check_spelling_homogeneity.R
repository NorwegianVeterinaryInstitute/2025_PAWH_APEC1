#' Flag likely spelling/typo inconsistencies within a categorical column
#'
#' Compares every pair of distinct values (case-insensitive, whitespace-trimmed):
#' pairs identical after trimming/casefolding are flagged "case_or_whitespace"
#' (safe to auto-fix), pairs within `max_dist` edit distance are flagged
#' "possible_typo" (needs a human to confirm whether they are the same category
#' or genuinely different, e.g. two real serotypes one edit apart).
#'
#' @param x A character vector (one column).
#' @param max_dist Maximum Levenshtein distance to flag as a possible typo.
#' @return A tibble: value_a, value_b, distance, flag. Empty if nothing is flagged.
#' NOTE: not sure I will use it - will have additional check
check_spelling_homogeneity <- function(x, max_dist = 2) {
  vals <- sort(unique(x[!is.na(x)]))
  if (length(vals) < 2) {
    return(tibble::tibble(value_a = character(), value_b = character(),
                           distance = integer(), flag = character()))
  }

  casefold_vals <- tolower(trimws(vals))
  pairs <- utils::combn(seq_along(vals), 2, simplify = FALSE)

  purrr::map_dfr(pairs, function(idx) {
    i <- idx[1]; j <- idx[2]
    d <- utils::adist(casefold_vals[i], casefold_vals[j])[1, 1]
    if (d > max_dist) return(NULL)
    tibble::tibble(
      value_a = vals[i],
      value_b = vals[j],
      distance = d,
      flag = if (casefold_vals[i] == casefold_vals[j]) "case_or_whitespace" else "possible_typo"
    )
  })
}
