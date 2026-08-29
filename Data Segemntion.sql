---------------------------
--> Product Segmention <--
---------------------------

with Product_Segmention AS (
Select 
product_key , 
product_name , 
cost , 
case when cost < 100 then 'Below 100'
	when cost between 100 and 500 then '100-500'
	when cost between 500 and 1000 then '500-1000'
	else 'Above 1000'
End Cost_Range
from gold.dim_products
)

Select 
Cost_Range ,
count(product_key) As Total_Products
from Product_Segmention
group by Cost_Range
order by Total_Products DESC 






