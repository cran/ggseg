## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(eval=TRUE, 
                      out.width = "100%", 
                      fig.retina = 3)
library(ggseg)
library(dplyr)

## ----start--------------------------------------------------------------------
library(ggseg)
library(dplyr)
library(ggplot2)

dk

## -----------------------------------------------------------------------------
as_tibble(dk)


## -----------------------------------------------------------------------------
someData = tibble(
  region=c("superior temporal","precentral", "lateral orbitofrontal"),
  p=c(.03,.6, .05)
)
someData

## -----------------------------------------------------------------------------
dk %>% 
  as_tibble() %>% 
  left_join(someData)

## -----------------------------------------------------------------------------
dk %>% 
  as_tibble() %>% 
  left_join(someData) %>% 
  arrange(p)

## -----------------------------------------------------------------------------
someData$hemi = rep("left", nrow(someData))
someData

dk %>% 
  as_tibble() %>% 
  left_join(someData) %>% 
  arrange(p)

## -----------------------------------------------------------------------------
ggseg(someData, atlas=dk, mapping=aes(fill=p))

## -----------------------------------------------------------------------------
newAtlas = dk %>% 
  as_tibble() %>% 
  left_join(someData) %>% 
  as_brain_atlas()

ggseg(atlas=newAtlas, mapping=aes(fill=p), position="stacked")

## ----datasupp3----------------------------------------------------------------
someData = data.frame(
  region = rep(c("transverse temporal", "insula",
               "precentral","superior parietal"),2), 
  p = sample(seq(0,.5,.001), 8),
  AgeG = c(rep("Young",4), rep("Old",4)),
  stringsAsFactors = FALSE)
  
ggseg(.data=someData, colour="white", mapping=aes(fill=p)) +
  facet_wrap(~AgeG, ncol=1) +
  theme(legend.position = "bottom")


## ----duplicate----------------------------------------------------------------
# If you group_by the columns you will facet by, this will work well.
someData = someData %>% 
  group_by(AgeG)

# We can now supply the newAtlas as an atlas to ggseg
ggseg(.data = someData, atlas=dk, colour="white", mapping=aes(fill=p)) +
  facet_wrap(~AgeG, ncol=1) +
  theme(legend.position = "bottom") +
  scale_fill_gradientn(colours = c("royalblue","firebrick","goldenrod"),na.value="grey")

## ----duplicatepipe------------------------------------------------------------
someData %>% 
  group_by(AgeG) %>% 

  ggseg(atlas=dk, colour="white", mapping=aes(fill=p)) +
  facet_wrap(~AgeG, ncol=1) +
  theme(legend.position = "bottom") +
  scale_fill_gradientn(colours = c("royalblue","firebrick","goldenrod"),na.value="grey")

