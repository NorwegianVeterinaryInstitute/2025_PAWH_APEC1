test_that("keeps the n most frequent values and folds the rest into Other", {
  x <- c(rep("a", 5), rep("b", 3), rep("c", 2), "d", "e")
  result <- top_n_other(x, n = 2)
  expect_equal(result, c(rep("a", 5), rep("b", 3), rep("Other", 4)))
})

test_that("uses a custom other_label", {
  x <- c("a", "a", "b")
  result <- top_n_other(x, n = 1, other_label = "Rare")
  expect_equal(result, c("a", "a", "Rare"))
})

test_that("keeps every value unchanged when there are fewer distinct levels than n", {
  x <- c("a", "b", "b", "c")
  result <- top_n_other(x, n = 10)
  expect_equal(result, x)
})

test_that("returns a character vector the same length as the input", {
  x <- c("a", "a", "b", "c", "c", "c")
  result <- top_n_other(x, n = 1)
  expect_type(result, "character")
  expect_length(result, length(x))
})

test_that("NA is folded into other_label rather than preserved as NA", {
  # documents current behaviour: NA can never be "in the top n", so it lands
  # in other_label like any other non-top value - callers with real missing
  # data should filter/impute before grouping if that's not what they want
  x <- c("a", "a", "a", NA)
  result <- top_n_other(x, n = 1)
  expect_equal(result, c("a", "a", "a", "Other"))
})

test_that("factor input is grouped the same way as an equivalent character vector", {
  x_fct <- factor(c("a", "a", "b", "c"))
  x_chr <- as.character(x_fct)
  expect_equal(top_n_other(x_fct, n = 1), top_n_other(x_chr, n = 1))
})

test_that("a 2-way tie for n = 1 keeps exactly one value and folds the other", {
  x <- c("a", "b")
  result <- top_n_other(x, n = 1)
  expect_equal(sum(result == "Other"), 1)
  expect_equal(sum(result != "Other"), 1)
})
