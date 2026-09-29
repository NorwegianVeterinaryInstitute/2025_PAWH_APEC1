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

fun_files <- list.files(here::here("code", "R"), pattern = "*.R$", full.names = TRUE)
invisible(lapply(fun_files, source))

test_dir(here::here("tests", "testthat"))
