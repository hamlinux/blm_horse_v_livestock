# Clean names with janitor
blm_graze_df  <- clean_names(blm_graze) %>%
  mutate(gis_miles = gis_acres / 640) %>%
  group_by(admin_st) %>%
  summarise(total_gis_miles = sum(gis_miles))

