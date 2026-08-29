# 📊 SQL Sales Analytics & Customer Intelligence

## End-to-End SQL Analytics Case Study | Data Warehouse → Analysis → Reporting

> A production-style SQL analytics project focused on transforming a dimensional sales data model into actionable business intelligence through advanced SQL analysis, customer segmentation, product performance analysis, cumulative metrics, time-series analysis, and analytical reporting.

---

## 📌 Project Overview

This project is an **end-to-end SQL Analytics Case Study** built on top of a simplified **Data Warehouse** architecture.

The objective is not simply to write SQL queries and retrieve numbers.

The real objective is to answer a much more important question:

> **How can raw transactional data be transformed into structured business intelligence that helps decision-makers understand customers, products, sales performance, and business growth?**

The project starts from a dimensional data model containing:

* Customer information
* Product information
* Sales transactions

From there, SQL is used to progressively transform the data into:

```text
Raw Data
   ↓
Data Warehouse Tables
   ↓
Exploratory Analysis
   ↓
Time-Series Analysis
   ↓
Cumulative Analysis
   ↓
Performance Analysis
   ↓
Segmentation
   ↓
Customer Analytics
   ↓
Product Analytics
   ↓
Reporting Layer
   ↓
Business Intelligence
```

The project demonstrates how SQL can move beyond basic:

```sql
SELECT
FROM
WHERE
```

and become a complete analytical tool.

---

# 🧠 Business Case

Imagine working as a **Data Analyst / BI Analyst** inside a retail organization.

The company already has transactional data, but the raw tables do not directly answer the questions that management cares about.

Business stakeholders want to know:

### Sales

* How are sales changing over time?
* Which years generated the highest revenue?
* How much revenue has accumulated over time?
* What is the average selling price?
* Is the business growing or declining?

### Customers

* Who are the most valuable customers?
* How much does each customer spend?
* How frequently do customers purchase?
* How long have customers been active?
* Which customers are VIPs?
* Which customers are new?

### Products

* Which products generate the most revenue?
* Which products are high performers?
* Which products are underperforming?
* Which categories contribute the most to revenue?
* How many customers purchase each product?

### Performance

* Is a product performing above or below its historical average?
* Did product sales increase or decrease compared with the previous year?
* What is the difference between current performance and previous performance?

The SQL layer in this project is designed to answer these questions systematically.

---

# 🏗️ Data Architecture

The project follows a simplified **Star Schema** structure.

```text
                    ┌─────────────────────┐
                    │   dim_customers     │
                    │─────────────────────│
                    │ customer_key        │
                    │ customer_id         │
                    │ customer_number     │
                    │ first_name          │
                    │ last_name           │
                    │ country             │
                    │ marital_status      │
                    │ gender              │
                    │ birthdate           │
                    │ create_date         │
                    └──────────┬──────────┘
                               │
                               │
                               ▼
                    ┌─────────────────────┐
                    │     fact_sales      │
                    │─────────────────────│
                    │ order_number        │
                    │ product_key         │
                    │ customer_key        │
                    │ order_date          │
                    │ shipping_date       │
                    │ due_date             │
                    │ sales_amount        │
                    │ quantity            │
                    │ price               │
                    └──────────┬──────────┘
                               │
                               │
                               ▼
                    ┌─────────────────────┐
                    │    dim_products     │
                    │─────────────────────│
                    │ product_key        │
                    │ product_id         │
                    │ product_number     │
                    │ product_name       │
                    │ category_id        │
                    │ category           │
                    │ subcategory        │
                    │ maintenance        │
                    │ cost               │
                    │ product_line       │
                    │ start_date         │
                    └─────────────────────┘
```

### Schema

All analytical objects are organized under:

```sql
gold
```

The main tables are:

```text
gold.dim_customers
gold.dim_products
gold.fact_sales
```

The reporting layer contains:

```text
gold.report_customers
gold.report_products
```

---

# 🗂️ Project Structure

Recommended repository structure:

