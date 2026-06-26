# Comprehensive SQL Data Analytics & Reporting Portfolio

![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Data Analytics](https://img.shields.io/badge/Data_Analytics-005571?style=for-the-badge)

## Overview
This repository contains a suite of advanced SQL scripts designed to extract, analyze, and report on e-commerce and retail business data. The analysis is broken down into four distinct projects, ranging from initial data exploration to advanced analytical problem-solving and the creation of comprehensive reporting views. 

The queries are built for a modern data warehouse environment, utilizing a star schema architecture with fact (`gold.fact_sales`) and dimension tables (`gold.dim_customers`, `gold.dim_products`)[cite: 1, 2, 3, 4].

## Table of Contents
- [Project Structure](#project-structure)
- [Key SQL Techniques Demonstrated](#key-sql-techniques-demonstrated)
- [Prerequisites](#prerequisites)
- [Usage](#usage)

## Project Structure

### 1. Data Exploration (`Data Exploration Project.sql`)
This script serves as the foundational profiling phase to understand the database schema, data ranges, and baseline metrics before performing deeper analysis.
* **Database Profiling:** Queries against `INFORMATION_SCHEMA` to explore available tables and columns[cite: 2].
* **Dimension & Date Exploration:** Identifies distinct categories, countries, first/last order dates, and customer age ranges[cite: 2].
* **Core Metrics:** Calculates baseline KPIs such as total sales, total orders, average price, and total customers[cite: 2].
* **Magnitude & Ranking Analysis:** Groups revenue and customer counts by country, gender, and category, alongside identifying the Top 5 and Bottom 5 performing products[cite: 2].

### 2. Advanced Data Analytics (`Advanced Data Analytics Project.sql`)
This script tackles complex business questions using advanced SQL techniques.
* **Time Series & Cumulative Analysis:** Calculates total monthly sales and running totals over time to track business growth[cite: 1].
* **Performance Tracking:** Uses `AVG() OVER()` and `LAG() OVER()` to flag products as above/below average and perform Year-Over-Year (YoY) growth analysis[cite: 1].
* **Part-To-Whole Analysis:** Determines the percentage contribution of each product category to overall business revenue[cite: 1].
* **Data Segmentation:** Utilizes `CASE` statements to group products into cost brackets (e.g., 'Below 100', '100-500') and bucket customers into behavioral tiers ('VIP', 'Regular', 'New') based on spending history and lifespan[cite: 1].

### 3. Customer 360 Report (`Full Customers Report Project.sql`)
This script creates a consolidated, production-ready View (`gold.report_customers`) that provides a 360-degree look at customer behavior and lifetime value[cite: 3].
* **Demographic Segmentation:** Categorizes customers into distinct age groups (e.g., 'Under 20', '20-29')[cite: 3].
* **Behavioral Tiers:** Classifies customers as 'VIP', 'Regular', or 'New' based on a 12-month minimum lifespan and a $5,000 spending threshold[cite: 3].
* **Key Performance Indicators:** Calculates critical customer metrics including recency (months since last order), total lifetime orders, Average Order Value (AOV), and Average Monthly Spend[cite: 3].

### 4. Product Performance Report (`Full Products Report Project.sql`)
This script creates a consolidated View (`gold.report_products`) to monitor product health, lifecycle, and profitability[cite: 4].
* **Revenue Segmentation:** Tags products as 'High-Performer', 'Mid-Range', or 'Low-performers' based on total lifetime sales[cite: 4].
* **Lifecycle Tracking:** Calculates product lifespan in months and tracks recency to identify active versus stagnant inventory[cite: 4].
* **Financial Metrics:** Aggregates total units sold, distinct customers reached, average selling price, and average monthly revenue per product[cite: 4].

## Key SQL Techniques Demonstrated
* **Window Functions:** `OVER()`, `PARTITION BY`, `LAG()`, `SUM() OVER()` for rolling calculations and comparative analysis[cite: 1].
* **Common Table Expressions (CTEs):** Used extensively for query readability and multi-step aggregations[cite: 1, 3, 4].
* **Date & Time Functions:** `DATETRUNC`, `DATEDIFF`, `GETDATE()`, and `YEAR()` for cohort and lifecycle mapping[cite: 1, 2, 3, 4].
* **Conditional Logic:** `CASE WHEN` statements for dynamic business bucketing and segmentation[cite: 1, 3, 4].
* **Data Definition Language (DDL):** `CREATE VIEW` for establishing persistent reporting layers[cite: 3, 4].
* **Aggregations & Grouping:** Complex `GROUP BY` logic combined with mathematical operations to derive business KPIs[cite: 1, 2, 3, 4].

## Prerequisites
* A SQL Server (or compatible relational database) environment.
* A database configured with a `gold` schema[cite: 1].
* Pre-loaded tables: `fact_sales`, `dim_customers`, and `dim_products` containing relevant retail/e-commerce data[cite: 1].

## Usage
1. Clone the repository to your local machine.
2. Open your preferred SQL client (e.g., SQL Server Management Studio, Azure Data Studio).
3. Connect to your data warehouse environment.
4. Run the scripts sequentially:
   * Start with `Data Exploration Project.sql` to familiarize yourself with the dataset.
   * Run `Advanced Data Analytics Project.sql` to execute the standalone analytical queries.
   * Execute `Full Customers Report Project.sql` and `Full Products Report Project.sql` to compile the final Views.
5. The generated Views (`gold.report_customers` and `gold.report_products`) can now be connected to a BI tool like Tableau or Power BI for visualization.
