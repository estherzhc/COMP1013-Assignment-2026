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
customers=read.csv("customers.csv")
geolocation=read.csv("geolocation.csv")
order_items=read.csv("order_items.csv")
orders=read.csv("orders.csv")
payments=read.csv("payments.csv")
products=read.csv("products.csv")
sellers=read.csv("sellers.csv")

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
#Count the number of orders in each order staus
order_status_summary<-orders%>%
  count(order_status, name="order_count") %>%
  mutate(percentage=order_count/sum(order_count)*100)

print(order_status_summary)

#Create a bar chart of this order_status
ggplot(data=order_status_summary)+
    geom_col(mapping=aes(x=order_status, y=order_count), fill="steelblue") +
  labs(x="Order Status", y="Number of Orders", title="Order Status Summary")

#Find orders percentages those are not delivered
not_delivered_percentage<- order_status_summary%>%
  filter(order_status!="delivered")%>%
  summarise(
    not_delivered=sum(percentage)
  )
  
print(not_delivered_percentage)

# ==================================
# TASK 3
# Payment Methods
# ==================================