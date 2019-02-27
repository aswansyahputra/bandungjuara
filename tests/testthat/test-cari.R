context("test-cari")

test_that("cari berfungsi", {
  expect_equal(nrow(cari(kata_kunci = "kebakaran")), 9)
})
