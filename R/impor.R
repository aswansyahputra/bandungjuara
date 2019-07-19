#' Impor dataset
#'
#' Fungsi untuk mengimpor dataset hasil pencarian dari fungsi \code{cari()}.
#'
#' @param .data data keluaran dari fungsi \code{cari()} (data dengan kelas bdgjwr)
#'
#' @return dataframe atau list berisi dataframe apabila dataset yang hendak diimpor jumlahnya lebih dari satu.
#'
#' @source Dataset bersumber dari Open Data Kota Bandung \url{http://data.bandung.go.id}.
#'
#' @importFrom readr read_csv
#' @importFrom purrr map map_lgl safely transpose compact pluck
#' @importFrom dplyr select select_if
#' @importFrom janitor clean_names
#' @importFrom tibble deframe
#'
#' @examples
#'
#' library(bandungjuara)
#'
#' kebakaran <- cari(kata_kunci = "kebakaran")
#' kebakaran
#'
#' dataset_kebakaran <- impor(kebakaran)
#' dataset_kebakaran
#'
#' impor(kebakaran[1,])
#'
#' @export
impor <- function(.data){

  if (missing(.data)) {
    stop("Argumen `.data` belum dilengkapi!", call. = FALSE)
  }

    if (is.null(.data)) {
    stop("Hasil pencarian dari fungsi `cari()` tidak dapat digunakan. Silakan gunakan kata kunci lain!", call. = FALSE)
  }

  if (!any(class(.data) == "bdgjwr")) {
    stop("Argumen `.data` bukan merupakan keluaran dari fungsi cari()!", call. = FALSE)
  }

  out <-
    .data %>%
    select(nama, url) %>%
    tibble::deframe() %>%
    map(safely(~suppressWarnings(suppressMessages(read_csv(.x))) %>%
                 janitor::clean_names())) %>%
    transpose()

  if (sum(map_lgl(out$error, ~!is.null(.x))) == 0) {
    message("Semua dataset berhasil diunduh!")
  } else {
    message("Data yang tidak berhasil diunduh:", "\n")
    names(out$error)[map_lgl(out$error, ~!is.null(.x))] %>%
      cat(sep = "\n")
  }

  res <-
    out %>%
    purrr::pluck("result") %>%
    compact() %>%
    map(~select_if(.x, ~mean(!is.na(.x)) > 0.9))

  if (length(res) == 0) {
    res <- NULL
  } else if (length(res) == 1) {
    res <- res[[1]]
  } else if (length(res) > 1) {
    res <- res
  }

  return(res)
}
