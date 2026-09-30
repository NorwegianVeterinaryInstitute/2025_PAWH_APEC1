test_data <- tibble::tibble(
  ST = c("A", "A", "B", "C"),
  Serotype = c("1", "2", "2", "3")
)

test_that("counts distinct values per requested column", {
  result <- total_distinct_values(test_data, c("ST", "Serotype"))
  expect_equal(result$n_total_distinct[result$other_col == "ST"], 3)
  expect_equal(result$n_total_distinct[result$other_col == "Serotype"], 3)
})

test_that("works for a single column", {
  result <- total_distinct_values(test_data, "ST")
  expect_equal(nrow(result), 1)
  expect_equal(result$n_total_distinct, 3)
})

test_that("output has one row per requested column, in order", {
  result <- total_distinct_values(test_data, c("Serotype", "ST"))
  expect_equal(result$other_col, c("Serotype", "ST"))
})
