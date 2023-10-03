blm_df <- blm_graze_df %>%
  left_join(blm_hb_df, by = "admin_st")

blm_df %>%
  filter(!admin_st == "" & !admin_st == " ") %>%
  ggplot(aes(admin_st, total_hb_miles)) +
  geom_col() +
  labs(x = "Administrative State", y = "Managed Sq. Miles",  title = " Bureau Of Land Management Wild Horse/Burro Land Management") 
ggsave("graphs/wildhorse_land_graph.png")



blm_df %>%
  filter(!admin_st == "" & !admin_st == " ") %>%
  ggplot(aes(admin_st)) +
  geom_col(aes(y = total_gis_miles, fill = total_gis_miles)) +
  geom_col(aes(y = total_hb_miles, colour = total_hb_miles)) +
  labs(x = "Administrative State", y = "Managed Sq. Miles",  title = " Bureau Of Land Management Livestock Grazing v. Wild Horse/Burro Management") 
ggsave("graphs/grazing_v_wildhorse.png")
