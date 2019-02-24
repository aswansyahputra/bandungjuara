library(ckanr)
library(tidyverse)
library(furrr)
library(here)

plan(multiprocess)

url <- "http://data.bandung.go.id"

resources <- resource_search(q = "name:data", url = url, as = "table")

daftar_dataset <-
  resources %>%
  `[[`("results") %>%
  as_tibble() %>%
  filter(format == "CSV") %>%
  select(name, description, url) %>%
  mutate_all(~str_squish(.x)) %>%
  mutate(
    filename = str_to_lower(name),
    filename = str_remove_all(filename, pattern = "[:punct:]"),
    filename = str_squish(filename),
    filename = str_replace_all(filename, pattern = "[:space:]", replacement = "_"),
    filename = str_remove_all(filename, pattern = "^data_"),
    filename = str_c(filename, ".csv")
  )

write_csv(daftar_dataset, here("data-raw", "daftar_dataset.csv"))

future_map2(
  .x = daftar_dataset$url,
  .y = daftar_dataset$filename,
  ~ read_csv(file = .x) %>%
    janitor::clean_names() %>%
    write_csv(path = here("data-raw", "unduhan", .y)),
  .progress = TRUE
)
