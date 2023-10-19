df  <- blm_hb_df

end_points  <- df  %>%
  group_by(admin_st) %>%
  filter(est_horse_pop == max(est_horse_pop)) %>%
  ungroup()

df %>%
  ggplot(aes(est_horse_pop, horse_aml_high,
             color = admin_st)) +
  geom_smooth(method = lm, se = FALSE) +
  geom_text(data = end_points,
            aes(label = admin_st,
                est_horse_pop = est_horse_pop,
                horse_aml_high = horse_aml_high))
