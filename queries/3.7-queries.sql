-- 10 top countries per costumer count
SELECT
 country.country_id,
 country.country,
 COUNT(DISTINCT customer.customer_id) AS customer_count
FROM
 public.country
JOIN
 public.city ON country.country_id = city.country_id
JOIN
 public.address ON city.city_id = address.city_id
JOIN
 public.customer ON address.address_id = customer.address_id
GROUP BY
 country.country_id
ORDER BY
 customer_count DESC
LIMIT 10;

-- top 10 cities from top countires
SELECT Min(ct.city_id), max(cy.country)as country, ct.city FROM country cy
JOIN
 city ct ON cy.country_id = ct.country_id
JOIN
 address a ON ct.city_id = a.city_id
JOIN
 customer c ON a.address_id = c.address_id
WHERE
 cy.country_id IN (44, 23, 103, 50, 60, 15, 80, 75, 97, 45)
GROUP BY
 ct.city
LIMIT 10;

-- Top 5 customers form the top cities
SELECT c.customer_id, c.first_name as "first name", c.last_name as "last name", ct.city,
cy.country, SUM(p.amount) as total_amount_paid
FROM
 customer c
JOIN
 payment p ON c.customer_id = p.customer_id
JOIN
 rental r ON p.rental_id = r.rental_id
JOIN
 address a ON c.address_id = a.address_id
join city ct on a.city_id=ct.city_id
JOIN country cy on ct.country_id = cy.country_id
where ct.city in
('Aurora','Tokat','Tarsus','Atlixco','Emeishan','Pontianak','Shimoga','Aparecida de
Goinia','Zalantun','Taguig')
GROUP BY
 c.customer_id,
ct.city,
cy.country
ORDER BY
 total_amount_paid DESC
LIMIT 5;