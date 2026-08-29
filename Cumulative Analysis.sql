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