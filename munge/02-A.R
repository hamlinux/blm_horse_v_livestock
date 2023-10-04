# Clean names with janitor
blm_hb_df  <- clean_names(blm_hb) %>%
  drop_na(total_acres, horse_aml_high) %>%
  mutate(total_miles = total_acres / 640)

