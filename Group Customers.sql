/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/

With Customer_Spanding AS (

Select 
C.customer_key ,
SUM(F.Sales_amount) AS Total_Spanding,  
MIN(order_date) AS First_Order  , 
MAX(order_date) AS Last_order , 
DATEDIFF(month , MIN(order_date) , MAX(order_date)) AS lifespan
from gold.fact_sales f 
left join gold.dim_customers C
on f.customer_key = C.customer_key
group by C.customer_key 
) 

Select 
customer_segment  , 
count(customer_key) AS Total_Customers
from (
	Select 
	customer_key , 
	Case when lifespan >= 12 and Total_Spanding > 5000 then 'VIP' 
		 when lifespan >= 12 and Total_Spanding <= 5000 then 'Regular'
		 else 'New'
	End Customer_Segment
	from Customer_Spanding
) t 
group by Customer_Segment
order by Total_Customers desc