```text
SQL-Sales-Analytics/
│
├── README.md
│
├── datasets/
│   ├── gold.dim_customers.csv
│   ├── gold.dim_products.csv
│   └── gold.fact_sales.csv
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_exploratory_analysis.sql
│   ├── 03_time_series_analysis.sql
│   ├── 04_cumulative_analysis.sql
│   ├── 05_performance_analysis.sql
│   ├── 06_segmentation.sql
│   ├── 07_customer_report.sql
│   └── 08_product_report.sql
│
├── reports/
│   ├── customer_report/
│   └── product_report/
│
└── docs/
    ├── data_model.md
    └── business_questions.md
```

---

# 🛠️ Technology Stack

| Technology           | Purpose                          |
| -------------------- | -------------------------------- |
| SQL Server           | Database engine                  |
| T-SQL                | Data analysis and transformation |
| SQL Window Functions | Analytical calculations          |
| CTEs                 | Query modularization             |
| Views                | Reusable reporting layer         |
| Aggregations         | KPI generation                   |
| Power BI / BI Tool   | Visualization and reporting      |
| CSV                  | Source datasets                  |

---

# 🗄️ Database Setup

The project creates a database called:

```sql
DataWarehouseAnalytics
```

The database contains a dedicated analytical schema:

```sql
gold
```

The setup process:

```text
Check Database
      ↓
Drop Existing Database
      ↓
Create Database
      ↓
Create gold Schema
      ↓
Create Dimension Tables
      ↓
Create Fact Table
      ↓
Load CSV Data
```

> ⚠️ The original database initialization script intentionally drops and recreates the database. This should only be executed in a development or disposable environment unless proper backups exist.

---

# 📐 Data Model

## Customer Dimension

```text
gold.dim_customers
```

Stores customer attributes.

Important analytical columns include:

```text
customer_key
customer_number
first_name
last_name
country
gender
birthdate
create_date
```

---

## Product Dimension

```text
gold.dim_products
```

Stores product attributes.

Important analytical columns include:

```text
product_key
product_name
category
subcategory
cost
product_line
start_date
```

---

## Sales Fact

```text
gold.fact_sales
```

Stores transactional sales information.

Important analytical columns include:

```text
order_number
product_key
customer_key
order_date
shipping_date
due_date
sales_amount
quantity
price
```

---

# 🔍 Analytical Approach

One of the most important lessons from this project is that analytical SQL is not about immediately writing a complicated query.

The process is closer to:

```text
Business Question
       ↓
Identify Required Metric
       ↓
Identify Required Column
       ↓
Identify Source Table
       ↓
Understand Relationships
       ↓
Join Required Tables
       ↓
Choose Aggregation Level
       ↓
Group Data
       ↓
Apply Analytical Function
       ↓
Interpret Result
```

For example:

> "How much revenue did each product generate every year?"

This requires thinking through:

```text
Revenue
  ↓
sales_amount
  ↓
fact_sales
  ↓
Product Name
  ↓
dim_products
  ↓
Relationship
  ↓
product_key
  ↓
Time
  ↓
order_date
  ↓
Granularity
  ↓
Year + Product
```

That reasoning process is the actual analytical skill.

---

# ⏱️ 1. Time-Series Analysis

The first analytical layer examines how the business changes over time.

The analysis aggregates sales by year and calculates:

* Total Sales
* Total Customers
* Total Quantity

Conceptually:

```text
Year
 ↓
Total Sales
 ↓
Total Customers
 ↓
Total Quantity
```

Example analytical structure:

```sql
SELECT
    DATETRUNC(YEAR, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR, order_date)
ORDER BY DATETRUNC(YEAR, order_date);
```

### Why this matters

Time-series analysis establishes the business baseline.

Before analyzing customers or products, we need to understand:

> **What happened to the business over time?**

---

# 📈 2. Cumulative Analysis

A normal aggregation tells us the value for a specific period.

A cumulative calculation tells us how that value builds over time.

This project uses:

```sql
SUM(...) OVER (ORDER BY ...)
```

to calculate running sales.

Conceptually:

```text
January       → 100
February      → 250
March         → 420
April         → 610
```

The cumulative metric becomes:

```text
January       → 100
February      → 350
March         → 770
April         → 1380
```

This provides a much clearer view of long-term growth.

---

# 📊 3. Moving Average Analysis

