test_that("returns an empty, correctly-shaped tibble when fewer than 2 distinct values", {
  result <- check_spelling_homogeneity(c("a", "a", "a"))
  expect_equal(nrow(result), 0)
  expect_named(result, c("value_a", "value_b", "distance", "flag"))
})

test_that("returns an empty tibble for a single value", {
  result <- check_spelling_homogeneity("only one value")
  expect_equal(nrow(result), 0)
})

test_that("flags a case-only duplicate as case_or_whitespace", {
  result <- check_spelling_homogeneity(c("Rowan Ranger", "Rowan ranger", "Ross 308"))
  flagged <- result[result$flag == "case_or_whitespace", ]
  expect_equal(nrow(flagged), 1)
  expect_setequal(c(flagged$value_a, flagged$value_b), c("Rowan Ranger", "Rowan ranger"))
})

test_that("flags whitespace-only variants as case_or_whitespace, all pairs", {
  result <- check_spelling_homogeneity(c("Broiler", "Broiler ", " Broiler"))
  expect_equal(nrow(result), 3)
  expect_true(all(result$flag == "case_or_whitespace"))
  expect_true(all(result$distance == 0))
})

test_that("flags a 1-character difference as possible_typo, within max_dist", {
  result <- check_spelling_homogeneity(c("Kjottproduksjon", "Kjottproduksjan"), max_dist = 2)
  expect_equal(nrow(result), 1)
  expect_equal(result$flag, "possible_typo")
  expect_equal(result$distance, 1)
})

test_that("does not flag pairs further apart than max_dist", {
  result <- check_spelling_homogeneity(c("O1:H4", "O78:H4"), max_dist = 0)
  expect_equal(nrow(result), 0)
})

test_that("max_dist = 0 catches case/whitespace collisions but not near-neighbour codes", {
  # this is the exact reasoning used for ST/Serotype in the tidy-data script:
  # O1:H4 and O1:H7 are different real serotypes, one edit apart, and must
  # NOT be flagged - only a true case/whitespace duplicate should be
  result <- check_spelling_homogeneity(c("O1:H4", "O1:h4", "O1:H7"), max_dist = 0)
  expect_equal(nrow(result), 1)
  expect_equal(result$flag, "case_or_whitespace")
  expect_setequal(c(result$value_a, result$value_b), c("O1:H4", "O1:h4"))
})

test_that("NA values are dropped before comparison, not flagged against anything", {
  result <- check_spelling_homogeneity(c("a", NA, "a", NA))
  expect_equal(nrow(result), 0)
})

test_that("flagged pairs are the same regardless of input order", {
  r1 <- check_spelling_homogeneity(c("apple", "Apple"))
  r2 <- check_spelling_homogeneity(c("Apple", "apple"))
  expect_equal(r1$distance, r2$distance)
  expect_equal(r1$flag, r2$flag)
})
