

use zomato

select * from [dbo].[sales]
select * from [dbo].[product]


select a.user_id,a.product_id,b.price from [dbo].[sales] a inner join 
[dbo].[product] b on  a.product_id=b.product_id


select a.user_id, sum(price) from [dbo].[sales] a inner join 
[dbo].[product] b on  a.product_id=b.product_id
group by a.user_id


select a.user_id, sum(price) from [dbo].[sales] a inner join 
[dbo].[product] b on  a.product_id=b.product_id
where a.user_id = '1'
group by a.user_id

select a.user_id, sum(price) from [dbo].[sales] a inner join 
[dbo].[product] b on  a.product_id=b.product_id
where a.user_id = '2'
group by a.user_id

select a.user_id, sum(price) from [dbo].[sales] a inner join 
[dbo].[product] b on  a.product_id=b.product_id
where a.user_id = '3'
group by a.user_id



select user_id, count(created_at) as 'no of days each customer visited' from [dbo].[sales]
group by user_id

--first product purchased by each customer-----------------------------


select * from
(select *, rank() over (partition by user_id order by created_at) rnk from [dbo].[sales]) a where rnk =1


select a.user_id, a.created_at, b.product_name
from [dbo].[sales] a
inner join [dbo].[product] b on
a.product_id=b.product_id order by created_at


--most purchased item and how many times purchased by user-------------------------------------------------------------


where product_id =(select top 1 product_id 
from sales 
group by product_id 
order by count(product_id) desc)
group by user_id


select count(user_id), product_id
from [dbo].[sales]
group by product_id



select product_id, count (product_id) from sales group by
product_id order by count(product_id) desc