The project also calculates an analytical average over time.

The objective is to reduce the noise created by individual periods and observe broader performance behavior.

The analytical pattern is:

```sql
AVG(avg_price) OVER (
    ORDER BY order_date
)
```

This introduces the concept of **Window Functions** as an analytical layer rather than a simple aggregation.

---

# ⚔️ 4. Performance Analysis

One of the most interesting sections of the project is product performance analysis.

The objective is to compare:

```text
Current Year
      VS
Previous Year
```

and:

```text
Current Performance
      VS
Historical Average
```

The query first creates yearly product-level sales:

```sql
WITH Yearly_Product_Sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY
        YEAR(f.order_date),
        p.product_name
)
```

Then analytical window functions are applied.

---

# 🪟 Window Functions

This project makes extensive use of analytical SQL features such as:

```sql
LAG()
```

```sql
AVG() OVER()
```

```sql
SUM() OVER()
```

These functions allow us to analyze a row while still retaining information about neighboring or related rows.

---

## LAG()

`LAG()` allows comparison with a previous period.

Conceptually:

```text
2021 → 100
2022 → 150
2023 → 120
```

Using `LAG()`:

```text
2021 → NULL
2022 → 100
2023 → 150
```

This enables:

```text
Current Sales - Previous Sales
```

which creates a direct year-over-year comparison.

---

# 📉 Performance Classification

The project converts numerical differences into business-friendly categories.

For example:

```text
Increase
Decrease
No Change
```

and:

```text
Above Average
Below Average
Average
```

This is important because analytics should not stop at calculating a number.

The number should become interpretable information.

---

# 🧩 5. Category Contribution Analysis

The project analyzes how much each product category contributes to total sales.

The calculation includes:

```text
Category Sales
      ↓
Total Sales
      ↓
Percentage of Total
```

The analytical pattern is:

```sql
SUM(total_sales_per_category) OVER()
```

This allows every category to be evaluated against the overall business revenue.

The resulting question becomes:

> **What percentage of total revenue is generated by each category?**

This is significantly more useful for business decision-making than simply listing category revenue.

---

# 🧮 6. Product Segmentation

Products are segmented according to cost.

The segmentation logic creates groups such as:

```text
Below 100
100-500
500-1000
Above 1000
```

This transforms a continuous numerical variable into business-friendly categories.

The general analytical principle is:

```text
Raw Numeric Value
       ↓
Business Rule
       ↓
Business Segment
```

This technique is widely applicable in:

* Customer segmentation
* Product segmentation
* Pricing analysis
* Risk classification
* Revenue analysis

---

# 👥 7. Customer Segmentation

Customer behavior is analyzed using multiple dimensions.

The project considers:

```text
Total Spending
First Order
Last Order
Customer Lifespan
```

The customer segmentation rules are:

### VIP

```text
Lifespan >= 12 months
AND
Total Spending > 5000
```

### Regular

```text
Lifespan >= 12 months
AND
Total Spending <= 5000
```

### New

```text
Lifespan < 12 months
```

This produces a customer distribution such as:

```text
VIP
Regular
New
```

The goal is to move from:

> "How many customers do we have?"

to:

> "What type of customers do we have, and how do they behave?"

---

# 👤 8. Customer Report

The customer report is one of the core deliverables of the project.

The objective is to create a reusable analytical view:

```sql
gold.report_customers
```

Instead of rebuilding customer calculations every time, the business can query a standardized reporting layer.

---

## Customer Report Architecture

The report is constructed through multiple analytical stages.

```text
fact_sales
     +
dim_customers
     ↓
Base Query
     ↓
Customer Aggregation
     ↓
Customer Segmentation
     ↓
Age Grouping
     ↓
KPI Calculation
     ↓
Customer Report
```

---

# 📊 Customer KPIs

The report generates:

### Customer Information

```text
Customer Key
Customer Number
Customer Name
Age
Age Group
```

### Customer Classification

```text
Customer Segment
```

### Behavioral Metrics

```text
Last Order Date
Recency
Total Orders
Total Sales
Total Quantity
Total Products
Lifespan
```

### Derived KPIs

