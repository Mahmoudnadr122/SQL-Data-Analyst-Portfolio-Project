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
