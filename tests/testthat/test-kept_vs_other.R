test_data <- tibble::tibble(
  variant = c("A-1", "A-1", "A-1", "B-2", "B-2", "C-3", "D-4", "E-5"),
  ST = c("A", "A", "A", "B", "B", "C", "D", "E")
)

test_that("collapses to exactly the kept/other buckets", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  result <- kept_vs_other(contingency, top_n = 2)
  expect_setequal(result$group_value, c("kept", "other"))
})

test_that("kept and other isolate counts are correct", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  result <- kept_vs_other(contingency, top_n = 2)

  kept_row <- result[result$group_value == "kept", ]
  other_row <- result[result$group_value == "other", ]
  expect_equal(kept_row$n_isolates, 5)   # A-1 (3) + B-2 (2)
  expect_equal(other_row$n_isolates, 3)  # C-3, D-4, E-5
  expect_equal(kept_row$n_distinct_values, 2)  # ST A, B
  expect_equal(other_row$n_distinct_values, 3) # ST C, D, E
})

test_that("records the top_n it was called with", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  result <- kept_vs_other(contingency, top_n = 2)
  expect_true(all(result$top_n == 2))
})

test_that("results from different thresholds stay distinguishable after bind_rows", {
  c5 <- top_n_contingency(test_data, "variant", top_n = 1, other_cols = "ST")
  c10 <- top_n_contingency(test_data, "variant", top_n = 3, other_cols = "ST")
  combined <- dplyr::bind_rows(kept_vs_other(c5, 1), kept_vs_other(c10, 3))
  expect_setequal(combined$top_n, c(1, 3))
  expect_equal(nrow(combined), 4)  # 2 thresholds x 2 buckets (kept/other)
})
