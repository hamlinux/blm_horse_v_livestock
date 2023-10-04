# Select names from HMA
hb_df <- blm_hb_df %>%
  select(objectid, hma_name, hma_id, admin_st, horse_aml_high, est_horse_pop, total_miles) %>%
  rename(hb_miles = total_miles) %>%
  rename(hb_object_id = objectid) %>%
  mutate(hb_miles = round(hb_miles, 2))

# Select Names from Graze
gr_df <- blm_graze_df %>%
  select(objectid, allot_name, allot_no, admin_st, gis_miles) %>%
  rename(graze_miles = gis_miles) %>%
  rename(hma_name = allot_name) %>%
  rename(gr_object_id = objectid) %>%
  mutate(graze_miles = round(graze_miles, 2))

# Left Join Graze data to HB data using Allotment and HMA Names

df <- left_join(hb_df, gr_df, by = c("hma_name", "admin_st")) %>%
  drop_na(graze_miles) %>%
  select(hma_id, allot_no, hma_name, admin_st, horse_aml_high, est_horse_pop, hb_miles, graze_miles) %>%
  arrange(admin_st)

View(df)

gr_df %>%
  rowwise() %>%
  mutate(has_duplicate = any(duplicated(hma_name))) %>%
  filter(has_duplicate == "TRUE") %>%
  head()

count(gr_df)
count(hb_df)
summary(gr_df$graze_miles)
summary(hb_df$hb_miles)
boxplot(gr_df$graze_miles)
boxplot(hb_df$hb_miles)
hist(gr_df$graze_miles)
hist(hb_df$hb_miles)

gr_df %>%
  filter(graze_miles < 150) %>%
  filter(!admin_st == "" & !admin_st == " ") %>%
  ggplot(aes(graze_miles, color = admin_st)) +
  geom_boxplot()

sum(gr_df$graze_miles > 50)
sum(gr_df$graze_miles > 250)
names(blm_graze_df)

gr_df[gr_df$admin_st == "NM", ]
