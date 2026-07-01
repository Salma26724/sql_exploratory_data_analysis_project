# 📊 Business Sales Analytics Dashboard | Power BI

## 📌 Project Overview

This project is the visualization layer of my **SQL Data Warehouse & Analytics Project**. The dashboard transforms the curated data warehouse into an interactive business intelligence solution that enables stakeholders to monitor sales performance, analyze products, and gain customer insights.

The report was built using **Power BI** on top of a **star schema** data warehouse created in SQL Server.

---

## 🎯 Business Objective

The dashboard was designed to answer key business questions such as:

- How is the business performing overall?
- Which products generate the highest revenue?
- Which customers contribute the most sales?
- How do sales change over time?
- Which product categories perform best?
- How are customers segmented based on purchasing behavior?

---

## 🛠️ Tech Stack

- **Power BI Desktop**
- **SQL Server**
- **DAX**
- **Power Query**
- **Star Schema Data Model**

---

# 📑 Dashboard Pages

## 1️⃣ Executive Overview

Provides a high-level summary of business performance through key metrics and sales trends.

### KPIs

- Total Sales
- Total Orders
- Total Customers
- Products Sold
- Average Order Value

### Visuals

- Monthly Sales Trend
- Sales by Category
- Top Products by Revenue
- Sales by Country

---

## 2️⃣ Product Performance

Analyzes product performance to identify best-selling and underperforming products.

### KPIs

- Best Selling Product
- Lowest Selling Product
- Average Product Revenue
- Active Products

### Visuals

- Top Products by Revenue
- Product Performance Matrix
- Year-over-Year Product Analysis
- Product Performance Table

---

## 3️⃣ Customer Insights

Provides customer analytics and segmentation.

### KPIs

- Total Customers
- VIP Customers
- Average Customer Spend
- Average Customer Lifetime

### Customer Segments

- VIP
- Regular
- New

### Visuals

- Customer Segmentation
- Top Customers
- Customer Spending Analysis
- Customer Detail Table

---

## 4️⃣ Business Performance

Provides category-level insights and identifies business growth opportunities.

### Visuals

- Category Performance
- Sales Distribution
- Category Ranking
- Category Summary Table

---

# 📈 Customer Segmentation Logic

Customers are segmented using business rules originally developed in SQL.

| Segment | Criteria |
|---------|----------|
| VIP | Customer lifespan ≥ 12 months AND Total Spending > $5,000 |
| Regular | Customer lifespan ≥ 12 months AND Total Spending ≤ $5,000 |
| New | Customer lifespan < 12 months |

---

# 📊 Key Features

- Interactive slicers
- Cross-filtering between visuals
- Custom DAX measures
- Customer segmentation
- Product performance analysis
- Executive KPI dashboard
- Professional dark executive theme
- Business-focused report design

---

# 📂 Data Model

The dashboard is built on a SQL Server star schema consisting of:

### Fact Table

- Fact Sales

### Dimension Tables

- Customers
- Products
- Dates

---

# 📸 Dashboard Preview

<img width="1674" height="938" alt="Business Salary Dashboard" src="https://github.com/user-attachments/assets/0fbb4e27-35ba-421d-9560-2377ad1239d8" />


---

# 🚀 Business Insights

The dashboard enables users to:

- Monitor sales performance over time
- Identify high-performing products
- Detect underperforming products
- Analyze customer purchasing behavior
- Segment customers based on value
- Discover sales opportunities across categories
- Support data-driven business decisions

---

# 🔗 Related Project

This dashboard was developed as the reporting layer for my SQL Data Warehouse project.

The SQL project includes:

- Data Warehouse Design
- ETL Process
- Star Schema Modeling
- Data Cleaning
- Business Views
- Advanced SQL Analytics

---



# 💡 Skills Demonstrated

- SQL Data Warehousing
- Data Modeling
- Power BI Development
- DAX
- Power Query
- Dashboard Design
- Business Intelligence
- Data Visualization
- KPI Development
- Customer Analytics
- Product Analytics
- Executive Reporting

---

## ⭐ About This Project

This project demonstrates an end-to-end Business Intelligence workflow, starting with building a SQL data warehouse and ending with an interactive Power BI dashboard. The goal was to transform raw transactional data into actionable insights through professional reporting and data visualization techniques.
