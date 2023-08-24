# CREATE TABLE cars(
#     id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
#     model VARCHAR(255) NOT NULL,
#     distance FLOAT UNSIGNED DEFAULT 0,
#     price FLOAT UNSIGNED DEFAULT 1
# );

 # CREATE TABLE drivers(
 #   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 #   car_id INT UNSIGNED,
 #   name VARCHAR(50) NOT NULL,
 #   phone VARCHAR(15) UNIQUE NOT NULL,

 #   FOREIGN KEY (car_id) REFERENCES cars(id)
# );

 # CREATE TABLE customers(
 #   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 #   name VARCHAR(50) NOT NULL,
 #   phone VARCHAR(15) UNIQUE NOT NULL
 #  );

# CREATE TABLE orders(
#    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
#   customer_id INT UNSIGNED,
#    driver_id INT UNSIGNED,
#    start VARCHAR(255) NOT NULL,
#    finish VARCHAR(255) NOT NULL,
#   price FLOAT NOT NULL,

#   FOREIGN KEY (customer_id) REFERENCES customers(id),
#   FOREIGN KEY (driver_id) REFERENCES drivers(id)
# );

# CREATE TABLE test(
#   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
# );

# ALTER TABLE test ADD COLUMN name VARCHAR(50) NOT NULL

# INSERT INTO cars (model, price)
# VALUES
#    ('Skoda Octavia', 25),
#    ('Volkswagen Polo', 25),
#    ('Renault Logan', 27),
#    ('Toyota Camry', 30),
#    ('Tesla Model S', 35)

# UPDATE cars SET model = 'Kia Rio' WHERE id = 2;
# UPDATE cars SET price = 20 WHERE id = 1;
# UPDATE cars SET price = 23 WHERE id = 2
# UPDATE cars SET distance = 532.6 WHERE id = 1;
# UPDATE cars SET distance = 682.3 WHERE id = 2;
# UPDATE cars SET distance = 326.0 WHERE id = 3;
# UPDATE cars SET distance = 212.1 WHERE id = 4;
# UPDATE cars SET distance = 778.9 WHERE id = 5;
# UPDATE cars SET distance = 180.7 WHERE id = 6;

# INSERT INTO drivers
# (car_id, name, phone)
# VALUES
#    (1, 'Ivan', '(888-999)'),
#    (2, 'Anton', '(444-444)'),
#    (3, 'Andrey', '(575-365)'),
#    (4, 'Alexander', '(123-321)'),
#    (5, 'Dmitriy', '(900-023)');

# INSERT INTO customers
# (name, phone)
# VALUES
#    ('Maria', '(783-662)'),
#    ('Artem', '(232-123)'),
#    ('Sofia', '(265-663)'),
#    ('Nikita', '(426-272)'),
#    ('Katya', '(888-929)');

# INSERT INTO orders
# (customer_id, driver_id, start, finish, price)
# VALUES
#    (1, 3, 'E', 'C', 210),
#    (2, 5, 'A', 'B', 565),
#    (3, 1, 'C', 'E', 115),
#    (4, 2, 'B', 'A', 545),
#    (5, 4, 'С', 'A', 335);

SELECT * FROM cars
WHERE price < 27 AND distance < 550
ORDER BY price DESC;

SELECT drivers.*, cars.model
FROM drivers, cars
WHERE drivers.car_id = cars.id;

SELECT cars.*, d.name
FROM cars
LEFT JOIN drivers d on cars.id = d.car_id;

SELECT start, COUNT(id)
FROM orders
GROUP BY start;

SELECT o.id, o.start, o.finish, o.price, c.name as 'Customer name', c.phone as 'Customer phone',
       d.name as 'Driver name', d.phone as 'Driver phone',
       cars.model as model
FROM orders o, customers c, drivers d, cars
WHERE o.driver_id = d.id AND o.customer_id = c.id AND d.car_id = cars.id
ORDER BY price DESC;


