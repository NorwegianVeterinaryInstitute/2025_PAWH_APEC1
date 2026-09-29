test_data <- tibble::tibble(
  variant = c("A-1", "A-1", "A-1", "B-2", "B-2", "C-3", "D-4", "E-5"),
  ST = c("A", "A", "A", "B", "B", "C", "D", "E"),
  Serotype = c("1", "1", "1", "2", "2", "3", "4", "5")
)

test_that("counts distinct other_values and total isolates per group", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  result <- summarise_contingency(contingency)

  a1_row <- result[result$group_value == "A-1", ]
  expect_equal(a1_row$n_distinct_values, 1)  # only ST "A"
  expect_equal(a1_row$n_isolates, 3)

  other_row <- result[result$group_value == "Other", ]
  expect_equal(other_row$n_distinct_values, 3)  # C, D, E
  expect_equal(other_row$n_isolates, 3)
})

test_that("lists the actual distinct values, sorted", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = "ST")
  result <- summarise_contingency(contingency)

  other_row <- result[result$group_value == "Other", ]
  expect_equal(other_row$values, "C, D, E")
})

test_that("handles multiple other_cols independently", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 2, other_cols = c("ST", "Serotype"))
  result <- summarise_contingency(contingency)

  expect_setequal(result$other_col, c("ST", "Serotype"))
  expect_equal(nrow(result), 6)  # 3 groups (A-1, B-2, Other) x 2 other_cols
})

test_that("a group with a single repeated value reports n_distinct_values = 1", {
  contingency <- top_n_contingency(test_data, "variant", top_n = 5, other_cols = "ST")
  result <- summarise_contingency(contingency)

  b2_row <- result[result$group_value == "B-2", ]
  expect_equal(b2_row$n_distinct_values, 1)
  expect_equal(b2_row$n_isolates, 2)
})
