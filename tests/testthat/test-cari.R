context("test-cari")

test_that("cari berfungsi", {
  expect_error(cari())
  expect_error(cari(kata_kunci = "a"))
  expect_warning(cari(kata_kunci = "sepeda"))
  expect_equal(nrow(cari(kata_kunci = "kebakaran")), 9)
})
