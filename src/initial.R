graze_df <- blm_graze %>%
  select(allot_name, admin_st, gis_miles) %>%
  filter(!admin_st == "" & !admin_st == " ") %>%
  group_by(admin_st) %>%
  summarise(total_miles = sum(gis_miles))


