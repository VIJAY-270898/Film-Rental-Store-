use film_rental;

-- Top Revenue Categories and percentage of revenue from each category 

with cte as 
 ( select 
	A.category_id as cate_id, A.name as genre,sum(amount) as total,avg(amount) as jj
   from
		 category A join film_category B using(category_id)
		 join film C using(film_id) 
		 join inventory D using(film_id) 
		 join rental E using(inventory_id) 
		 join payment F using(rental_id)
group by 
	A.category_id,A.name) 
select 
	cate_id as category_id, genre as name, total as total_revenue,total/(select sum(total) from cte)*100 as percentage_of_overall_avg_revenue
 from 
	cte
order by 
	total desc ;
    
    