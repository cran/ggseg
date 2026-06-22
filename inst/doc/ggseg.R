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
dk()

## -----------------------------------------------------------------------------
plot(dk())

## -----------------------------------------------------------------------------
library(ggseg.formats)

atlas_regions(dk())
atlas_labels(dk())

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), show.legend = FALSE)

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(hemi ~ view),
    show.legend = FALSE
  )

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(c(
      "right lateral",
      "right medial",
      "left lateral",
      "left medial"
    )),
    show.legend = FALSE
  )

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), view = "lateral", show.legend = FALSE)

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), hemi = "left")

## -----------------------------------------------------------------------------
atlas_views(aseg())

## -----------------------------------------------------------------------------
library(dplyr)

some_data <- tibble(
  region = c(
    "transverse temporal",
    "insula",
    "precentral",
    "superior parietal"
  ),
  p = sample(seq(0, 0.5, 0.001), 4)
)

ggplot() +
  geom_brain(
    atlas = dk(),
    data = some_data,
    position = position_brain(hemi ~ view),
    aes(fill = p)
  ) +
  scale_fill_viridis_c(option = "cividis", direction = -1) +
  theme_void()

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
  group = c(rep("A", 4), rep("B", 4))
)

ggplot() +
  geom_brain(
    atlas = dk(),
    data = group_by(some_data, group),
    position = position_brain(hemi ~ view),
    aes(fill = p)
  ) +
  facet_wrap(~group)

## -----------------------------------------------------------------------------
data <- data.frame(
  region = atlas_regions(dk())[1:3],
  reg_col = atlas_labels(dk())[1:3]
)

palette <- atlas_palette(dk())[1:3]

ggplot() +
  geom_brain(atlas = dk(), data = data, aes(fill = reg_col)) +
  scale_fill_brain_manual(palette)

## -----------------------------------------------------------------------------
# ggplot() +
#   geom_brain(atlas = dk()) +
#   theme_brain()

## -----------------------------------------------------------------------------
# install.packages("ggsegYeo2011", repos = "https://ggsegverse.r-universe.dev")

