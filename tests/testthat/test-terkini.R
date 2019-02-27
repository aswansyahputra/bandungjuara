context("test-terkini")

test_that("terkini berfungsi", {
  expect_error(terkini(n = 0))
  expect_error(terkini(berdasarkan = "diunggah"))
  expect_equal(nrow(terkini()), 5)
})
