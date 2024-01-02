--Q1
	--Query to check for no-unfirm or duplicate data 
	SELECT first_name, last_name, email, COUNT(*) as count
	FROM public.customer
	GROUP BY first_name, last_name, email
	HAVING COUNT(*) > 1;

	--Query to check for missing values
	SELECT *
	FROM public.customer
	WHERE first_name IS NULL OR last_name IS NULL;

	--Query to check for duplicates data
	SELECT first_name, last_name, email, COUNT(*) as count
	FROM public.customer
	GROUP BY first_name, last_name, email
	HAVING COUNT(*) > 1;
	
--Q2
--min, max and average movie lenghts
SELECT
 MIN(length) AS min_length,
 MAX(length) AS max_length,
 AVG(length) AS avg_length,
 MODE() WITHIN GROUP (ORDER BY rental_rate) AS mode_rental_rate,
 MODE() WITHIN GROUP (ORDER BY replacement_cost) AS mode_replacement_cost
FROM
 public.film;

-- Descriptive statistics for the customer table
SELECT
 MIN(customer_id) AS min_customer_id,
 MAX(customer_id) AS max_customer_id,
 AVG(customer_id) AS avg_customer_id,
 MODE() WITHIN GROUP (ORDER BY store_id) AS mode_store_id,
 MODE() WITHIN GROUP (ORDER BY activebool) AS mode_activebool
FROM
 public.customer;
