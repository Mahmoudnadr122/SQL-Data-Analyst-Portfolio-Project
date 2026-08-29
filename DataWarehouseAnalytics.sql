/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold
	
WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouseAnalytics' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create the 'DataWarehouseAnalytics' database
CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

-- Create Schemas

CREATE SCHEMA gold;
GO

CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);
GO

CREATE TABLE gold.dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date 
);
GO

CREATE TABLE gold.fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int 
);
GO

TRUNCATE TABLE gold.dim_customers;
GO

BULK INSERT gold.dim_customers
FROM 'C:\Users\mahmo\Downloads\ãÌáÏ ÌÏíÏ\gold.dim_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE gold.dim_products;
GO

BULK INSERT gold.dim_products
FROM 'C:\Users\mahmo\Downloads\ãÌáÏ ÌÏíÏ\gold.dim_products.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

TRUNCATE TABLE gold.fact_sales;
GO

BULK INSERT gold.fact_sales
FROM 'C:\Users\mahmo\Downloads\ãÌáÏ ÌÏíÏ\gold.fact_sales.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

---- Time Line --> Time Tracing Change Over Time
Select  
Datetrunc( Year , order_date) As Order_Date , 
Sum(Sales_amount) As Total_Sales , 
Count(distinct customer_key ) As Total_Customers ,
SUM(quantity) As Total_Quantity
from gold.fact_sales
where order_date is not null
group by Datetrunc( Year , order_date)
order by Datetrunc( Year , order_date);


-----------------------------------------
--> Cumulative Analysis
-----------------------------------------
Select Order_Date ,
Total_Sales , 
Sum(Total_Sales) over ( order by Order_Date) AS Total_Running_Sales
from (
Select 
DATETRUNC( Month , order_date) As Order_Date,
Sum(Sales_amount) As Total_Sales
from gold.fact_sales 
Where order_date is not null
Group by DATETRUNC( Month , order_date)
) t ; 



Select Order_Date ,
Total_Sales , 
Sum(Total_Sales) over ( order by Order_Date) AS Total_Running_Sales , 
Avg(Avg_Price) over ( order by Order_Date) AS Moving_Average_Price 
from (
Select 
DATETRUNC( Year , order_date) As Order_Date,
Sum(Sales_amount) As Total_Sales , 
AVG(price) As Avg_Price
from gold.fact_sales 
Where order_date is not null
Group by DATETRUNC( Year , order_date)
) t ; 


------------------------------------
--> Performance Analysis
-----Sales Current year vs Sales Prev Year
------------------------------------

With Yearly_Product_Sales AS (
Select 
Year(f.order_date) AS Order_Year,
p.product_name , 
Sum(f.sales_amount) AS Current_Sales
from gold.fact_sales f 
left join 
gold.dim_products p
on f.product_key = p.product_key
Where order_date is not null
Group by Year(f.order_date) , p.product_name 
) 

select 
Order_Year ,
product_name ,
Current_Sales , 
Avg(Current_Sales) over (Partition by product_name) AS Avg_Sales ,
Current_Sales - Avg(Current_Sales) over (Partition by product_name) Diff_Avg , 
Case When Current_Sales - Avg(Current_Sales) over (Partition by product_name)   > 0 Then 'Above Avg'
	 when Current_Sales - Avg(Current_Sales) over (Partition by product_name)   < 0 Then 'Below Avg'
	 else 'Avg'
End Change_Avg
from
Yearly_Product_Sales
order by product_name , Order_Year 
