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
customers=read_csv("customers.csv")
geolocation=read.csv("geolocation.csv")
order_items=read.csv("order_items.csv")
orders=read_csv("orders.csv")
payments=read_csv("payments.csv")
products=read_csv("products.csv")
sellers=read_csv("sellers.csv")

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
mean_price=mean(order_items$price)
print(mean_price)

#Calculate median item price
median_price=median(order_items$price)
print(median_price)

# ==================================
# TASK 2
# Orders That Were Not Delivered
# ==================================


# ==================================
# TASK 3
# Payment Methods
# ==================================