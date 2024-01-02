--Q1
	--total amount paid from the top 5 customers sub query
	select avg (total_amount_paid) as average from
	(SELECT c.customer_id, c.first_name, c.last_name, ct.city, SUM(p.amount) AS
	total_amount_paid
	FROM customer c
	left JOIN
	 payment p ON c.customer_id = p.customer_id
	inner JOIN
	 rental r ON p.rental_id = r.rental_id
	inner JOIN
	 address a ON c.address_id = a.address_id
	inner join city ct on a.city_id=ct.city_id
	where ct.city_id in (42,517,538,473,40,157,412,529,28,592)
	GROUP BY
	 c.customer_id,
	 c.first_name,
	 c.last_name,
	ct.city
	ORDER BY
	 total_amount_paid DESC
	LIMIT 5) as total_amount_paid
-- Q2
	--  custommer count
	SELECT
	 outer_query.country,
	outer_query.customer_count,
	inner_query.customer_id,
	inner_query.first_name,
	inner_query.last_name,
	inner_query.total_amount_paid
	FROM
	 (
	 SELECT
	 cy.country,
	COUNT(DISTINCT customer.customer_id) AS customer_count
	 FROM
	 customer
	 JOIN
	 address ad ON customer.address_id = ad.address_id
	 JOIN
	 city ct ON ad.city_id = ct.city_id
	 JOIN
	 country cy ON ct.country_id = cy.country_id
	 GROUP BY
	 cy.country
	 ORDER BY
	 cy.country
	 ) AS outer_query
	LEFT JOIN
	 (
	 SELECT
	 c.customer_id,
	c.first_name,
	c.last_name,
	MAX(cy.country) AS country,
	SUM(p.amount) AS total_amount_paid
	 FROM
	 customer c
	 JOIN
	 payment p ON c.customer_id = p.customer_id
	 JOIN
	 rental r ON p.rental_id = r.rental_id
	 JOIN
	 address a ON c.address_id = a.address_id
	 JOIN
	 city ct ON a.city_id = ct.city_id
	 JOIN
	 country cy ON ct.country_id = cy.country_id
	 WHERE
	 ct.city_id IN (42, 517, 538, 473, 40, 157, 412, 529, 28, 592)
	 GROUP BY
	 c.customer_id,
	c.first_name,
	c.last_name
	 ORDER BY
	 total_amount_paid DESC
	 LIMIT 5
	 ) AS inner_query ON outer_query.country = inner_query.country;