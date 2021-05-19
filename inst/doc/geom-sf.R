## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "100%",
  fig.width = 10
)

## ----setup--------------------------------------------------------------------
library(ggseg)
library(ggplot2)

dk

## -----------------------------------------------------------------------------
plot(dk)

## -----------------------------------------------------------------------------
dk$atlas
dk$type
dk$palette
dk$data

## -----------------------------------------------------------------------------
dk2 <- as_ggseg_atlas(dk)
dk2

## -----------------------------------------------------------------------------
dk2 <- as_brain_atlas(dk2)
dk2

## -----------------------------------------------------------------------------
library(dplyr)
        
someData = tibble(
  region = c("transverse temporal", "insula",
           "precentral","superior parietal"), 
  p = sample(seq(0,.5,.001), 4)
)

someData
  

## -----------------------------------------------------------------------------
someData %>% 
  brain_join(dk)

## -----------------------------------------------------------------------------
someData %>% 
  brain_join(dk) %>% 
  plot()

## -----------------------------------------------------------------------------
someData %>% 
  brain_join(dk) %>% 
  ggplot() + 
  geom_sf(aes(fill = p))

## -----------------------------------------------------------------------------
someData %>% 
  brain_join(dk) %>% 
  reposition_brain(hemi ~ side) %>% 
  ggplot() + 
  geom_sf(aes(fill = p))

## -----------------------------------------------------------------------------
someData %>% 
  brain_join(dk) %>% 
  reposition_brain(hemi ~ side) %>% 
  ggplot(aes(fill = p)) + 
  geom_sf(show.legend = FALSE) + 
  geom_sf_label(aes(label = ifelse(!is.na(p), region, NA)),
                alpha = .8,
                show.legend = FALSE)

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
  brain_join(dk) %>% 
  reposition_brain(hemi ~ side) %>% 
  ggplot(aes(fill = p)) + 
  geom_sf(show.legend = FALSE) + 
  facet_wrap( ~ groups) +
  ggtitle("correct facetting")

