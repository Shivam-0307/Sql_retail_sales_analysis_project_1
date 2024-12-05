#          -------> SQL RETAIL SALES ANALYSIS PROJECT 1 <-------

create database sql_project_p1;

use sql_project_p1;

CREATE TABLE retail_sales 
(
   transaction_id int primary key,
   sales_date date,
   sales_time time,
   customer_id int,
   gender varchar(15),
   age varchar(255),
   quantity int,
   price_per_unit float,
   cogs float,
   total_sales float
);

  select * from retail_Sales;

# DATA CLEANING :------
# First let's check if there are any null value present in our table or not
			select * from retail_sales
			where transactions_id is null
			or sale_date is null
			or sale_time is null
			or customer_id is null
			or gender is null
			or age is null
			or category is null
			or quantiy is null
			or price_per_unit is null
			or cogs is null
			or total_sale is null;
   /* suppose if there is null value present on any column for any perticular records then by using DELETE statement we can clean our data   */
  
   DELETE FROM retail_sales
   where  
        transactions_id is null
			or sale_date is null
			or sale_time is null
			or customer_id is null
			or gender is null
			or age is null
			or category is null
			or quantiy is null
			or price_per_unit is null
			or cogs is null
			or total_sale is null;
            

/* DATA EXPLORATION :--------
  QUE 1 :- How many sales we have ?    */
      select count(total_sale) as total_sales 
      from retail_sales;
      
# Que 2 :- How may unique customers we have ?
      select count(distinct customer_id) as total_customers 
      from retail_sales;
      
# Que 3 :- How many unique categories we have ?
       select count(distinct category)as total_categories
       from retail_sales;
  
/* DATA ANALYSIS & BUSINESS KEY PROBLEMS & ANSWER:---------
  QUE 1 :- Write a sql query to retrive all colums for sales made on '05-11-2022'?   */
          select * from retail_sales
          where sale_date = '05-11-2022';
          
/* QUE 2 :- Write a sql query to retrive all transactios where the category is 'Clothing' and the quantity sold is more than 4
          in the month of nov-2022 ?   */
          
     select * from retail_sales
     where category = 'clothing'
     and quantiy >= 4
     and sale_date between '01-11-2022' and '30-11-2022';
         
# QUE 3 :- Write a sql query to calculate the total sales(total_sale) for each category.
        
			select category,sum(total_sale) as total_sale
			from retail_sales
			group by category;
            
/* QUE 4 :- Write a sql query to find the average age of customers who purchase item from 
         beauty category ? */
         
         select * from retail_sales;
         
         select round(avg(age), 2 ), category
         from retail_sales
         where category = 'beauty';
         
         
/* QUE 5 :- Write a sql query to find all transactions where the total_sale is greater
          than 1000 ?   */
          
          select * from retail_sales
          where total_sale > 1000;
          
/* Que 6:-Write a sql query to find the total number of transactions(transations_id) made by each gender
          in each category?   */
          
          select count(transactions_id) as no_of_transactions, gender, category
          from retail_sales
          group by gender,category
          order by category;
          
/* QUE 7 :- Write a sql query to find the top 5 customers base on the highest total sales ?  */
       
          select customer_id,
                 sum(total_sale) as total_sales
			from retail_sales
            group by customer_id
            order by total_sales desc
            limit 5;
            
/* QUE 8:- Write a sql query to find the number of unique customers who purchased items from each category? */
            select count(distinct customer_id) as no_of_unique_customer, category
			from retail_sales
            group by category;
            
/* QUE 9:- Wriet a sql query to create each shift and number of orders( example morning <=12, Afternoon Between 12 $ 17
            and evening > 17) ? */
           with hourly_sale as 
            (select *,
                  case
                      when Extract(hour from sale_time) < 12 then 'morning'
                      when extract(hour from sale_time) between 12 and 17 then 'afternoon'
                      else 'evening'
				  end as shift
			 from retail_sales
             )
            select shift, count(*) as totol_order
            from hourly_sale
            group by shift;
          
#---------------->END OF THIS PROJECT<------------------
          
        
          
		
          
 


