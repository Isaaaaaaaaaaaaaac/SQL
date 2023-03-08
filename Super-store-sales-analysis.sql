
/*


SUPER STORE SALES ANALYSIS


*/




/*Find the total sales and profit for each category:*/

SELECT Category, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Category
ORDER BY TotalSales DESC;

/*Find the top 10 products by sales:*/

SELECT ProductName, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 10;

/*Find the number of orders placed by each customer:*/

SELECT CustomerName, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerName
ORDER BY TotalOrders DESC;

/*Find the average discount for each category:*/

SELECT Category, AVG(Discount) AS AvgDiscount
FROM Orders
GROUP BY Category;

/*Find the number of returned orders for each category:*/

SELECT Category, COUNT(*) AS TotalReturns
FROM Returns
JOIN Orders ON Returns.OrderID = Orders.OrderID
GROUP BY Category
ORDER BY TotalReturns DESC;

/*Find the total sales and profit for each year:*/

SELECT YEAR(OrderDate) AS OrderYear, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear ASC;

/*Find the top 10 customers by profit:*/

SELECT CustomerName, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY CustomerName
ORDER BY TotalProfit DESC
LIMIT 10;


/*Find the number of orders and total sales for each sub-category in the Technology category:*/

SELECT SubCategory, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
WHERE Category = 'Technology'
GROUP BY SubCategory
ORDER BY TotalSales DESC;

/*Find the top 10 customers with the highest average sales per order:*/

SELECT CustomerName, AVG(Sales) AS AvgSales
FROM Orders
GROUP BY CustomerName
ORDER BY AvgSales DESC
LIMIT 10;

/*Find the total sales and profit for each region:*/

SELECT Region, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Region
ORDER BY TotalSales DESC;

/*Find the average shipping time for each category:*/

SELECT Category, AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgShippingTime
FROM Orders
GROUP BY Category;

/*Find the top 10 products with the highest profit margin:*/

SELECT ProductName, (SUM(Profit)/SUM(Sales))*100 AS ProfitMargin
FROM Orders
GROUP BY ProductName
ORDER BY ProfitMargin DESC
LIMIT 10;

/*Find the number of orders and total sales for each month:*/

SELECT DATEPART(month, OrderDate) AS OrderMonth, SUM(Sales) AS TotalSales, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY DATEPART(month, OrderDate)
ORDER BY OrderMonth ASC;

/*Find the total sales and profit for each country:*/

SELECT Country, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Country
ORDER BY TotalSales DESC;

/*Find the number of orders and total sales for each year and category:*/

SELECT YEAR(OrderDate) AS OrderYear, Category, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY YEAR(OrderDate), Category
ORDER BY OrderYear ASC;

/*Find the top 10 products with the highest return rate:*/

SELECT ProductName, COUNT(ReturnID) AS TotalReturns, COUNT(OrderID) AS TotalOrders, (COUNT(ReturnID)*1.0/COUNT(OrderID))*100 AS ReturnRate
FROM Orders
LEFT JOIN Returns ON Orders.OrderID = Returns.OrderID
GROUP BY ProductName
ORDER BY ReturnRate DESC
LIMIT 10;

/*Find the top 10 cities with the highest sales:*/

SELECT City, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 10;

/*Find the number of orders and total sales for each quarter:*/

SELECT DATEPART(quarter, OrderDate) AS OrderQuarter, SUM(Sales) AS TotalSales, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY DATEPART(quarter, OrderDate)
ORDER BY OrderQuarter ASC;

/*Find the top 10 customers who have made the most orders:*/

SELECT CustomerName, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerName
ORDER BY TotalOrders DESC
LIMIT 10;

/*Find the total sales and profit for each state:*/

SELECT State, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY State
ORDER BY TotalSales DESC;


/*Find the top 10 products with the highest sales in each sub-category:*/

SELECT SubCategory, ProductName, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY SubCategory, ProductName
ORDER BY SubCategory ASC, TotalSales DESC
LIMIT 10;

/*Find the total sales and profit for each month in each category:*/

SELECT Category, DATEPART(month, OrderDate) AS OrderMonth, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Category, DATEPART(month, OrderDate)
ORDER BY Category ASC, OrderMonth ASC;

/*Find the number of orders and total sales for each region and year:*/

SELECT Region, YEAR(OrderDate) AS OrderYear, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Region, YEAR(OrderDate)
ORDER BY Region ASC, OrderYear ASC;

/*Find the top 10 products with the highest discount rate:*/

SELECT ProductName, AVG(Discount)*100 AS DiscountRate
FROM Orders
GROUP BY ProductName
ORDER BY DiscountRate DESC
LIMIT 10;

/*Find the number of orders and total sales for each month in each region:*/

