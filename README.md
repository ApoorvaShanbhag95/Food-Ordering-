🍽️ Food Ordering SQL Analytics Project

A SQL-based project simulating a Food Ordering system that demonstrates how to extract meaningful business insights from order data. The goal is to showcase analytics on customer behaviour, restaurant performance, promotion effectiveness, and retention.

📋 Project Overview

This project builds a database with tables such as:

Customers

Restaurants / Outlets

Cuisine Types

Orders

Promotions

Using SQL (joins, window functions, subqueries, aggregations, etc.), it answers real-world business questions like:

Who are our top performing restaurants & cuisines?

How many new customers do we acquire each day?

Which customers order only once? Which are inactive?

What is the impact of promotions vs organic growth?

How strong is customer retention?

🔍 Key Business Insights & Queries

Here are some of the queries / analyses included:

Top Outlets by Cuisine Type – Ranking restaurants by performance per cuisine using window functions.

Daily New Customer Acquisition – Tracking how many new customers are joining daily.

One-Time Customers – Identifying customers who placed only one order in a given month and never returned.

Inactive Customers – Users who joined a while ago but haven’t placed an order recently.

Customer Retention Triggers – Finding customers for targeted engagement based on order frequency (e.g. after the 3rd order).

Promo-Only Customers – Customers who always use promotions rather than paying full price.

Organic Acquisition Percentage – Proportion of customers acquired without promo codes in a specific period.

🛠 Tools & Techniques

SQL (including window functions, CTEs, aggregates, joins, subqueries)

Query Optimization / tuning for readable and efficient queries

Business Metrics: acquisition rate, retention rate, promo effectiveness, organic growth

📂 Repository Structure

Food-Ordering/

├── README.md                             # This file

├── Food_ordering.sql                     # SQL schema + sample queries

└── dml_script_food_ordering.sql          # Data operations (inserts, updates etc.)

🎯 Business Value

Helps in tracking how well restaurants / cuisines are performing

Enables measuring the ROI of promotional campaigns

Provides visibility into customer lifecycle: new customers, inactive, retention

Supports strategy development: e.g., which outlets to scale, what promotions to run, which customers need retention offers
