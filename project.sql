SELECT month(date) as month_,fsm.fiscal_year as year_, sum(sold_quantity*gross_price) FROM gdb023.fact_sales_monthly as fsm
join gdb023.fact_gross_price as fgp
on fgp.product_code = fsm.product_code
join gdb023.dim_customer as dc
on dc.customer_code = fsm.customer_code 
where customer = 'Atliq Exclusive'
group by month(date),year_ ;

select month(date) as month_, k.fiscal_year,
        sum(sold_quantity * gross_price) as gross_sales_amt
 from gdb023.fact_sales_monthly as k
 join gdb023.fact_gross_price using(product_code)
 join gdb023.dim_customer using(customer_code)
 where customer = 'Atliq Exclusive'
 group by month(date),k.fiscal_year
 order by sum(sold_quantity * gross_price) asc;
 
 
SELECT quarter(date) as Q , sum(sold_quantity) as total_quantity  from gdb023.fact_sales_monthly
where fiscal_year = 2020
group by quarter(date)
order by sum(sold_quantity) desc;