--1.Find top 3 outlets by cuisine type without using limit and top function

with cte as (select Cuisine,Restaurant_id,count(*) as no_of_orders
from food_orders
group by Cuisine,Restaurant_id)
select * from(
select * 
,ROW_NUMBER() over(partition by cuisine order by no_of_orders desc) as rn
from cte) a
where rn =1

--2.Find the daily new customer count from the launch date(everyday how many new customers are we acquring)
with cte as(select Customer_code,cast(min(Placed_at)as date) as first_order_date
from food_orders
group by Customer_code)

select first_order_date,COUNT(*) as no_of_new_customers
from cte
group by first_order_date
order by first_order_date;

--3.Count of all the users who were acquired in JAN 2025 AND only placed one order in Jan and did not place any OTHER order
select Customer_code,COUNT(*) AS no_of_orders
from food_orders
where MONTH(Placed_at)=1 and YEAR(Placed_at)=2025
and Customer_code not in (select distinct Customer_code
from food_orders
where not (MONTH(Placed_at)=1 AND YEAR(Placed_at)=2025)
)
group by Customer_code
having COUNT(*)=1
;

--4.List all the customers with no order in the last 7 days but were acquired one month ago with their first order on promo
with cte as(
select Customer_code,MIN(Placed_at) as first_order_date,
MAX(Placed_at) as latest_order_date
from food_orders
group by Customer_code)
select cte.*,food_orders.Promo_code_Name as first_order_promo from cte
inner join food_orders on cte.Customer_code=food_orders.Customer_code and cte.first_order_date=food_orders.Placed_at
where latest_order_date < DATEADD(DAY,-7,GETDATE())
and first_order_date < DATEADD(MONTH,-1,GETDATE()) and food_orders.Promo_code_Name is not null

--5.Growth team is planning to create trigger that will target customers after their 
--every third order with a personalized communication and they have asked you to create a query for this
with cte as(
select *
,ROW_NUMBER() OVER (partition by Customer_code order by Placed_at) as order_number
from food_orders
)
select * from cte
where order_number%3=0 and cast(Placed_at as date) = cast(GETDATE() as date)

--6.list customers who placed more than 1 order and all their orders on promo only
select Customer_code,count(*) as no_of_orders,count(Promo_code_Name) as promo_orders
from food_orders
group by Customer_code
having count(*)>1 and count(*)=count(Promo_code_Name);

--7.what percent of customers were organically acquired in Jan 2025.(placed their first code without promo code)
with cte as(
select *
,ROW_NUMBER() over(partition by customer_code order by placed_at) as rn
from food_orders
where MONTH(Placed_at)=1
)
select COUNT(CASE when rn=1 and Promo_code_Name is null then Customer_code end)*100.0/count(distinct Customer_code)
from cte
