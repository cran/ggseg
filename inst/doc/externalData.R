## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(eval = TRUE, fig.retina = 3)

## ----start--------------------------------------------------------------------
library(ggseg)
library(dplyr)
library(ggplot2)

dk

## -----------------------------------------------------------------------------
as_tibble(dk)


## -----------------------------------------------------------------------------
some_data <- tibble(
  region = c("superior temporal", "precentral", "lateral orbitofrontal"),
  p = c(.03, .6, .05)
)
some_data

## -----------------------------------------------------------------------------
dk |>
  as_tibble() |>
  left_join(some_data)

## -----------------------------------------------------------------------------
dk |>
  as_tibble() |>
  left_join(some_data) |>
  arrange(p)

## -----------------------------------------------------------------------------
some_data$hemi <- rep("left", nrow(some_data))
some_data

dk |>
  as_tibble() |>
  left_join(some_data) |>
  arrange(p)

## -----------------------------------------------------------------------------
ggplot(some_data) + geom_brain(atlas = dk, mapping = aes(fill = p))

## -----------------------------------------------------------------------------
new_atlas <- dk |>
  as_tibble() |>
  left_join(some_data) |>
  as_brain_atlas()

ggplot() +
  geom_brain(
    atlas = new_atlas,
    mapping = aes(fill = p),
    position = position_brain(hemi ~ side)
  )

## ----datasupp3----------------------------------------------------------------
some_data <- data.frame(
  region = rep(
    c("transverse temporal", "insula", "precentral", "superior parietal"),
    2
  ),
  p = sample(seq(0, .5, .001), 8),
  AgeG = c(rep("Young", 4), rep("Old", 4)),
  stringsAsFactors = FALSE
)

ggplot(some_data) +
  geom_brain(atlas = dk, colour = "white", mapping = aes(fill = p)) +
  facet_wrap(~AgeG, ncol = 1) +
  theme(legend.position = "bottom")


## ----duplicate----------------------------------------------------------------
# If you group_by the columns you will facet by, this will work well.
some_data <- some_data |>
  group_by(AgeG)

# We can now supply the new_atlas as an atlas to ggseg
ggplot(some_data) +
  geom_brain(atlas = dk, colour = "white", mapping = aes(fill = p)) +
  facet_wrap(~AgeG, ncol = 1) +
  theme(legend.position = "bottom") +
  scale_fill_gradientn(
    colours = c("royalblue", "firebrick", "goldenrod"),
    na.value = "grey"
  )

## ----duplicatepipe------------------------------------------------------------
some_data |>
  group_by(AgeG) |>

  ggplot() +
  geom_brain(atlas = dk, colour = "white", mapping = aes(fill = p)) +
  facet_wrap(~AgeG, ncol = 1) +
  theme(legend.position = "bottom") +
  scale_fill_gradientn(
    colours = c("royalblue", "firebrick", "goldenrod"),
    na.value = "grey"
  )