SELECT Region, DATEPART(month, OrderDate) AS OrderMonth, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Region, DATEPART(month, OrderDate)
ORDER BY Region ASC, OrderMonth ASC;

/*Find the top 10 customers with the highest total sales:*/

SELECT CustomerName, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 10;

/*Find the total sales and profit for each category and year:*/

SELECT Category, YEAR(OrderDate) AS OrderYear, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Category, YEAR(OrderDate)
ORDER BY Category ASC, OrderYear ASC;

/*Find the top 5 cities with the highest profit:*/

SELECT City, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY City
ORDER BY TotalProfit DESC
LIMIT 5;

/*Find the number of orders and total sales for each day of the week:*/

SELECT DATEPART(weekday, OrderDate) AS OrderDayOfWeek, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY DATEPART(weekday, OrderDate)
ORDER BY OrderDayOfWeek ASC;

/*Find the top 10 customers who have the highest average order value:*/

SELECT CustomerName, AVG(Sales) AS AvgOrderValue
FROM Orders
GROUP BY CustomerName
ORDER BY AvgOrderValue DESC
LIMIT 10;

/*Find the total sales and profit for each sub-category:*/

SELECT SubCategory, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY SubCategory
ORDER BY TotalSales DESC;

/*Find the number of orders and total sales for each quarter in each category:*/

SELECT Category, DATEPART(quarter, OrderDate) AS OrderQuarter, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Category, DATEPART(quarter, OrderDate)
ORDER BY Category ASC, OrderQuarter ASC;

/*Find the top 5 states with the highest profit:*/

SELECT State, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY State
ORDER BY TotalProfit DESC
LIMIT 5;

/*Find the total sales and profit for each region:*/

SELECT Region, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Region
ORDER BY TotalSales DESC;


/*Find the top 10 products with the highest profit margin:*/

SELECT ProductName, (SUM(Profit) / SUM(Sales))*100 AS ProfitMargin
FROM Orders
GROUP BY ProductName
ORDER BY ProfitMargin DESC
LIMIT 10;

/*Find the number of orders and total sales for each year:*/

SELECT YEAR(OrderDate) AS OrderYear, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear ASC;

/*Find the top 5 customers with the highest profit:*/

SELECT CustomerName, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY CustomerName
ORDER BY TotalProfit DESC
LIMIT 5;

/*Find the total sales and profit for each category and sub-category:*/

SELECT Category, SubCategory, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY Category, SubCategory
ORDER BY TotalSales DESC;

/*Find the top 10 products with the highest shipping cost:*/

SELECT ProductName, SUM(ShippingCost) AS TotalShippingCost
FROM Orders
GROUP BY ProductName
ORDER BY TotalShippingCost DESC
LIMIT 10;

/*Find the number of orders and total sales for each month:*/

SELECT DATEPART(month, OrderDate) AS OrderMonth, COUNT(OrderID) AS TotalOrders, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY DATEPART(month, OrderDate)
ORDER BY OrderMonth ASC;

/*Find the top 5 categories with the highest average profit per order:*/

SELECT Category, AVG(Profit) AS AvgProfitPerOrder
FROM Orders
GROUP BY Category
ORDER BY AvgProfitPerOrder DESC
LIMIT 5;


/*Find the top 5 states with the highest shipping cost:*/

SELECT State, SUM(ShippingCost) AS TotalShippingCost
FROM Orders
GROUP BY State
ORDER BY TotalShippingCost DESC
LIMIT 5;

/*Find the top 10 customers with the highest number of orders:*/

SELECT CustomerName, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerName
ORDER BY TotalOrders DESC
LIMIT 10;

/*Find the total sales and profit for each month and year:*/

SELECT DATEPART(year, OrderDate) AS OrderYear, DATEPART(month, OrderDate) AS OrderMonth, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY DATEPART(year, OrderDate), DATEPART(month, OrderDate)
ORDER BY OrderYear ASC, OrderMonth ASC;

/*Find the top 10 products with the highest number of orders:*/

SELECT ProductName, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY ProductName
ORDER BY TotalOrders DESC
LIMIT 10;

/*Find the top 5 customers with the highest sales:*/

SELECT CustomerName, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 5;

/*Find the total sales and profit for each year and quarter:*/

SELECT YEAR(OrderDate) AS OrderYear, DATEPART(quarter, OrderDate) AS OrderQuarter, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit
FROM Orders
GROUP BY YEAR(OrderDate), DATEPART(quarter, OrderDate)
ORDER BY OrderYear ASC, OrderQuarter ASC;

/*Find the top 5 categories with the highest sales:*/

SELECT Category, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Category
ORDER BY TotalSales DESC
LIMIT 5;
