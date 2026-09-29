# Test runner for the standalone helper functions in code/R/.
# This project is a data-analysis repo, not an R package, so there is no
# DESCRIPTION for testthat to load automatically - source each function file
# explicitly, then run every test-*.R file in tests/testthat/.
#
# Run from the project root with:
#   Rscript tests/testthat.R

source("renv/activate.R")

library(testthat)
library(here)

source(here::here("code", "R", "grouping_helpers.R"))
source(here::here("code", "R", "check_spelling_homogeneity.R"))

test_dir(here::here("tests", "testthat"))