```text
Average Order Value
Average Monthly Spend
```

---

# 💰 Average Order Value

The project calculates:

```text
Average Order Value =
Total Sales / Total Orders
```

This answers:

> **How much revenue does the average customer order generate?**

---

# 📅 Customer Recency

Recency measures how long it has been since the customer's latest transaction.

Conceptually:

```text
Current Date
      -
Last Order Date
      =
Recency
```

Recency is useful for identifying customers who may be becoming inactive.

---

# ⏳ Customer Lifespan

The customer lifespan is calculated using the first and last observed order dates.

```text
Last Order Date
        -
First Order Date
        =
Customer Lifespan
```

This creates a temporal dimension for customer behavior.

---

# 🧑‍💼 Customer Age Groups

Customers are also classified into age groups:

```text
Under 20
20-29
30-39
40-49
50 and above
```

This enables demographic analysis alongside behavioral analysis.

---

# 📦 9. Product Report

The second major reporting layer is:

```sql
gold.report_products
```

This view converts transactional product data into a business-ready product performance dataset.

---

## Product Report Architecture

```text
fact_sales
     +
dim_products
     ↓
Base Query
     ↓
Product Aggregation
     ↓
Product Segmentation
     ↓
KPI Calculation
     ↓
Product Report
```

---

# 📊 Product KPIs

The report provides:

```text
Product Key
Product Name
Category
Subcategory
Cost
Last Sale Date
Recency
Product Segment
Lifespan
Total Orders
Total Sales
Total Quantity
Total Customers
Average Selling Price
Average Order Revenue
Average Monthly Revenue
```

---

# 🏆 Product Segmentation

Products are classified based on revenue.

### High Performer

```text
Total Sales > 50,000
```

### Mid-Range

```text
Total Sales >= 10,000
```

### Low Performer

```text
Total Sales < 10,000
```

This converts revenue into an immediately understandable business classification.

---

# 💵 Average Selling Price

The project calculates an average selling price using sales amount and quantity.

Conceptually:

```text
Sales Amount
     /
Quantity
     =
Selling Price
```

The calculation also protects against division by zero using:

```sql
NULLIF(quantity, 0)
```

This is an important example of defensive SQL programming.

---

# 📦 Average Order Revenue

The product report calculates:

```text
Total Sales
    /
Total Orders
```

This measures the average revenue generated per order containing the product.

---

# 📅 Average Monthly Revenue

The report also estimates:

```text
Total Sales
     /
Lifespan
```

When lifespan equals zero, the project avoids division by zero and uses total sales as the fallback value.

---

# 🧠 Analytical SQL Techniques Demonstrated

This project covers a broad range of practical SQL techniques.

## Core SQL

```text
SELECT
WHERE
GROUP BY
ORDER BY
JOIN
LEFT JOIN
CASE
```

## Aggregation

```text
SUM
COUNT
COUNT DISTINCT
AVG
MIN
MAX
```

## Date Analysis

```text
YEAR
DATEDIFF
DATETRUNC
GETDATE
```

## Advanced SQL

```text
CTE
Window Functions
LAG
SUM OVER
AVG OVER
```

## Database Engineering

```text
CREATE DATABASE
CREATE SCHEMA
CREATE TABLE
CREATE VIEW
DROP VIEW
TRUNCATE TABLE
BULK INSERT
```

## Analytical Modeling

```text
Segmentation
Recency
Lifespan
Running Totals
Moving Averages
Year-over-Year Comparison
Percentage Contribution
Performance Classification
```

---

# 🔬 The Real Analytical Challenge

The difficult part of this project is not remembering SQL syntax.

The difficult part is answering:

> **Which data do I actually need?**

For every business question, the analyst has to determine:

```text
1. What is the business question?

2. What metric answers it?

3. Which column contains that metric?

4. Which table contains the column?

5. Which table contains the required dimension?

6. What relationship connects the tables?

7. At what granularity should the data be aggregated?

8. Do I need GROUP BY?

9. Do I need a Window Function?

10. Do I need a CTE?

11. Should the result become a reusable View?

12. What does the final number actually mean?
```

That is the difference between:

```text
SQL Developer
```

writing a query and:

