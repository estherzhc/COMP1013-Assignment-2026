# ==================================
# COMP1013 Analytic Programming
# Assignment 2026
# Name: Esther Zam Hau Cing
# Student Number: 22225729
# ==================================


#Load packages
library(tidyverse)

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


# ==================================
# TASK 2
# Orders That Were Not Delivered
# ==================================


# ==================================
# TASK 3
# Payment Methods
# ==================================