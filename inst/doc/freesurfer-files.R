## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(ggseg)
# library(ggplot2)
# library(dplyr)

## -----------------------------------------------------------------------------
# subjects_dir <- Sys.getenv("SUBJECTS_DIR")
# stats_file <- file.path(subjects_dir, "bert/stats/lh.aparc.stats")
# 
# data <- read_freesurfer_stats(stats_file)
# data

## -----------------------------------------------------------------------------
# ggplot() +
#   geom_brain(
#     atlas = dk(),
#     data = data |> mutate(label = paste0("lh_", label)),
#     mapping = aes(fill = ThickAvg)
#   )

## -----------------------------------------------------------------------------
# dat <- read_atlas_files(subjects_dir, "aparc.stats$")
# dat

## -----------------------------------------------------------------------------
# ggplot() +
#   geom_brain(atlas = dk(), data = dat, mapping = aes(fill = ThickStd))

## -----------------------------------------------------------------------------
# library(tidyr)
# 
# long <- dat |>
#   pivot_longer(-c(subject, label), names_to = "stat", values_to = "val")
# 
# ggplot() +
#   geom_brain(
#     atlas = dk(),
#     data = group_by(long, stat),
#     mapping = aes(fill = val)
#   ) +
#   facet_wrap(~stat)

## -----------------------------------------------------------------------------
# table_path <- "path/to/aparc.volume.table"
# 
# read_freesurfer_table(table_path)

## -----------------------------------------------------------------------------
# dat <- read_freesurfer_table(table_path, measure = "volume")
# dat

## -----------------------------------------------------------------------------
# ggplot() +
#   geom_brain(
#     atlas = dk(),
#     data = dat |> filter(grepl("lh|rh", label)),
#     mapping = aes(fill = volume)
#   )

