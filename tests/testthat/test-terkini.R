context("test-terkini")

test_that("terkini berfungsi", {
  expect_equal(nrow(terkini()), 5)
})
