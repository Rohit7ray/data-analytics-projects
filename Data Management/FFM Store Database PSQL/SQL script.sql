--• Basic stats on customers per city for a specific time period

Select Count(o.Customer_ID) Customer_Count, 
ins.Store_ID,
'In Store' Source
from Instore ins 
join Orders o 
on ins.Order_ID = o.Order_ID 
group by ins.Store_ID

UNION ALL

Select Count(o.Customer_ID) Customer_Count, 
ol.Store_ID,
'Online' Source
from Orders o 
join Online ol
on ol.Order_ID = o.Order_ID 
group by ol.Store_ID;


--• All products with description and prices

Select p.Product_ID, p.Description, 
sum(po.Price_Per_Unit) Purchased_price, 
p.Price Store_Price  
from Product p 
join Purchase_order po 
on po.Product_ID = p.Product_ID
group by  p.Product_ID, 
p.Description, 
p.Price; 

--• Order record and delivery details.
Select o.Order_ID,
ins.Store_ID,
'In Store' Purchased_from,
st.Locations
from Instore ins 
join Orders o 
on ins.Order_ID = o.Order_ID 
join Store st
on st.Store_ID = ins.Store_ID
group by ins.Store_ID,
o.Order_ID,
st.Locations

UNION ALL

Select o.Order_ID, 
ol.Store_ID,
'Online' Purchased_from,
ol.Address
from Orders o 
join Online ol
on ol.Order_ID = o.Order_ID 
group by ol.Store_ID,
o.Order_ID, 
ol.Address;

--• Report of product availability and their location

Select inv.Product_ID, 
inv.Store_ID, 
s.Locations, 
inv.Quantity 
from Inventory inv 
join Store s 
on inv.store_ID = s.Store_ID;

--• Monthly income generated per city/location
SELECT
 s.Store_ID,
 TO_CHAR(p.Payment_Date, 'yyyy-MM') AS month_year,
 SUM(DISTINCT p.Total_Amount) AS Total_Product_Sold_Rate,
 SUM(DISTINCT po.Price_per_unit * o.Quantity) AS Total_Product_Purchase_Rate,
 SUM(DISTINCT p.Total_Amount - (po.Price_per_unit * o.Quantity)) AS Total_Before_Commission_Deduction,
 SUM(DISTINCT ((p.Total_Amount - (po.Price_per_unit * o.Quantity)) -
 ((p.Total_Amount - (po.Price_per_unit * o.Quantity)) * s.Commission))) AS Total_After_Commission_Deduction
FROM
 Payment p
JOIN
 Orders o ON o.Order_ID = p.Order_ID
JOIN
 Product pr ON pr.Product_ID = o.Product_ID
JOIN
 Purchase_order po ON po.Product_ID = pr.Product_ID
JOIN
 Staff s ON s.Staff_ID = p.Staff_ID
GROUP BY
 s.Store_ID, TO_CHAR(p.Payment_Date, 'yyyy-MM')
ORDeR BY
 s.Store_ID;

