### Shopify_Technical_Challenge-
2022 Data Science Internship Shopify Technical Challenge Submission 

#1.

The AOV of $3145.13 comes out directly by calculate the mean value of the order amount which is not correct. By calculating the mean value of the order amount, we did not consider the total items that a customer bought. Thus, this number would be wrong. A better way to evaluate this data is to group by the shop and use the total revenue/total order to get the correct AOV 

#2. 

In this case, I reduce the effect of outliers (shop no.78 has the most expensive sneaker price 25725 which is not normal) to make my orders more accurate

#3.

The final AOV would be $152 which is reasonable. 


##2.Sql challenge
#(1).
```sql
SELECT count(orderID) as Total_Orders FROM orders join shippers
on shippers.shipperID = orders.shipperID
where ShipperName = 'Speedy Express';
```
ANS:  54

(2).
```sql
Select orders.EmployeeID, count(orders.EmployeeID), Lastname from orders left join Employees
on orders.EmployeeID = Employees.EmployeeID
group by orders.EmployeeID
order by count(orders.EmployeeID) DESC limit 1;
```
ANS: Peacock

(3).
```sql
SELECT orderDetails.ProductID, ProductName, sum(Quantity) as total, Country FROM orders
join OrderDetails
on orders.OrderID = OrderDetails.OrderID
join customers
on orders.CustomerID = customers.CustomerID
join products
on orderDetails.ProductID = products.ProductID
where country = 'Germany'
group by orderDetails.ProductID
order by total DESC limit 1;
```
 ANS: Boston Crab meat 
