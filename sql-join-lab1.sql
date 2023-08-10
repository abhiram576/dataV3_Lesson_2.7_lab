USE sakila;
show tables;
 -- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT  category.name as category_name, COUNT(film_category.film_id) as film_count
FROM film_category
JOIN category
ON film_category.category_id= category.category_id
GROUP BY category.name;

-- 2 Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.payment;
SELECT * FROM sakila.staff;

SELECT staff.staff_id , SUM(payment.amount) as rung_amt from payment
JOIN staff
ON payment.staff_id= staff.staff_id
WHERE  payment.payment_date LIKE '2005-08%'
GROUP BY payment.staff_id;

-- 3 Which actor has appeared in the most films?
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film_actor;

SELECT concat(actor.first_name,' ',actor.last_name) AS actor_name, COUNT(film.film_id) AS films FROM actor
JOIN film_actor
ON  actor.actor_id = film_actor.actor_id
GROUP BY actor_name
ORDER BY films DESC
LIMIT 1;


-- 4  Most active customer (the customer that has rented the most number of films)
SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.film;

SELECT c.customer_id, count(r.rental_id) FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY count(r.rental_id) DESC
LIMIT 1;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;

SELECT first_name, last_name, address FROM staff
JOIN address 
ON staff.address_id= address.address_id;

-- 6 List each film and the number of actors who are listed for that film.
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT title, count(film_actor.actor_id) as actor_count from film
JOIN  film_actor
ON film.film_id= film_actor.film_id
GROUP BY film.film_id;

--  7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM payment ;
SELECT * FROM customer;

SELECT customer.last_name, sum(payment.amount) as amt FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY last_name ASC;

-- 8 List the titles of films per category.
SELECT * FROM film;
SELECT * FROM film_category;

SELECT film.title, film_category.category_id FROM film
JOIN film_category
ON film.film_id= film_category.film_id
ORDER BY category_id ;
