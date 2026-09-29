test_data <- tibble::tibble(
  variant = c("A-1", "A-1", "A-1", "B-2", "B-2", "C-3", "D-4", "E-5"),
  ST = c("A", "A", "A", "B", "B", "C", "D", "E"),
  Serotype = c("1", "1", "1", "2", "2", "3", "4", "5")
)

test_that("returns one row per observed (group_value x other_col x other_value) combination", {
  result <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  # top 2 variants by count: A-1 (n=3), B-2 (n=2); rest -> "Other"
  expect_setequal(result$group_value, c("A-1", "B-2", "Other"))
  expect_equal(sum(result$n_isolates), nrow(test_data))
})

test_that("counts are correct for a known top-n threshold", {
  result <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  a1_row <- result[result$group_value == "A-1" & result$other_value == "A", ]
  expect_equal(a1_row$n_isolates, 3)

  other_total <- sum(result$n_isolates[result$group_value == "Other"])
  expect_equal(other_total, 3)  # C-3, D-4, E-5 -> 1 isolate each
})

test_that("handles multiple other_cols in one call", {
  result <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = c("ST", "Serotype"))
  expect_setequal(result$other_col, c("ST", "Serotype"))
  # each other_col should independently sum to the full row count
  totals_by_col <- tapply(result$n_isolates, result$other_col, sum)
  expect_equal(unname(totals_by_col["ST"]), nrow(test_data))
  expect_equal(unname(totals_by_col["Serotype"]), nrow(test_data))
})

test_that("group_col_name records which column was thresholded", {
  result <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  expect_true(all(result$group_col_name == "variant"))
})

test_that("respects a custom other_label", {
  result <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST", other_label = "Rare")
  expect_true("Rare" %in% result$group_value)
  expect_false("Other" %in% result$group_value)
})

test_that("top_n greater than the number of distinct groups keeps everything", {
  result <- top_n_contingency(test_data, "variant", top_n = 100, other_cols = "ST")
  expect_false("Other" %in% result$group_value)
  expect_equal(sum(result$n_isolates), nrow(test_data))
})
