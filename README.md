
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bandungjuara

[![Travis build
status](https://travis-ci.org/aswansyahputra/bandungjuara.svg?branch=master)](https://travis-ci.org/aswansyahputra/bandungjuara)

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

Paket `bandungjuara` merupakan antarmuka Open Data Bandung dan (akan)
berisi aplikasi shiny mengenai Kota Bandung.

## Cara Pemasangan

``` r
remotes::install_github("aswansyahputra/bandungjuara")
```

## Contoh

``` r
library(bandungjuara)
library(tibble)

smp <- cari(kata_kunci = "smp")
data_smp <- impor(.data = smp)
#> Semua dataset berhasil diunduh!
data_smp
#> $`Data Jumlah Guru di SMP Negeri Kota Bandung Tahun 2018`
#> # A tibble: 57 x 4
#>    nama_kecamatan   nama_sekolah  jumlah_laki_laki jumlah_perempuan
#>    <chr>            <chr>                    <dbl>            <dbl>
#>  1 Cicendo          SMP NEGERI 1                25               42
#>  2 Regol            SMP NEGERI 10               23               31
#>  3 Regol            SMP NEGERI 11               20               48
#>  4 Sukasari         SMP NEGERI 12               21               35
#>  5 Lengkong         SMP NEGERI 13               26               41
#>  6 Bandung Wetan    SMP NEGERI 14               16               35
#>  7 Sukasari         SMP NEGERI 15               18               25
#>  8 Cibeunying Kaler SMP NEGERI 16               24               27
#>  9 Arcamanik        SMP NEGERI 17               18               42
#> 10 Buahbatu         SMP NEGERI 18               22               45
#> # … with 47 more rows
#> 
#> $`Data Kondisi Ruangan Kelas SMP Negeri Kota Bandung Tahun 2018`
#> # A tibble: 57 x 7
#>    nama_kecamatan nama_sekolah  baik rusak_ringan rusak_sedang rusak_berat
#>    <chr>          <chr>        <dbl>        <dbl>        <dbl>       <dbl>
#>  1 Cicendo        SMP NEGERI 1     0           20           16           0
#>  2 Regol          SMP NEGERI …     2           18            0           0
#>  3 Regol          SMP NEGERI …     8           19            0           0
#>  4 Sukasari       SMP NEGERI …     5            8           14           0
#>  5 Lengkong       SMP NEGERI …     0           32            0           0
#>  6 Bandung Wetan  SMP NEGERI …     0           20            4           0
#>  7 Sukasari       SMP NEGERI …    15            5            0           0
#>  8 Cibeunying Ka… SMP NEGERI …     2            9            0          26
#>  9 Arcamanik      SMP NEGERI …     0           27            3           0
#> 10 Buahbatu       SMP NEGERI …    15           15            1           0
#> # … with 47 more rows, and 1 more variable: jumlah_ruangan <dbl>
#> 
#> $`Data SD dan SMP Negeri di Kota Bandung - 2017`
#> # A tibble: 333 x 6
#>    tahun nama_sekolah jenjang_pendidi… lokasi_sekolah kecamatan_sekol…
#>    <dbl> <chr>        <chr>            <chr>          <chr>           
#>  1  2017 SDN Awigomb… Sekolah Dasar    Jl. Asep Berl… Cibeunying Kidul
#>  2  2017 SDN Cicadas… Sekolah Dasar    Jl. Asep Berl… Cibeunying Kidul
#>  3  2017 SDN 001 Mer… Sekolah Dasar    Jl. Merdeka N… Sumur Bandung   
#>  4  2017 SDN 002 Kar… Sekolah Dasar    Jl. Rajawali … Andir           
#>  5  2017 SDN 003 Pag… Sekolah Dasar    Jl. Pagarsih … Astanaanyar     
#>  6  2017 SDN 004 Cis… Sekolah Dasar    Jl. Cisarante… Arcamanik       
#>  7  2017 SDN 005 Bab… Sekolah Dasar    Jl. Kopo No. … Babakan Ciparay 
#>  8  2017 SDN 006 Bua… Sekolah Dasar    Jl. H. Ibrahi… Buahbatu        
#>  9  2017 SDN 007 Cip… Sekolah Dasar    Jl. Sastra No… Coblong         
#> 10  2017 SDN 008 Moh… Sekolah Dasar    Jl. Mohamad T… Regol           
#> # … with 323 more rows, and 1 more variable: kelurahan_sekolah <chr>
#> 
#> $`Data Jumlah Guru Dan Murid SMP Kota Bandung Tahun 2014`
#> # A tibble: 30 x 5
#>    kecamatan       guru_negeri guru_swasta murid_negeri murid_swasta
#>    <chr>           <chr>             <dbl> <chr>               <dbl>
#>  1 Bandung Kulon   -                   141 -                    2.28
#>  2 Babakan Ciparay 163                  40 3.427              522   
#>  3 Bojongloa Kaler 128                 168 2.82                 2.27
#>  4 Bojongloa Kidul 67                  112 712                840   
#>  5 Astanaanyar     65                   79 992                990   
#>  6 R e g o l       232                 265 4.405                3.87
#>  7 Lengkong        103                 251 1.897                2.19
#>  8 Bandung Kidul   39                   73 981                583   
#>  9 Buah Batu       145                  66 1.954              845   
#> 10 Rancasari       167                  13 2.851               61   
#> # … with 20 more rows
#> 
#> $`Data Jumlah Pegawai TU di SMP Negeri Kota Bandung Tahun 2018`
#> # A tibble: 57 x 4
#>    kecamatan        nama_sekolah  jumlah_laki_laki jumlah_perempuan
#>    <chr>            <chr>                    <dbl>            <dbl>
#>  1 Cicendo          SMP NEGERI 1                 7                3
#>  2 Regol            SMP NEGERI 10                7                2
#>  3 Regol            SMP NEGERI 11                7                5
#>  4 Sukasari         SMP NEGERI 12                7                3
#>  5 Lengkong         SMP NEGERI 13               11                2
#>  6 Bandung Wetan    SMP NEGERI 14                7                4
#>  7 Sukasari         SMP NEGERI 15                4                3
#>  8 Cibeunying Kaler SMP NEGERI 16               10                2
#>  9 Arcamanik        SMP NEGERI 17                9                3
#> 10 Buahbatu         SMP NEGERI 18               11                6
#> # … with 47 more rows
#> 
#> $`Data Hasil Ujian Nasional SMP Negeri tahun 2015`
#> # A tibble: 53 x 10
#>      npsn nama_sekolah nama_wilayah nama_kecamatan nama_kelurahan tahun
#>     <dbl> <chr>        <chr>        <chr>          <chr>          <dbl>
#>  1 2.02e7 SMP NEGERI 1 Bojonagara   Cicendo        Arjuna          2015
#>  2 2.02e7 SMP NEGERI … Karees       Regol          Pungkur         2015
#>  3 2.02e7 SMP NEGERI … Karees       Regol          Ciateul         2015
#>  4 2.02e7 SMP NEGERI … Bojonagara   Sukasari       Gegerkalong     2015
#>  5 2.02e7 SMP NEGERI … Karees       Lengkong       Turangga        2015
#>  6 2.02e7 SMP NEGERI … Cibeunying   Bandung Wetan  Cihapit         2015
#>  7 2.02e7 SMP NEGERI … Bojonagara   Sukasari       Gegerkalong     2015
#>  8 2.02e7 SMP NEGERI … Cibeunying   Cibeunying Ka… Neglasari       2015
#>  9 2.02e7 SMP NEGERI … Arcamanik    Arcamanik      Sukamiskin      2015
#> 10 2.02e7 SMP NEGERI … Kordon       Buahbatu       Margasari       2015
#> # … with 43 more rows, and 4 more variables:
#> #   nilai_rerata_bahasa_indonesia <dbl>,
#> #   nilai_rerata_bahasa_inggris <dbl>, nilai_rerata_matematika <dbl>,
#> #   nilai_rerata_ipa <dbl>
#> 
#> $`Data SD dan SMP Swasta di Kota Bandung Tahun 2017`
#> # A tibble: 389 x 3
#>    nama_kecamatan   jenjang       nama_sekolah        
#>    <chr>            <chr>         <chr>               
#>  1 Cicendo          Sekolah Dasar SD 1 KRISTEN PAULUS 
#>  2 Sumur Bandung    Sekolah Dasar SD 3 KRISTEN PAULUS 
#>  3 Mandalajati      Sekolah Dasar SD ABU AZIS         
#>  4 Andir            Sekolah Dasar SD ADVENT CIMINDI   
#>  5 Coblong          Sekolah Dasar SD ADVENT II BANDUNG
#>  6 Sumur Bandung    Sekolah Dasar SD ADVENT NARIPAN   
#>  7 Cidadap          Sekolah Dasar SD ADZKIA           
#>  8 Sumur Bandung    Sekolah Dasar SD AL AZHAR 36      
#>  9 Babakan Ciparay  Sekolah Dasar SD AL BAROKAH       
#> 10 Bojong Loa Kidul Sekolah Dasar SD AL BASYARIYAH    
#> # … with 379 more rows
#> 
#> $`Data Jumlah Guru di SMP Swasta Kota Bandung Tahun 2018`
#> # A tibble: 191 x 4
#>    nama_kecamatan nama_sekolah            jumlah_laki_laki jumlah_perempuan
#>    <chr>          <chr>                              <dbl>            <dbl>
#>  1 Andir          SMP ADVENT CIMINDI                     2                4
#>  2 Coblong        SMP ADVENT II BANDUNG                  4                4
#>  3 Sumur Bandung  SMP ADVENT NARIPAN                     2                7
#>  4 Batununggal    SMP AISYIYAH BOARDING …                6                9
#>  5 Panyileukan    SMP AL BIRUNI CERDAS M…               11               12
#>  6 Coblong        SMP AL FALAH                          22               32
#>  7 Mandalajati    SMP AL HADI BANDUNG                   13               18
#>  8 Panyileukan    SMP AL HASAN                           8                8
#>  9 Cidadap        SMP AL HUSAINIYYAH                     4                7
#> 10 Cibiru         SMP AL ISLAM                          10               10
#> # … with 181 more rows
#> 
#> $`Data Kondisi Ruangan Kelas SMP Swasta Kota Bandung Tahun 2018`
#> # A tibble: 191 x 7
#>    nama_kecamatan nama_sekolah  baik rusak_ringan rusak_sedang rusak_berat
#>    <chr>          <chr>        <dbl>        <dbl>        <dbl>       <dbl>
#>  1 Andir          SMP ADVENT …     0            8            0           0
#>  2 Coblong        SMP ADVENT …     3            0            0           0
#>  3 Sumur Bandung  SMP ADVENT …     1            2            0           0
#>  4 Batununggal    SMP AISYIYA…     6            0            0           0
#>  5 Panyileukan    SMP AL BIRU…    11            0            0           0
#>  6 Coblong        SMP AL FALAH    18            0            0           0
#>  7 Mandalajati    SMP AL HADI…     0           11            0           0
#>  8 Panyileukan    SMP AL HASAN     1            8            0           0
#>  9 Cidadap        SMP AL HUSA…     1            4            0           0
#> 10 Cibiru         SMP AL ISLAM     0            3            5           0
#> # … with 181 more rows, and 1 more variable: jumlah_ruangan <dbl>
#> 
#> $`Data Jumlah Guru Dan Murid SMP Kota Bandung Tahun 2016`
#> # A tibble: 30 x 3
#>    nama_kecamatan   guru siswa
#>    <chr>           <dbl> <dbl>
#>  1 Bandung Kulon     108  2069
#>  2 Babakan Ciparay   158  3754
#>  3 Bojongloa Kaler   194  4575
#>  4 Bojongloa Kidul   162  2258
#>  5 Astanaanyar        89  1818
#>  6 Regol             358  7971
#>  7 Lengkong          311  5348
#>  8 Bandung Kidul      77  1426
#>  9 BuahBatu          161  3674
#> 10 Rancasari         130  2905
#> # … with 20 more rows
#> 
#> $`Data Jumlah Pegawai TU di SMP Swasta Kota Bandung Tahun 2018`
#> # A tibble: 191 x 4
#>    nama_kecamatan nama_sekolah            jumlah_laki_laki jumlah_perempuan
#>    <chr>          <chr>                              <dbl>            <dbl>
#>  1 Andir          SMP ADVENT CIMINDI                     1                0
#>  2 Coblong        SMP ADVENT II BANDUNG                  2                0
#>  3 Sumur Bandung  SMP ADVENT NARIPAN                     0                1
#>  4 Batununggal    SMP AISYIYAH BOARDING …                0                0
#>  5 Panyileukan    SMP AL BIRUNI CERDAS M…                1                2
#>  6 Coblong        SMP AL FALAH                           1                6
#>  7 Mandalajati    SMP AL HADI BANDUNG                    4                4
#>  8 Panyileukan    SMP AL HASAN                           1                0
#>  9 Cidadap        SMP AL HUSAINIYYAH                     0                2
#> 10 Cibiru         SMP AL ISLAM                           2                0
#> # … with 181 more rows
#> 
#> $`Data Hasil Ujian Nasional SMP Negeri tahun 2016`
#> # A tibble: 53 x 10
#>      npsn nama_sekolah nama_wilayah nama_kecamatan nama_kelurahan tahun
#>     <dbl> <chr>        <chr>        <chr>          <chr>          <dbl>
#>  1 2.02e7 SMP NEGERI 1 Bojonagara   Cicendo        Arjuna          2016
#>  2 2.02e7 SMP NEGERI … Karees       Regol          Pungkur         2016
#>  3 2.02e7 SMP NEGERI … Karees       Regol          Ciateul         2016
#>  4 2.02e7 SMP NEGERI … Bojonagara   Sukasari       Gegerkalong     2016
#>  5 2.02e7 SMP NEGERI … Karees       Lengkong       Turangga        2016
#>  6 2.02e7 SMP NEGERI … Cibeunying   Bandung Wetan  Cihapit         2016
#>  7 2.02e7 SMP NEGERI … Bojonagara   Sukasari       Gegerkalong     2016
#>  8 2.02e7 SMP NEGERI … Cibeunying   Cibeunying Ka… Neglasari       2016
#>  9 2.02e7 SMP NEGERI … Arcamanik    Arcamanik      Sukamiskin      2016
#> 10 2.02e7 SMP NEGERI … Kordon       Buahbatu       Margasari       2016
#> # … with 43 more rows, and 4 more variables:
#> #   nilai_rerata_bahasa_indonesia <dbl>,
#> #   nilai_rerata_bahasa_inggris <dbl>, nilai_rerata_matematika <dbl>,
#> #   nilai_rerata_ipa <dbl>
#> 
#> $`Data Jumlah Guru Dan Murid SMP Kota Bandung Tahun 2017`
#> # A tibble: 30 x 3
#>    kecamatan        guru siswa
#>    <chr>           <dbl> <dbl>
#>  1 Bandung Kulon     115  2332
#>  2 Babakan Ciparay   151  3608
#>  3 BojongloaKaler    180  4318
#>  4 Bojongloa Kidul   143  2300
#>  5 Astanaanyar        73  1808
#>  6 Regol             344  7594
#>  7 Lengkong          323  5694
#>  8 Bandung Kidul      73  1370
#>  9 Buah Batu         153  3583
#> 10 Rancasari         125  2559
#> # … with 20 more rows
#> 
#> $`Data Hasil Ujian Nasional SMP Negeri tahun 2017`
#> # A tibble: 53 x 10
#>      npsn nama_sekolah nama_wilayah nama_kecamatan nama_kelurahan tahun
#>     <dbl> <chr>        <chr>        <chr>          <chr>          <dbl>
#>  1 2.02e7 SMP NEGERI 1 Bojonagara   Cicendo        Arjuna          2017
#>  2 2.02e7 SMP NEGERI … Karees       Regol          Pungkur         2017
#>  3 2.02e7 SMP NEGERI … Karees       Regol          Ciateul         2017
#>  4 2.02e7 SMP NEGERI … Bojonagara   Sukasari       Gegerkalong     2017
#>  5 2.02e7 SMP NEGERI … Karees       Lengkong       Turangga        2017
#>  6 2.02e7 SMP NEGERI … Cibeunying   Bandung Wetan  Cihapit         2017
#>  7 2.02e7 SMP NEGERI … Bojonagara   Sukasari       Gegerkalong     2017
#>  8 2.02e7 SMP NEGERI … Cibeunying   Cibeunying Ka… Neglasari       2017
#>  9 2.02e7 SMP NEGERI … Arcamanik    Arcamanik      Sukamiskin      2017
#> 10 2.02e7 SMP NEGERI … Kordon       Buahbatu       Margasari       2017
#> # … with 43 more rows, and 4 more variables:
#> #   nilai_rerata_bahasa_indonesia <dbl>,
#> #   nilai_rerata_bahasa_inggris <dbl>, nilai_rerata_matematika <dbl>,
#> #   nilai_rerata_ipa <dbl>
```

## Ucapan Terimakasih

Proyek ini dapat terlaksana atas upaya data terbuka yang tersaji di
[Open Data Kota Bandung](http://data.bandung.go.id)
