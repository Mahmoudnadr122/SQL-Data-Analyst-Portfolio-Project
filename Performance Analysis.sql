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
End Change_Avg , 
LAG(Current_Sales) over (Partition by product_name order by order_year) Py_Sales , 
Current_Sales - LAG(Current_Sales) over (Partition by product_name order by order_year) Diff_Py , 
Case When Current_Sales - LAG(Current_Sales) over (Partition by product_name order by order_year)   > 0 Then 'Increase'
	 when Current_Sales - LAG(Current_Sales) over (Partition by product_name order by order_year)   < 0 Then 'Decreace'
	 ELSE 'No Change'
End Py_Avg 
from
Yearly_Product_Sales
order by product_name , Order_Year 
