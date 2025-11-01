# experimental design
library(tidyverse)
set.seed(123898)

peas <- c("MNWP24-039-b")

rye <- "Danko"

trts <- tibble(n_rye = c(0,2,4)) |> 
  mutate(n_pea = 4-n_rye, trt_name = c("all_pea", "half_n_half", "all_rye")) |> 
  # set n reps to 5
  uncount(5) |> 
  mutate(box = c(1,
                 11,
                 34,
                 6,
                 25,
                 43,
                 38,
                 21,
                 17,
                 39,
                 23,
                 18,
                 42,
                 19,
                 3
                 )) |> 
  mutate(rep = 1:5, .by = trt_name) |> 
  arrange(rep) |> 
  slice_sample(prop = 1,by = rep) |> 
  mutate(box_order = 1:n())

write_csv(trts, "experiment_setup_planted20251031.csv")
