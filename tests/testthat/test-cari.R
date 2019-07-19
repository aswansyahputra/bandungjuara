context("test-cari")

test_that("cari berfungsi", {
  expect_error(cari())
  expect_error(cari(kata_kunci = "a"))
  expect_warning(cari(kata_kunci = "sepeda"))
  expect_is(cari(kata_kunci = "kebakaran"), "data.frame")
})
