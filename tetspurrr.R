library(tidyverse)
set.seed(123)

df_xyz <- tibble(
  x = rnorm(10),
  y = rnorm(10),
  z = rnorm(10)
) %>%
  print()

df_xyz %>%
  summarise(
    across(
      .cols  = everything(),
      .fns   = mean,
      .names = "{col}_mean"
    )
  )

xyz_means <- vector("double", ncol(df_xyz))

for(i in seq_along(df_xyz)) {
  xyz_means[[i]] <- mean(df_xyz[[i]])
}

xyz_means

xyz_means <- map_dbl(
  .x = df_xyz,
  .f = mean
)

xyz_means
