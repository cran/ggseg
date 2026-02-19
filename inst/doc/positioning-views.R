## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5
)

## -----------------------------------------------------------------------------
library(ggseg)
library(ggplot2)

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(hemi ~ view),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(view ~ hemi),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(. ~ hemi + view),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = dk(),
    position = position_brain(hemi + view ~ .),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain("horizontal"),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain("vertical"),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(nrow = 2),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(ncol = 3),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggseg.formats::atlas_views(aseg())

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(
      views = c("sagittal", "axial_3", "coronal_3")
    ),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(
      views = c("sagittal", "axial_3", "axial_5", "coronal_3"),
      nrow = 2
    ),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
# ggplot() +
#   geom_brain(
#     atlas = aseg(),
#     position = position_brain(type ~ .),
#     show.legend = FALSE
#   ) +
#   theme_void()

## -----------------------------------------------------------------------------
atlas_data <- as.data.frame(aseg())

repositioned <- reposition_brain(
  atlas_data,
  views = c("sagittal", "axial_3", "coronal_3"),
  nrow = 1
)

ggplot(repositioned) +
  geom_sf(aes(fill = region), show.legend = FALSE) +
  theme_void()

## -----------------------------------------------------------------------------
pos <- position_brain(hemi ~ view)
ggplot() +
  geom_brain(atlas = dk(), position = pos, show.legend = FALSE) +
  annotate_brain(atlas = dk(), position = pos) +
  theme_void()

## -----------------------------------------------------------------------------
pos <- position_brain(nrow = 2)
ggplot() +
  geom_brain(atlas = aseg(), position = pos, show.legend = FALSE) +
  annotate_brain(atlas = aseg(), position = pos) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk(), show.legend = FALSE) +
  annotate_brain(
    atlas = dk(),
    size = 2.5,
    colour = "grey50",
    fontface = "italic"
  ) +
  theme_void()

