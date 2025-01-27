CREATE DATABASE walmartsaledata;

USE walmartsaledata;

CREATE TABLE sale (
	invoice_id VARCHAR(30) PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(50) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    tax_prct FLOAT(6, 4) NOT NULL,
    TOTAL DECIMAL(10, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(50) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_prct FLOAT(11, 9),
    gross_income DECIMAL(12, 9),
    rating FLOAT(2, 1)
);

-- Data Cleaning

SELECT * FROM sale;

-- Add the time_of_day column

SELECT 
	time, 
		(CASE 
			WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
            WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
            ELSE 'Evening'
		END) AS time_of_day
FROM sale;

ALTER TABLE sale
ADD COLUMN time_of_day VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sale SET time_of_day = (
		CASE 
			WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
            WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
            ELSE 'Evening'
		END
	);
    
SELECT invoice_id, time_of_day FROM sale;

-- Add day_name column

SELECT date, DAYNAME(date) FROM sale;

ALTER TABLE sale
ADD COLUMN day_name VARCHAR(20);

UPDATE sale
SET day_name = DAYNAME(date);

SELECT invoice_id, day_name FROM sale;

-- Add month_name Column

SELECT date, MONTHNAME(date) FROM sale;

ALTER TABLE sale
ADD COLUMN month_name VARCHAR(20);

UPDATE sale
SET month_name = MONTHNAME(date);

SELECT invoice_id, month_name FROM sale;

SELECT * FROM sale;

----- GENERIC Questions ------

#Q1. -- How many unique cities does the data have?

SELECT DISTINCT city FROM sale;

#Q2. -- In which city is each branch?

SELECT DISTINCT branch, city 
FROM sale
ORDER BY branch;

----- PRODUCT Questions ------

#Q3. -- How many unique product lines does the data have?

SELECT DISTINCT product_line 
FROM sale;

#Q4. -- What is the most selling product line

 SELECT product_line, SUM(quantity) AS 'TotalQuantitySold'
 FROM sale
 GROUP BY product_line
 ORDER BY TotalQuantitySold DESC;
 
 #Q5. -- What is the total revenue by month
 
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sale
GROUP BY month_name 
ORDER BY total_revenue;

#Q6. -- What month had the largest COGS?

SELECT month_name AS 'Month', SUM(cogs) AS 'Total COGS'
FROM sale
GROUP BY month_name
ORDER BY SUM(cogs) DESC;

#Q7. -- What product line had the largest revenue?

SELECT 
	product_line AS 'product', 
	SUM(TOTAL) AS 'Revenue'
FROM sale
GROUP BY product_line
ORDER BY Revenue DESC;

#Q8. -- What is the city with the largest revenue?

SELECT branch, city, SUM(total) AS total_revenue
FROM sale
GROUP BY branch, city
ORDER BY total_revenue DESC;

#Q9. -- What product line had the largest VAT?

SELECT product_line, AVG(tax_prct) AS avg_tax
FROM sale
GROUP BY product_line
ORDER BY avg_tax DESC;

#Q10. -- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

SELECT AVG(quantity) FROM sale;

SELECT 
	product_line,
		CASE WHEN AVG(quantity) > 5.4995 THEN 'Good'
        ELSE 'Bad'
        END AS remark
FROM sale
GROUP BY product_line;

#Q11. -- Which branch sold more products than average product sold?

SELECT AVG(quantity) FROM sale;

SELECT branch, SUM(quantity) AS qty_sold
FROM sale
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sale);

#Q12. -- What is the most common product line by gender

SELECT gender, product_line, COUNT(gender) AS total_count 
FROM sale
GROUP BY gender, product_line
ORDER BY total_count DESC;

#Q13. -- What is the average rating of each product line


SELECT product_line, ROUND(AVG(rating),2) AS avg_rating
FROM sale
GROUP BY product_line
ORDER BY avg_rating DESC;

-------------------------- Question Customers -------------------------------

#Q14. -- How many unique customer types does the data have?

SELECT DISTINCT customer_type 
FROM sale;

#Q15. -- How many unique payment methods does the data have?

SELECT DISTINCT payment 
FROM sale;

#Q16. -- What is the most common customer type?

SELECT customer_type, COUNT(*) AS count
FROM sale
GROUP BY customer_type
ORDER BY count DESC;

#Q17. -- Which customer type buys the most?

SELECT customer_type, COUNT(*) AS count
FROM sale
GROUP BY customer_type;

#Q18. -- What is the gender of most of the customers?

SELECT gender, COUNT(*) AS gender_count
FROM sale
GROUP BY gender
ORDER BY gender_count DESC;

#Q19. -- What is the gender distribution per branch?

SELECT branch, gender, COUNT(*) AS gender_cnt
FROM sale
GROUP BY branch, gender
ORDER BY branch;

#Q20. -- Which time of the day do customers give most ratings?

SELECT time_of_day, AVG(rating) AS avg_rating
FROM sale
GROUP BY time_of_day
ORDER BY avg_rating DESC;

#Q21. -- Which time of the day do customers give most ratings per branch?

SELECT branch, time_of_day, AVG(rating) AS avg_rating
FROM sale
GROUP BY branch, time_of_day
ORDER BY branch;

#22. -- Which day of the week has the best avg ratings?

SELECT day_name, AVG(rating) AS avg_rating
FROM sale
GROUP BY day_name
ORDER BY avg_rating DESC;

#23. -- Which day of the week has the best average ratings per branch?

SELECT branch, day_name, AVG(rating) AS avg_rating
FROM sale
GROUP BY branch, day_name
ORDER BY branch, avg_rating DESC;

 ---------------------------- Questions Sales ---------------------------------

#24. -- Number of sales made in each time of the day per weekday 

SELECT time_of_day, COUNT(*) AS total_sales 
FROM sale
WHERE day_name = 'Sunday'
GROUP BY time_of_day
ORDER BY total_sales DESC;

#25. -- Which of the customer types brings the most revenue?

SELECT customer_type, SUM(total) AS revenue
FROM sale
GROUP BY customer_type
ORDER BY revenue DESC;

#Q26. -- Which city has the largest tax/VAT percent?

SELECT city, ROUND(AVG(tax_prct),2) AS avg_tax
FROM sale
GROUP BY city
ORDER BY avg_tax DESC;

#27. -- Which customer type pays the most in VAT?

SELECT customer_type, AVG(tax_prct) AS avg_total_tax
FROM sale
GROUP BY customer_type
ORDER BY avg_total_tax DESC;

-- -------------------------------------------------------------------- 
-- --------------------------------------------------------------------