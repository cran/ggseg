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
    padding = 0.08,
    size = 2.5,
    colour = "grey50",
    fontface = "italic"
  ) +
  theme_void()

## -----------------------------------------------------------------------------
my_data <- data.frame(
  region = ggseg.formats::atlas_regions(aseg())[1:3],
  value = c(1, 2, 3)
)

ggplot() +
  geom_brain(
    atlas = aseg(),
    data = my_data,
    aes(fill = value),
    position = position_brain(zoom = TRUE)
  ) +
  scale_fill_viridis_c(na.value = "grey85") +
  theme_void()

## -----------------------------------------------------------------------------
focus <- c("Thalamus Proper", "Putamen", "Hippocampus")

ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(zoom = focus),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(zoom = focus, zoom_pad = 0.01),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(
    atlas = aseg(),
    position = position_brain(zoom = focus, zoom_pad = 0.25),
    show.legend = FALSE
  ) +
  theme_void()

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = aseg(), context = FALSE, show.legend = FALSE) +
  theme_void()

