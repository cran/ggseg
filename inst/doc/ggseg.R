## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6
)

## -----------------------------------------------------------------------------
library(ggseg)
library(ggplot2)

## -----------------------------------------------------------------------------
dk

## -----------------------------------------------------------------------------
plot(dk())

## -----------------------------------------------------------------------------
ggseg.formats::atlas_regions(dk())
ggseg.formats::atlas_labels(dk())

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk())

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), position = position_brain(hemi ~ view))

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(c(
      "right lateral", "right medial",
      "left lateral", "left medial"
    ))
  )

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), view = "lateral")

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), hemi = "left")

## -----------------------------------------------------------------------------
ggseg.formats::atlas_views(aseg())

## -----------------------------------------------------------------------------
library(dplyr)

some_data <- tibble(
  region = c(
    "transverse temporal", "insula", "precentral", "superior parietal"
  ),
  p = sample(seq(0, .5, .001), 4)
)

ggplot(some_data) +
  geom_brain(
    atlas = dk(),
    position = position_brain(hemi ~ view),
    aes(fill = p)
  ) +
  scale_fill_viridis_c(option = "cividis", direction = -1) +
  theme_void()

## -----------------------------------------------------------------------------
some_data <- tibble(
  region = rep(c(
    "transverse temporal", "insula", "precentral", "superior parietal"
  ), 2),
  p = sample(seq(0, .5, .001), 8),
  group = c(rep("A", 4), rep("B", 4))
)

ggplot(some_data) +
  geom_brain(
    atlas = dk(),
    position = position_brain(hemi ~ view),
    aes(fill = p)
  ) +
  facet_wrap(~group)

## -----------------------------------------------------------------------------
data <- data.frame(
  region = ggseg.formats::atlas_regions(dk())[1:3],
  reg_col = ggseg.formats::atlas_regions(dk())[1:3]
)

ggplot(data) +
  geom_brain(atlas = dk(), aes(fill = reg_col)) +
  scale_fill_brain_manual(dk()$palette[data$region])

## -----------------------------------------------------------------------------
# ggplot() +
#   geom_brain(atlas = dk()) +
#   theme_brain()

## -----------------------------------------------------------------------------
# install.packages("ggsegYeo2011", repos = "https://ggsegverse.r-universe.dev")

