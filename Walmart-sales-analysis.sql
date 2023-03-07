/* Walmart Sales Analysis */

SELECT * FROM projects.walmart;

/* sum of sales */

SELECT sum(Sales) FROM projects.walmart;

/* sum of Quantity sold */

SELECT sum(Quantity) FROM projects.walmart;

/* sum of Profit */

SELECT sum(Profit) FROM projects.walmart;

/* Category Overview */
SELECT Category,
		sum(sales) as  total_sales,
			sum(Quantity) as total_quantity,
			sum(Profit) as total_profit,
            round(sum(Profit)/sum(sales),2) as profit_per
FROM projects.walmart
group by category 
order by sum(sales) desc
;

/* top 5 category by profit */

select category ,
			sum(profit) as total_profit
	from projects.walmart
group by category
order by sum(profit) desc
limit 5;
			
/* Bottom 5 category by profit */

select category ,
			sum(profit) as total_profit
	from projects.walmart
group by category
order by sum(profit) asc
limit 5;

/* City Overview */
SELECT City,
		sum(sales) as  total_sales,
			sum(Quantity) as total_quantity,
			sum(Profit) as total_profit,
            round(sum(Profit)/sum(sales),2) as profit_per
FROM projects.walmart
group by City
order by sum(sales) desc
;
/* top 5 City by Sales */

select City ,
			sum(Sales) as total_profit
	from projects.walmart
group by City
order by sum(Sales) desc
limit 5;
			
/* Bottom 5 City by profit */

select City ,
			sum(Sales) as total_profit
	from projects.walmart
group by City
order by sum(Sales) asc
limit 5;

/* order Overview */
SELECT Order_id,
		sum(sales) as  total_sales,
			sum(Quantity) as total_quantity,
			sum(Profit) as total_profit,
            round(sum(Profit)/sum(sales),2) as profit_per
FROM projects.walmart
group by Order_id
order by sum(sales) desc
;
/* top 5 order_id by quantity */

select Order_id ,
			sum(Quantity) as total_quatity
	from projects.walmart
group by Order_id
order by sum(Quantity) desc
limit 5;
			
/* Bottom 5 order_id by quantity */

select Order_id ,
			sum(Quantity) as total_quantity
	from projects.walmart
group by Order_id
order by sum(Sales) asc
limit 5;

/* customer_name Overview */
SELECT customer_name,
		sum(sales) as  total_sales,
			sum(Quantity) as total_quantity,
			sum(Profit) as total_profit,
            round(sum(Profit)/sum(sales),2) as profit_per
FROM projects.walmart
group by customer_name
order by sum(sales) desc
;
/* top 5 customer_name by sales */

select customer_name ,
			sum(sales) as total_sales
	from projects.walmart
group by customer_name
order by sum(Quantity) desc
limit 5;
			
/* Bottom 5 customer_name by sakes */

select customer_name ,
			sum(Sales) as total_sales
	from projects.walmart
group by customer_name
order by sum(Sales) asc
limit 5;

