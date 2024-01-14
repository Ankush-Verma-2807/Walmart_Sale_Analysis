# Walmart Sales Data Analysis

## Overview

This project aims to analyze Walmart sales data to gain insights into the performance of different branches, products, and customer segments. The dataset used for this analysis was obtained from the Kaggle Walmart Sales Forecasting Competition.

### Purpose

The main objectives of this project include:

- Understanding top-performing branches and products.
- Analyzing sales trends for different product lines.
- Identifying customer segments and their purchasing behavior.
- Providing insights to improve and optimize sales strategies.

## Dataset Information

The dataset contains sales transactions from three different branches of Walmart located in Mandalay, Yangon, and Naypyitaw. It includes 17 columns and 1000 rows, covering various aspects such as invoice details, branch information, customer demographics, product details, pricing, and ratings.

### Schema

- `invoice_id`: Invoice of the sales made (VARCHAR(30))
- `branch`: Branch at which sales were made (VARCHAR(5))
- `city`: The location of the branch (VARCHAR(30))
- `customer_type`: The type of the customer (VARCHAR(30))
- `gender`: Gender of the customer making a purchase (VARCHAR(10))
- `product_line`: Product line of the product sold (VARCHAR(100))
- `unit_price`: The price of each product (DECIMAL(10, 2))
- `quantity`: The amount of the product sold (INT)
- `VAT`: The amount of tax on the purchase (FLOAT(6, 4))
- `total`: The total cost of the purchase (DECIMAL(10, 2))
- `date`: The date on which the purchase was made (DATE)
- `time`: The time at which the purchase was made (TIMESTAMP)
- `payment_method`: The total amount paid (DECIMAL(10, 2))
- `cogs`: Cost Of Goods Sold (DECIMAL(10, 2))
- `gross_margin_percentage`: Gross margin percentage (FLOAT(11, 9))
- `gross_income`: Gross Income (DECIMAL(10, 2))
- `rating`: Rating (FLOAT(2, 1))

## Project Structure

The project follows a structured approach:

1. **Data Wrangling**: Handling NULL values, creating a database, and table creation.
2. **Feature Engineering**: Creating new columns for time_of_day, day_name, and month_name.
3. **Exploratory Data Analysis (EDA)**: Analyzing product data, sales trends, and customer behavior.
4. **Business Questions Answered**: Addressing specific questions related to products, sales, and customers.
5. **Revenue and Profit Calculations**: Calculating COGS, VAT, total revenue, and gross profit.

## Analysis List

### Product Analysis

- Identifying top-performing product lines.
- Analyzing sales trends for different product lines.

### Sales Analysis

- Investigating sales trends and strategies.
- Assessing the effectiveness of sales strategies.

### Customer Analysis

- Understanding customer segments and purchase trends.
- Analyzing the profitability of each customer segment.

## Business Questions Answered

The analysis addresses several business questions, including:

- Identifying unique cities in the dataset.
- Determining the branch location for each store.
- Analyzing product lines, payment methods, and top-selling products.
- Calculating total revenue by month and identifying peak sales months.
- Analyzing VAT, COGS, and gross margin for product lines and cities.
- Assessing customer types, gender distribution, and customer ratings.
