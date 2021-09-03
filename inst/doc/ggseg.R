## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6
)

## ----setup--------------------------------------------------------------------
library(ggseg)
library(ggplot2)


## -----------------------------------------------------------------------------
dk$atlas
dk$type
dk$palette
dk$data

## -----------------------------------------------------------------------------
plot(dk$data)

## -----------------------------------------------------------------------------
plot(dk)

## -----------------------------------------------------------------------------
dk

## -----------------------------------------------------------------------------
brain_regions(dk)
brain_labels(dk)

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk)

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk, position = position_brain(hemi ~ side))

## -----------------------------------------------------------------------------
cortical_pos <- c("left lateral", "left medial", "right medial", "right lateral")
ggplot() +
  geom_brain(atlas = dk, position = position_brain(cortical_pos))

# Which can easily be switched around!
cortical_pos <- c("right lateral", "left medial", "right medial", "left lateral")
ggplot() +
  geom_brain(atlas = dk, position = position_brain(cortical_pos))

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = dk, side = "lateral")

ggplot() +
  geom_brain(atlas = dk, hemi = "left")

## -----------------------------------------------------------------------------
ggplot() +
  geom_brain(atlas = aseg, side = "axial", hemi = "left")

## -----------------------------------------------------------------------------
library(dplyr)
        
someData = tibble(
  region = c("transverse temporal", "insula",
           "precentral","superior parietal"), 
  p = sample(seq(0,.5,.001), 4)
)

someData

## -----------------------------------------------------------------------------
ggplot(someData) +
  geom_brain(atlas = dk, 
             position = position_brain(hemi ~ side),
             aes(fill = p)) +
  scale_fill_viridis_c(option = "cividis", direction = -1) +
  theme_void() +
  labs(title = "My awesome title", 
       subtitle = "of a brain atlas plot",
       caption = "I'm pretty happy about this!")

## -----------------------------------------------------------------------------
someData <- tibble(
  region = rep(c("transverse temporal", "insula",
           "precentral","superior parietal"), 2), 
  p = sample(seq(0,.5,.001), 8),
  groups = c(rep("g1", 4), rep("g2", 4))
)

someData

## -----------------------------------------------------------------------------
someData %>%
  group_by(groups) %>%
  ggplot() +
  geom_brain(atlas = dk, 
             position = position_brain(hemi ~ side),
             aes(fill = p)) +
  facet_wrap(~groups) +
  ggtitle("correct facetting")

## -----------------------------------------------------------------------------
ggseg(someData, atlas = dk, 
      colour = "black",
      size = .1, 
      position = "stacked",
      mapping = aes(fill = p))

