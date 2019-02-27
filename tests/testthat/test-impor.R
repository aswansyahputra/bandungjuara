context("test-impor")

test_that("impor berfungsi", {
  expect_equal(length
               (impor(cari(kata_kunci = "kebakaran"))), 8)
})
