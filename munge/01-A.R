# Clean names with janitor
blm_graze_df  <- clean_names(blm_graze) %>%
  mutate(gis_miles = gis_acres / 640)

