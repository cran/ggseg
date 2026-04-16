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
ggplot(some_data) +
  geom_brain(atlas = dk(), mapping = aes(fill = p))

## -----------------------------------------------------------------------------
some_data$hemi <- "left"

ggplot(some_data) +
  geom_brain(atlas = dk(), mapping = aes(fill = p))

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

ggplot(some_data) +
  geom_brain(atlas = dk(), colour = "white", mapping = aes(fill = p)) +
  facet_wrap(~group, ncol = 1) +
  theme(legend.position = "bottom") +
  scale_fill_gradientn(
    colours = c("royalblue", "firebrick", "goldenrod"),
    na.value = "grey"
  )

## -----------------------------------------------------------------------------
atlas_df <- as.data.frame(dk())
names(atlas_df)

## -----------------------------------------------------------------------------
some_data <- tibble(
  region = c("superior temporal", "precentral", "lateral orbitofrontal"),
  p = c(0.03, 0.6, 0.05)
)

atlas_df |>
  left_join(some_data, by = "region") |>
  ggplot() +
  geom_sf(aes(fill = p), colour = "white") +
  facet_grid(hemi ~ view) +
  theme_void()

