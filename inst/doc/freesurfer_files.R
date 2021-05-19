## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

devtools::load_all(".")
subject_dir <- here::here("tests/testthat/data/")

stats_file <- paste0(subject_dir, "bert/stats/lh.aparc.stats")

## ---- eval=FALSE--------------------------------------------------------------
#  library(ggseg)
#  library(ggplot2)
#  
#  subjects_dir <- "/Applications/freesurfer/subjects/"

## ---- echo = FALSE------------------------------------------------------------
library(ggseg)
library(ggplot2)

subjects_dir <- here::here("tests/testthat/data")

## -----------------------------------------------------------------------------
stats_file <- file.path(subjects_dir, "bert/stats/lh.aparc.stats")
data <- read_freesurfer_stats(stats_file)
data

## -----------------------------------------------------------------------------
data %>% 
  mutate(label = paste0("lh_", label)) %>% 
  ggseg(atlas = dk, mapping = aes(fill = ThickAvg))

## -----------------------------------------------------------------------------
dat <- read_atlas_files(subject_dir, "aparc.stats$")
dat

## -----------------------------------------------------------------------------
ggseg(dat, mapping = aes(fill = ThickStd))

## ----out.width="100%", fig.width=10-------------------------------------------
library(dplyr)
library(tidyr)

dat %>% 
  gather(stat, val, -subject, -label) %>% 
  group_by(stat) %>% 
  ggseg(mapping = aes(fill = val)) +
  facet_wrap(~stat)

## -----------------------------------------------------------------------------
# Path to our particular file, yours will be wherever you have saved it
table_path <- here::here("tests/testthat/data/aparc.volume.table")
table_path

## -----------------------------------------------------------------------------
read_freesurfer_table(table_path)

## -----------------------------------------------------------------------------
dat <- read_freesurfer_table(table_path, measure = "volume")
dat

## ---- eval = FALSE------------------------------------------------------------
#  dat %>%
#    ggseg(mapping = aes(fill = volume))

## -----------------------------------------------------------------------------
dat %>% 
  filter(grepl("lh|rh", label)) %>% 
  ggseg(mapping = aes(fill = volume))

