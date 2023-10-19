graze_df <- blm_graze %>%
  select(allot_name, admin_st, gis_miles) %>%
  filter(!admin_st == "" & !admin_st == " ") %>%
  group_by(admin_st) %>%
  summarise(total_miles = sum(gis_miles))

blm_graze_df %>%
#  select(allot_name, admin_st, gis_miles) %>%
  filter(admin_st == "NV" & str_detect(allot_name, 'Bu')) %>%
  arrange(allot_name) %>%
  View()

blm_graze_df %>%
  filter(allot_name  %in% "bunkerville")

blm_hb_df %>%
  filter(total_acres >= 500)
max(blm_hb_df$total_acres)
