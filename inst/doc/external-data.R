## -----------------------------------------------------------------------------
knitr::opts_chunk$set(eval = TRUE, fig.retina = 3, fig.width = 6)

## -----------------------------------------------------------------------------
library(ggseg)
library(dplyr)
library(ggplot2)

## -----------------------------------------------------------------------------
ggseg.formats::atlas_regions(dk())

## -----------------------------------------------------------------------------
ggseg.formats::atlas_labels(dk())

## -----------------------------------------------------------------------------
some_data <- tibble(
  region = c("superior temporal", "precentral", "lateral orbitofrontal"),
  p = c(0.03, 0.6, 0.05)
)
some_data

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), data = some_data, mapping = aes(fill = p))

## -----------------------------------------------------------------------------
some_data$hemi <- "left"

ggplot() +
  geom_brain(atlas = dk(), data = some_data, mapping = aes(fill = p))

## -----------------------------------------------------------------------------
some_data <- tibble(
  region = rep(
    c(
      "transverse temporal",
      "insula",
      "precentral",
      "superior parietal"
    ),
    2
  ),
  p = sample(seq(0, 0.5, 0.001), 8),
  group = c(rep("Young", 4), rep("Old", 4))
)

ggplot() +
  geom_brain(
    atlas = dk(),
    data = group_by(some_data, group),
    colour = "white",
    mapping = aes(fill = p)
  ) +
  facet_wrap(~group, ncol = 1) +
  theme(legend.position = "bottom") +
  scale_fill_gradientn(
    colours = c("royalblue", "firebrick", "goldenrod"),
    na.value = "grey"
  )

