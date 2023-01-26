use sakila;

# 1 Get release years.

select release_year from film;
# 2 Get all films with ARMAGEDDON in the title.

select * from film
where title like '%armageddon%';
# 3 Get all films which title ends with APOLLO.
select * from film
where title like 'apollo%';

# 4 Get 10 the longest films.
select * from film
order by length ASC
limit 10;
# 5 How many films include Behind the Scenes content?
select * from film
where special_features like '%Behind the Scenes%';
# 6 Drop column picture from staff.
ALTER TABLE staff
drop column picture;
# 7 A new person is hired to help Jon.
# Her name is TAMMY SANDERS, and she is a customer.
# Update the database accordingly.

select *from customer
where first_name like '%Tammy%'; # customer_id = 75  

SET SQL_SAFE_UPDATES = 0;

INSERT INTO staff
VALUES (3,'TAMMY','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org','2','1','TAMMY',
'8cb2237d0679ca88db6464eac60da96345513964','2023-01-26 2:48:00');
#Verificar cambio
select * from staff
where first_name = 'TAMMY';
# cambio para que la fecha sea automatica
UPDATE staff
SET staff_id = 3,
	first_name = 'TAMMY',
    last_name = 'SANDERS',
    address_id = '79',
    email = 'TAMMY.SANDERS@sakilacustomer.org',
    store_id = '2',
    active = '1',
	username = 'TAMMY',
    password = '8cb2237d0679ca88db6464eac60da96345513964',
    last_update = DATE_FORMAT(CURDATE() ,'%Y-%m-%d %H:%M:%S') 
where staff_id = 3;
# 8  Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
select * from sakila.customer 
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select * from film
where title like'%Academy Dinosaur%';
select rental_id from sakila.rental
order by rental_id DESC
limit 1; # 16050 siguiente id

INSERT INTO rental
VALUES (16050,'2005-05-25 04:06:21','workday','1','130','2005-05-25 23:55:21',
'3','2023-01-25 11:06:38');

# rental_id, rental_date, day_type, inventory_id, customer_id, return_date, staff_id, last_update
#'32', '2005-05-25 04:06:21', 'workday', '3832', '230', '2005-05-25 23:55:21', '3', '2023-01-25 11:06:38'

select * from inventory
where film_id = 1;
# 9 Delete non-active users, but first,
# create a backup table deleted_users to store customer_id,
# email, and the date for the users that would be deleted. Follow these steps:
 # Check if there are any non-active users
select * from customer
where Active = 1;
 # Create a table backup table as suggested
create table deleted_users(
	customer_id int(11) UNIQUE NOT NULL,
    store_id int not null,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(320),
    address_id int not null,
    active BINARY ,
    create_date DATE,
    last_update DATE,
  CONSTRAINT PRIMARY KEY (customer_id)
  #CONSTRAINT FOREIGN KEY (store_id) REFERENCES store(store_id),
  #CONSTRAINT FOREIGN KEY (address_id) REFERENCES address(address_id)
);


# customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update
#1, 1, MARY, SMITH, MARY.SMITH@sakilacustomer.org, 5, 1, 2006-02-14 22:04:36, 2006-02-15 04:57:20