```text
Data Analyst
```

building an analytical solution.

---

# 🧱 Layered Query Design

A major design pattern used throughout this project is breaking complex logic into layers.

Instead of writing one giant query:

```text
Raw Tables
     ↓
Base Query
     ↓
Aggregation
     ↓
Transformation
     ↓
Business Logic
     ↓
Final Result
```

CTEs make this architecture explicit.

For example:

```sql
WITH base_query AS (
    ...
),
customer_aggregation AS (
    ...
)
SELECT
    ...
FROM customer_aggregation;
```

This makes analytical SQL easier to:

* Read
* Debug
* Maintain
* Extend
* Review

---

# 📋 Reporting Layer

The final reports are implemented as SQL Views.

```sql
gold.report_customers
gold.report_products
```

This creates a clean separation between:

```text
Transactional Data
        ↓
Analytical Logic
        ↓
Reporting Layer
        ↓
BI Dashboard
```

A BI tool can then consume the reporting views without repeatedly implementing the underlying business logic.

---

# 📊 Dashboard / BI Layer

The SQL analysis can feed a dashboard containing two major analytical perspectives.

## Customer Intelligence

Potential dashboard sections:

```text
Total Customers
Total Sales
Average Order Value
Customer Segments
Age Groups
Recency
Customer Lifespan
Top Customers
```

## Product Intelligence

Potential dashboard sections:

```text
Total Products
Total Sales
Product Segments
Category Performance
Top Products
Product Recency
Average Selling Price
Average Monthly Revenue
```

The dashboard is therefore not an isolated visualization.

It is the final layer of an analytical pipeline:

```text
Data Warehouse
      ↓
SQL Transformation
      ↓
Analytical Models
      ↓
Reporting Views
      ↓
Dashboard
      ↓
Business Decisions
```

---

# 🎯 Business Questions Answered

This project provides a framework for answering questions such as:

### Sales Performance

* How much revenue was generated each year?
* How many customers purchased each year?
* How many products were sold?
* What is the cumulative revenue?
* How does average price evolve over time?

### Product Performance

* Which products generate the most revenue?
* Which products are above their historical average?
* Which products increased compared with the previous year?
* Which products decreased?
* Which categories contribute most to revenue?
* Which products are high, mid-range, or low performers?

### Customer Intelligence

* How many customers are VIP?
* How many are Regular?
* How many are New?
* How much does each customer spend?
* What is customer recency?
* How long does a customer remain active?
* What is the customer's average order value?
* What is the customer's average monthly spend?

---

# 🧪 Data Quality Considerations

Analytical queries should not assume that every record is perfect.

The project therefore demonstrates several defensive techniques.

### Null Dates

```sql
WHERE order_date IS NOT NULL
```

This prevents invalid date records from affecting time-based analysis.

### Division by Zero

```sql
NULLIF(quantity, 0)
```

and:

```sql
CASE
    WHEN total_orders = 0 THEN 0
    ELSE total_sales / total_orders
END
```

### Zero Lifespan

```sql
CASE
    WHEN lifespan = 0 THEN total_sales
    ELSE total_sales / lifespan
END
```

These patterns prevent analytical queries from failing because of problematic records.

---

# ⚠️ Engineering Notes

This project was built as an analytical case study, so some implementation details should be improved before using the architecture in a production environment.

## Data Types

Financial values such as:

```text
sales_amount
price
cost
```

would generally be better represented using a precise decimal type such as:

```sql
DECIMAL(18,2)
```

rather than integer types when fractional monetary values are possible.

---

## Keys and Constraints

Production tables should explicitly define:

```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
```

where appropriate.

The simplified analytical dataset intentionally focuses more on SQL analysis than full database governance.

---

## File Loading

The original loading process uses:

```sql
BULK INSERT
```

with a local Windows file path.

For another environment, the path must be changed to match the local dataset location.

Example:

```sql
FROM 'C:\path\to\gold.fact_sales.csv'
```

The exact path is environment-specific and should not be hardcoded into a portable production repository.

---

# 🚀 How to Run the Project

