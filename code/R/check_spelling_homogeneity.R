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
#' NOTE: @evfi 2026105 - reviewed and made it simplier - so each step is understandable. 
check_spelling_homogeneity <- function(x, max_dist = 2) {
  # NA must be checked separately (done)
  vals <- sort(unique(x[!is.na(x)]))

  if (length(vals) < 2) {
    return(tibble::tibble(value_a = character(), value_b = character(),
                          distance = integer(), flag = character()))
  }
  # removes leading/trailing whitespace and casefolds for comparison
  casefold_vals <- tolower(trimws(vals))

  # step 1: every pairwise distance at once - dist_matrix[a, b] is the edit
  # distance between casefold_vals[a] and casefold_vals[b]. 
  dist_matrix <- utils::adist(casefold_vals)

  # step 2: the (i, j) position of every pair to compare, each pair exactly
  # once (combn() never pairs a value with itself or repeats a pair reversed)
  pair_idx <- utils::combn(seq_along(vals), 2)
  i <- pair_idx[1, ]
  j <- pair_idx[2, ]

  # step 3: look up each pair's distance by position - distances[k] is the
  # distance for the k-th pair (i[k], j[k])
  distances <- dist_matrix[cbind(i, j)]

  # step 4: keep only the pairs close enough to be a possible typo
  keep <- distances <= max_dist
  i <- i[keep]
  j <- j[keep]
  distances <- distances[keep]

  # step 5: build the result table - one row per kept pair
  tibble::tibble(
    value_a = vals[i],
    value_b = vals[j],
    distance = distances,
    flag = dplyr::if_else(
      casefold_vals[i] == casefold_vals[j], "case_or_whitespace", "possible_typo"
    )
  )
}
