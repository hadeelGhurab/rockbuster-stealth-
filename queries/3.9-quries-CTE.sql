--Q1
WITH TopCustomers AS (
 SELECT c.customer_id, c.first_name, c.last_name, ct.city,
 SUM(p.amount) AS total_amount_paid
 FROM
 customer c
 LEFT JOIN
 payment p ON c.customer_id = p.customer_id
 INNER JOIN
 rental r ON p.rental_id = r.rental_id
 INNER JOIN
 address a ON c.address_id = a.address_id
 INNER JOIN
 city ct ON a.city_id = ct.city_id
 WHERE
 ct.city_id IN (42, 517, 538, 473, 40, 157, 412, 529, 28, 592)
 GROUP BY
 c.customer_id,
 c.first_name,
 c.last_name,
 ct.city
 ORDER BY
 total_amount_paid DESC
 LIMIT 5
)
SELECT AVG(total_amount_paid) AS average
FROM TopCustomers;

--Q2
WITH CountryCustomerCount AS (
 SELECT
 cy.country, COUNT(DISTINCT customer.customer_id) AS customer_count
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
),
TopCustomers AS (
 SELECT c.customer_id, c.first_name, c.last_name, MAX(cy.country) AS country,
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
 GROUP BY c.customer_id, c.first_name, c.last_name
 ORDER BY
 total_amount_paid DESC
 LIMIT 5
)
SELECT cc.country, cc.customer_count, tc.customer_id, tc.first_name, tc.last_name,
tc.total_amount_paid
FROM
 CountryCustomerCount cc
LEFT JOIN
 TopCustomers tc ON cc.country = tc.country;
