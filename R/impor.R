#' Impor dataset
#'
#' Fungsi untuk mengimpor dataset hasil pencarian dari fungsi \code{cari()}.
#'
#' @param .data data keluaran dari fungsi \code{cari()} (data dengan kelas bdgjwr)
#'
#' @return dataframe atau list berisi dataframe apabila dataset yang hendak diimpor jumlahnya lebih dari satu.
#'
#' @source Dataset bersumber dari Open Data Bandung \url{http://data.bandung.go.id}.
#'
#' @import dplyr purrr
#' @importFrom janitor clean_names
#'
#' @export
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
    stop("argumen `.data` belum dilengkapi!", call. = FALSE)
  }

  if (!any(class(.data) == "bdgjwr")) {
    stop("argumen `.data` bukan merupakan keluaran dari fungsi cari()!", call. = FALSE)
  }

  out <- .data %>%
    pull(url) %>%
    map(safely(~suppressMessages(read_csv(.x)) %>%
                 janitor::clean_names())) %>%
    `names<-`(.data[["nama"]]) %>%
    transpose()

  if (sum(map_lgl(out$error, ~!is.null(.x))) == 0) {
    cat("Semua dataset berhasil diunduh!")
  } else {
    cat("Data yang tidak berhasil diunduh:", "\n")
    names(out$error)[map_lgl(out$error, ~!is.null(.x))] %>%
      cat(sep = "\n")
  }

  res <- out$result[map_lgl(out$result, ~!is.null(.x))]
  if (length(res) > 1) {
    invisible(res)
  } else if (length(res) == 1) {
    return(res[[1]])
  } else if (length(res) == 0) {
    res <- NULL
    invisible(res)
  }
}
