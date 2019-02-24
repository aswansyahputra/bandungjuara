
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bandungjuara

Paket `bandungjuara` merupakan antarmuka Open Data Bandung dan (akan)
berisi aplikasi shiny mengenai Kota Bandung.

## Cara pemasangan

``` r
remotes::install_github("aswansyahputra/bandungjuara")
```

## Contoh

``` r
library(bandungjuara)
library(tibble)

smp <- cari(kata_kunci = "smp")
data_smp <- impor(.data = smp)
#> Data yang tidak berhasil diunduh: 
#> Data Jumlah Guru di SMP Negeri Kota Bandung Tahun 2018
#> Data Kondisi Ruangan Kelas SMP Negeri Kota Bandung Tahun 2018
#> Data SD dan SMP Negeri di Kota Bandung - 2017
#> Data Jumlah Guru Dan Murid SMP Kota Bandung Tahun 2014
#> Data Jumlah Pegawai TU di SMP Negeri Kota Bandung Tahun 2018
#> Data Hasil Ujian Nasional SMP Negeri tahun 2015
#> Data SD dan SMP Swasta di Kota Bandung Tahun 2017
#> Data Jumlah Guru di SMP Swasta Kota Bandung Tahun 2018
#> Data Kondisi Ruangan Kelas SMP Swasta Kota Bandung Tahun 2018
#> Data Jumlah Guru Dan Murid SMP Kota Bandung Tahun 2016
#> Data Jumlah Pegawai TU di SMP Swasta Kota Bandung Tahun 2018
#> Data Hasil Ujian Nasional SMP Negeri tahun 2016
#> Data Jumlah Guru Dan Murid SMP Kota Bandung Tahun 2017
#> Data Hasil Ujian Nasional SMP Negeri tahun 2017
```

## Ucapan terimakasih

Proyek ini dapat terlaksana atas upaya data terbuka yang tersaji di
[Open Data
Bandung](http://data.bandung.go.id)

## Lisensi

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />Hasil
karya ini memiliki lisensi
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative
Commons Attribution-ShareAlike 4.0 International License</a>.
