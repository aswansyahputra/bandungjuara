context("test-impor")

test_that("impor berfungsi", {
  expect_error(impor())
  expect_error(impor(.data = NULL))
  expect_error(impor(.data = mtcars))
  # expect_equal(impor(cari(kata_kunci = "kebakaran")[1, ]), NULL)
  expect_equal(nrow
               (impor(cari(kata_kunci = "ujian nasional")[1, ])), 53)
  expect_equal(length
               (impor(cari(kata_kunci = "ujian nasional"))), 3)
})