## 1. Clone the Repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
```

## 2. Open SQL Server

Use a SQL Server-compatible environment such as:

```text
SQL Server Management Studio
```

or:

```text
Azure Data Studio
```

## 3. Prepare the Dataset

Place the CSV files in an accessible directory:

```text
gold.dim_customers.csv
gold.dim_products.csv
gold.fact_sales.csv
```

## 4. Execute Database Setup

Run:

```text
01_database_setup.sql
```

This creates:

```text
DataWarehouseAnalytics
```

and:

```text
gold
```

schema.

## 5. Load the Data

Execute the `BULK INSERT` statements after updating the file paths.

## 6. Execute Analysis Scripts

Run the analytical scripts in sequence:

```text
02_exploratory_analysis.sql
03_time_series_analysis.sql
04_cumulative_analysis.sql
05_performance_analysis.sql
06_segmentation.sql
07_customer_report.sql
08_product_report.sql
```

## 7. Query the Reporting Layer

```sql
SELECT *
FROM gold.report_customers;
```

and:

```sql
SELECT *
FROM gold.report_products;
```

---

# 📚 Learning Outcomes

After completing this project, the analyst should be comfortable with:

* Translating business questions into SQL problems
* Navigating a dimensional data model
* Choosing the correct columns and tables
* Joining fact and dimension tables
* Aggregating data at the correct grain
* Building analytical CTEs
* Using SQL Window Functions
* Performing Year-over-Year analysis
* Creating cumulative metrics
* Calculating moving averages
* Performing customer segmentation
* Performing product segmentation
* Building reusable reporting views
* Creating business-oriented KPIs
* Designing SQL logic for BI dashboards
* Thinking about data quality and defensive SQL
* Connecting SQL outputs to business decisions

---

# 🧭 Project Mindset

The strongest lesson from this project is not a specific SQL function.

It is the analytical workflow.

A business problem does not arrive saying:

```text
"Use LAG() here."
```

It arrives saying:

```text
"Why did product performance change?"
```

The analyst then has to discover the path:

```text
Business Question
       ↓
Metric
       ↓
Column
       ↓
Table
       ↓
Relationship
       ↓
Aggregation
       ↓
Window Function
       ↓
Comparison
       ↓
Interpretation
```

That reasoning process is the core of SQL Analytics.

---

# 🏆 Case Study Summary

This project demonstrates how a relatively small dimensional data model can become a complete analytical environment.

The workflow covers:

```text
Data Warehouse
      ↓
Data Exploration
      ↓
Time-Series Analysis
      ↓
Cumulative Analysis
      ↓
Performance Analysis
      ↓
Segmentation
      ↓
Customer Intelligence
      ↓
Product Intelligence
      ↓
Reporting Views
      ↓
BI Dashboard
```

The final result is not just a collection of SQL queries.

It is an analytical system that converts transactional data into structured information for business decision-making.

---

# 🤝 Learning & Attribution

This project was developed as part of my learning journey through the SQL Analytics / Data Warehouse Analytics material presented by **Baraa** from **Data with Baraa**.

Special thanks to **Baraa** for creating practical, challenging, and highly structured projects that force the learner to think analytically rather than simply memorize SQL syntax.

The project was especially valuable because it demonstrated how multiple SQL concepts can work together inside one realistic analytical workflow.

---

# 👨‍💻 Author

**Mahmoud Nasr**

Aspiring Data Analyst | SQL | Python | Power BI | Data Analytics

### Connect

* GitHub: `https://github.com/Mahmoudnadr122`
* LinkedIn: `https://www.linkedin.com/in/mahmoud-al-sharqwai`

---

# ⭐ Key Takeaway

> **Good SQL is not about writing more complicated queries.**
>
> **Good SQL is about asking better analytical questions, finding the right data, choosing the right level of granularity, and turning the result into something the business can understand and act on.**

---

## 📌 Repository Status

```text
Project Type   : SQL Analytics Case Study
Database       : SQL Server
Architecture   : Dimensional / Star Schema
Main Schema    : gold
Analysis       : Sales, Customer & Product Analytics
Reporting      : Customer Report + Product Report
BI Layer       : Dashboard / Reporting
Focus          : Business Intelligence & Analytical SQL
```
