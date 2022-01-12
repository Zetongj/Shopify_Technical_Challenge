data = X2019_Winter_Data_Science_Intern_Challenge_Data_Set
attach(data)
mean(order_amount) # wrong answer
summary(order_amount)

# AOV = total Revenue/Total order
# AOV by each shop
aov_1 <- data %>% 
  group_by(shop_id) %>% 
  summarise(total_revenue = sum(order_amount),
            total_orders = sum(total_items)) %>% 
  transmute(aov_1 = total_revenue/total_orders) %>% 
  ungroup() %>% 
  summarise(average_ov = mean(aov_1)) #the mean value for each AOV
aov_1 

#sneaker_price = order_amount/total_items
#Price for each sneaker
aov_2 <- data %>%
  group_by(shop_id) %>%
  mutate(sneaker_price = order_amount/total_items) %>%
  summarise(sneaker_price = mean(sneaker_price)) %>%
  select(shop_id, sneaker_price) %>%
  arrange(desc(sneaker_price))
aov_2
#shop no.78 has the most expensive sneaker price (25725) which is not normal

#Exclude shop No.78 (Delete outlier)
aov_3 <-  data %>% 
  group_by(shop_id) %>% 
  filter(shop_id != 78) %>% 
  summarise(total_revenue = sum(order_amount),
            total_orders = sum(total_items)) %>% 
  transmute(aov_3 = total_revenue/total_orders) %>% 
  ungroup() %>% 
  summarise(aov_3 = mean(aov_3))
aov_3
# we get the final AOV for each shop - 152
# With the outlier, the AOV would be 408 and now it appears to decrease a lot.