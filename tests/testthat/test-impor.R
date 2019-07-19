context("test-impor")

test_that("impor berfungsi", {
  expect_error(impor())
  expect_error(impor(.data = NULL))
  expect_error(impor(.data = mtcars))
  expect_is(impor(cari(kata_kunci = "kebakaran")[1,]), "data.frame")
})
