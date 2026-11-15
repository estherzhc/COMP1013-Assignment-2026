# ==================================
# COMP1013 Analytic Programming
# Assignment 2026
# Name: Esther Zam Hau Cing
# Student Number: 22225729
# ==================================


#Load packages
library(tidyverse)
library(ggplot2)

#Load files
customers<-read.csv("customers.csv")
geolocation<-read.csv("geolocation.csv")
order_items<-read.csv("order_items.csv")
orders<-read.csv("orders.csv")
payments<-read.csv("payments.csv")
products<-read.csv("products.csv")
sellers<-ead.csv("sellers.csv")

names(customers)
names(geolocation)
names(order_items)
names(orders)     
names(payments)   
names(products)
names(sellers)

# ==================================
# TASK 1
# Product Prices and Shipping Costs
# ==================================
#Create a histogram to visualise the distribution of item prices

ggplot(data=order_items) + geom_histogram(mapping=aes(x=price), fill="steelblue", colour="black") + labs(title="Distribution of Item Prices", x="Price", y="Frequency")

#Calculate mean item price
mean_price<-mean(order_items$price)
print(mean_price)

#Calculate median item price
median_price<-median(order_items$price)
print(median_price)

#Join order_items and products using product_id
order_product_data<-order_items%>%
  left_join(products, by="product_id")

#Create a scatter plot of freight value against product weight
ggplot(data=order_product_data) + 
  geom_point(mapping=aes(x=product_weight_g, y=freight_value), colour="steelblue") + 
  labs(x="Product Weight(G)", y="Freight Value", title="Freight Value and Product Weight")

# ==================================
# TASK 2
# Orders That Were Not Delivered
# ==================================
#Count the number of orders in each order status
order_status_summary<-orders%>%
  count(order_status, name="order_count") %>%
  mutate(percentage=order_count/sum(order_count)*100)

print(order_status_summary)

#Create a bar chart of this order_status
ggplot(data=order_status_summary)+
    geom_col(mapping=aes(x=order_status, y=order_count), fill="steelblue") +
  labs(x="Order Status", y="Number of Orders", title="Number of Orders by Status")

#Calculate percentage of orders that are not delivered
not_delivered_percentage<- order_status_summary%>%
  filter(order_status!="delivered")%>%
  summarise(
    not_delivered=sum(percentage)
  )
  
print(not_delivered_percentage)

#Join orders.csv and customers.csv using customer_id
order_and_customers<- orders%>%
  left_join(customers, by="customer_id")

sum(is.na(order_and_customers$order_status))
sum(is.na(order_and_customers$customer_state))

#Calculate percentage of orders that are not delivered in each customer state
state_delivery_summary<- order_and_customers%>%
  group_by(customer_state)%>%
  summarise(
    total_orders=n(),
    not_delivered_orders= sum(order_status!="delivered"),
    not_delivered_pct= (not_delivered_orders/total_orders)*100
  )
print(state_delivery_summary)

#Create a bar chart of not delivered orders percentage by customer state
ggplot(data=state_delivery_summary) +
  geom_col(mapping=aes(x=customer_state, y=not_delivered_pct), fill="steelblue")+
  labs(x="Customer State", y="Not Delivered Percentage (%)", title="Percentage of Orders Not Delivered by State")

# ==================================
# TASK 3
# Payment Methods
# ==================================

#Calculate the number and percentage of payments for each payment type

payment_usage_frequency<- payments%>%
  count(payment_type, name="total_payment_number")%>%
  mutate(payment_usage_percentage=
           (total_payment_number/sum(total_payment_number)*100))

print(payment_usage_frequency)

#Produce a bar chart to visualize payment usage frequency

ggplot(data=payment_usage_frequency) +
  geom_col(mapping= aes(x=payment_type, y=payment_usage_percentage), fill="steelblue") +
  labs(x="Payment Type", y="Percentage of Payment Usage (%)", title="Payment Type Usage Frequency")







