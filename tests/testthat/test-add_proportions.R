threshold_summary <- tibble::tibble(
  top_n = c(2, 2),
  other_col = c("ST", "ST"),
  group_value = c("kept", "other"),
  n_isolates = c(5, 3),
  n_distinct_values = c(2, 3)
)

total_distinct <- tibble::tibble(
  other_col = "ST",
  n_total_distinct = 5
)

test_that("computes pct_isolates against the given total", {
  result <- add_proportions(threshold_summary, total_distinct, n_total_isolates = 8)
  expect_equal(result$pct_isolates, c(62.5, 37.5))
})

test_that("computes pct_distinct_values against the matching other_col total", {
  result <- add_proportions(threshold_summary, total_distinct, n_total_isolates = 8)
  expect_equal(result$pct_distinct_values, c(40, 60))
})

test_that("joins the right total_distinct row per other_col", {
  two_col_summary <- tibble::tibble(
    top_n = c(1, 1),
    other_col = c("ST", "Serotype"),
    group_value = c("kept", "kept"),
    n_isolates = c(4, 4),
    n_distinct_values = c(2, 3)
  )
  two_col_totals <- tibble::tibble(
    other_col = c("ST", "Serotype"),
    n_total_distinct = c(10, 20)
  )
  result <- add_proportions(two_col_summary, two_col_totals, n_total_isolates = 8)
  expect_equal(result$pct_distinct_values[result$other_col == "ST"], 20)
  expect_equal(result$pct_distinct_values[result$other_col == "Serotype"], 15)
})

test_that("keeps only the expected columns", {
  result <- add_proportions(threshold_summary, total_distinct, n_total_isolates = 8)
  expect_named(result, c(
    "top_n", "other_col", "group_value",
    "n_isolates", "pct_isolates", "n_distinct_values", "pct_distinct_values"
  ))
})
