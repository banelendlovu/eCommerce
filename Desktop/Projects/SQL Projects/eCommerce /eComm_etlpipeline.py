# Importing required libraries

from sqlalchemy import create_engine
import pandas as pd
from dotenv import load_dotenv
import os

load_dotenv()

# Define databse connection parameters

db_user = os.getenv('DB_USER')
db_password = os.getenv('DB_PASSWORD')
db_host = os.getenv('DB_HOST')
db_name = os.getenv('DB_NAME')

# Create database connection string

engine = create_engine(f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}/{db_name}")
print("Database connection successful!")

# Queries to perform ETL operations

# Retrieve all orders with customer details (order ID, date, status, customer name, email, address)

'''
query = "SELECT * FROM orders"
df = pd.read_sql(query, engine)
print(df.head())  # Display first few rows

'''

orders_query = "select o.orderID, o.orderDate, o.orderStatus, c.custName, c.email, c.address " \
"               from orders o " \
"               join customers c " \
"               on o.custID = c.custID"
orders_df = pd.read_sql(orders_query, engine)
print(orders_df)

# Extract product details with their respective categories (product ID, name, price, stock, category)

products_query = "select p.productID, p.productName, p.price, p.stock, c.catName" \
"                 from products p" \
"                 join category c" \
"                 on p.productID = c.productID"
products_df = pd.read_sql(products_query, engine)
print(products_df)

# Get order details, including product names, quantities, and prices for each order 

orderDet_query = "select p.productName, od.quantity, od.price" \
"                from products p" \
"                join orderDetails od" \
"                on p.productID = od.productID" 
orderDet_df = pd.read_sql(orderDet_query, engine)
print(orderDet_df)

# Calculate the total revenue per product sale

total_rev_product = "select orderID, sum(price * quantity) as total_revenue" \
"                    from orderDetails"\
"                    group by orderID"
total_rev_df = pd.read_sql(total_rev_product, engine)
print(total_rev_df)

# Categorize orders based on status (Pending → Processing, Shipped → In Transit, Delivered → Completed) 

category_query = "select orderID, orderStatus," \
"                 case"\
"                   when orderStatus = 'Pending' then 'Processing'" \
"                   when orderStatus = 'Shipped' then 'In Transit'" \
"                   when orderStatus = 'Delivered' then 'Completed'" \
"                   else orderStatus" \
"                 end as currentStatus" \
"                 from orders"

category_query_df = pd.read_sql(category_query, engine)
print(category_query_df)

# Identify the top 5 best-selling products based on total quantity sold

top_selling = "select p.productName, od.quantity" \
"              from products p" \
"              join orderDetails od"\
"              on p.productID = od.productID" \
"              order by quantity desc" \
"              limit 5"

top_selling_df = pd.read_sql(top_selling, engine)
print(top_selling_df)

# Creating ETL summary table 

# Merge total revenue and categorized order status by orderID
etl_df = pd.merge(total_rev_df, category_query_df, on='orderID', how='inner')

# Select and rename relevant columns
etl_df = etl_df[['orderID', 'total_revenue', 'currentStatus']]
etl_df.rename(columns={'currentStatus': 'order_category'}, inplace=True)

print(etl_df)
